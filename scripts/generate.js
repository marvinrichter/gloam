import { readFileSync, writeFileSync, mkdirSync, globSync } from "node:fs";
import { join } from "node:path";

import { generateStarship }        from "./generators/starship.js";
import { generateIterm2 }          from "./generators/iterm2.js";
import { generateAlacritty }       from "./generators/alacritty.js";
import { generateKitty }           from "./generators/kitty.js";
import { generateWezterm }         from "./generators/wezterm.js";
import { generateGhostty }         from "./generators/ghostty.js";
import { generateWindowsTerminal } from "./generators/windows-terminal.js";
import { generateVscode }          from "./generators/vscode.js";
import { generateNeovim }          from "./generators/neovim.js";
import { generateIntellij }        from "./generators/intellij.js";
import { generateZed }             from "./generators/zed.js";

// Each entry is { filename, fn }.
// The filename is the app name + its native extension — lives alongside the
// theme source in themes/<name>/<filename>.
const TARGETS = [
  { filename: "starship.toml",          fn: generateStarship },
  { filename: "iterm2.itermcolors",     fn: generateIterm2 },
  { filename: "alacritty.toml",         fn: generateAlacritty },
  { filename: "kitty.conf",             fn: generateKitty },
  { filename: "wezterm.lua",            fn: generateWezterm },
  { filename: "ghostty",                fn: generateGhostty },
  { filename: "windows-terminal.json",  fn: generateWindowsTerminal },
  { filename: "vscode.json",            fn: generateVscode },
  { filename: "neovim.lua",             fn: generateNeovim },
  { filename: "intellij.icls",          fn: generateIntellij },
  { filename: "zed.json",               fn: generateZed },
];

const HEX_RE = /^#[0-9A-Fa-f]{6}$/;
const REQUIRED_TOKENS = ["primary", "accent", "muted", "error"];

/**
 * Validate a theme object. Returns an array of error strings (empty array = valid).
 * @param {object} obj
 * @returns {string[]}
 */
export function validateTheme(obj) {
  const errors = [];

  for (const field of ["name", "type", "background", "foreground", "tokens", "ansi"]) {
    if (obj[field] === undefined) errors.push(`missing required field "${field}"`);
  }

  if (obj.type !== undefined && obj.type !== "dark" && obj.type !== "light") {
    errors.push(`"type" must be "dark" or "light", got "${obj.type}"`);
  }

  for (const field of ["background", "foreground"]) {
    if (obj[field] !== undefined && !HEX_RE.test(obj[field])) {
      errors.push(`"${field}" must be a 6-digit hex color (#RRGGBB), got "${obj[field]}"`);
    }
  }

  if (obj.ansi !== undefined) {
    if (!Array.isArray(obj.ansi) || obj.ansi.length !== 16) {
      errors.push(`"ansi" must be an array of exactly 16 color values`);
    } else {
      for (let i = 0; i < 16; i++) {
        if (!HEX_RE.test(obj.ansi[i])) {
          errors.push(`"ansi[${i}]" must be a 6-digit hex color (#RRGGBB), got "${obj.ansi[i]}"`);
        }
      }
    }
  }

  if (obj.tokens !== undefined) {
    for (const token of REQUIRED_TOKENS) {
      if (obj.tokens[token] === undefined) {
        errors.push(`"tokens.${token}" is required`);
      } else if (!HEX_RE.test(obj.tokens[token])) {
        errors.push(`"tokens.${token}" must be a 6-digit hex color (#RRGGBB), got "${obj.tokens[token]}"`);
      }
    }
  }

  return errors;
}

/**
 * Generate all format files for every theme into themesDir.
 * Each theme gets its own subdirectory: themesDir/<name>/<app>.<ext>
 *
 * Invalid themes are skipped with field-specific error messages.
 * Per-file generator errors are collected and reported; process.exitCode is set
 * to 1 if any errors occur so the process exits non-zero after all themes run.
 *
 * @param {object[]} themes    - Array of parsed theme JSON objects.
 * @param {string}   themesDir - Root themes directory (e.g. ../themes).
 */
export function generate(themes, themesDir) {
  const allErrors = [];

  for (const theme of themes) {
    const validationErrors = validateTheme(theme);
    if (validationErrors.length > 0) {
      for (const err of validationErrors) {
        console.error(`  ✗ ${theme.name ?? "(unnamed)"}: ${err}`);
      }
      allErrors.push(...validationErrors);
      continue;
    }

    const themeDir = join(themesDir, theme.name);
    mkdirSync(themeDir, { recursive: true });

    const themeErrors = [];
    for (const { filename, fn } of TARGETS) {
      try {
        writeFileSync(join(themeDir, filename), fn(theme), "utf8");
      } catch (err) {
        themeErrors.push(`${filename}: ${err.message}`);
      }
    }

    if (themeErrors.length > 0) {
      for (const err of themeErrors) {
        console.error(`  ✗ ${theme.name}/${err}`);
      }
      allErrors.push(...themeErrors);
    }
  }

  if (allErrors.length > 0) {
    process.exitCode = 1;
  }
}

// ── CLI entry point ───────────────────────────────────────────────────────────

if (process.argv[1] === import.meta.filename) {
  const THEMES_DIR = join(import.meta.dirname, "../themes");

  // Discover theme JSON files: themes/<name>/<name>.json
  const names = globSync("*/", { cwd: THEMES_DIR }).map((d) => d.replace(/\/$/, ""));

  const themes = [];
  for (const name of names) {
    const jsonPath = join(THEMES_DIR, name, `${name}.json`);
    try {
      themes.push(JSON.parse(readFileSync(jsonPath, "utf8")));
    } catch (err) {
      if (err.code === "ENOENT") {
        console.warn(`  skipping ${name} — no ${name}.json found`);
      } else {
        console.warn(`  skipping ${name} — failed to parse ${name}.json: ${err.message}`);
      }
    }
  }

  if (themes.length === 0) {
    console.error("No theme JSON files found in themes/.");
    process.exit(1);
  }

  console.log(`Generating output for ${themes.length} themes…`);
  generate(themes, THEMES_DIR);

  for (const { name } of themes) {
    console.log(`  ✓ themes/${name}/  — ${TARGETS.length} files`);
  }
  console.log("Done.");
}
