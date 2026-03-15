#!/usr/bin/env node
/**
 * Validate that every theme directory contains all expected output files.
 * Exits non-zero if any file is missing from any theme.
 */

import { existsSync, readdirSync } from "node:fs";
import { join } from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = join(fileURLToPath(import.meta.url), "..", "..", "..");
const THEMES_DIR = join(ROOT, "themes");

// Files that must exist in every theme directory.
// The <name>.json and <name>.md files are checked dynamically.
const STATIC_FILES = [
  "alacritty.toml",
  "ghostty",
  "helix.toml",
  "intellij.icls",
  "iterm2.itermcolors",
  "kitty.conf",
  "neovim.lua",
  "oh-my-posh.omp.json",
  "starship.toml",
  "sublime-text.sublime-color-scheme",
  "terminal.terminal",
  "tmux.conf",
  "vscode.json",
  "wezterm.lua",
  "windows-terminal.json",
  "zed.json",
];

const themes = readdirSync(THEMES_DIR, { withFileTypes: true })
  .filter((d) => d.isDirectory())
  .map((d) => d.name);

let failures = 0;

for (const name of themes) {
  const dir = join(THEMES_DIR, name);

  // Dynamic per-theme files
  const required = [...STATIC_FILES, `${name}.json`, `${name}.md`];

  for (const file of required) {
    if (!existsSync(join(dir, file))) {
      console.error(`MISSING  themes/${name}/${file}`);
      failures++;
    }
  }
}

if (failures > 0) {
  console.error(`\n${failures} missing file(s) across ${themes.length} themes.`);
  console.error("Run 'npm run generate' to regenerate all theme outputs.");
  process.exit(1);
} else {
  console.log(`✓ All ${themes.length} themes have complete output files.`);
}
