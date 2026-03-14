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

/**
 * Generate all format files for every theme into themesDir.
 * Each theme gets its own subdirectory: themesDir/<name>/<app>.<ext>
 *
 * @param {object[]} themes    - Array of parsed theme JSON objects.
 * @param {string}   themesDir - Root themes directory (e.g. ../themes).
 */
export async function generate(themes, themesDir) {
  for (const theme of themes) {
    const themeDir = join(themesDir, theme.name);
    mkdirSync(themeDir, { recursive: true });

    for (const { filename, fn } of TARGETS) {
      writeFileSync(join(themeDir, filename), fn(theme), "utf8");
    }
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
    } catch {
      console.warn(`  skipping ${name} — no ${name}.json found`);
    }
  }

  if (themes.length === 0) {
    console.error("No theme JSON files found in themes/.");
    process.exit(1);
  }

  console.log(`Generating output for ${themes.length} themes…`);
  await generate(themes, THEMES_DIR);

  for (const { name } of themes) {
    console.log(`  ✓ themes/${name}/  — ${TARGETS.length} files`);
  }
  console.log("Done.");
}
