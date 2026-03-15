#!/usr/bin/env node
/**
 * gloam theme installer
 *
 * Usage:
 *   node scripts/install.js <theme> <target>
 *   node scripts/install.js all <target>
 *
 * Themes:  eventide | aether | ember | absinthe | verdigris | sable |
 *          fjord | umbra | cordovan | tungsten | amethyst | parchment |
 *          solano | saffron | ochre | all
 *
 * Targets: starship | alacritty | kitty | wezterm | ghostty |
 *          neovim | vscode | zed | windows-terminal | helix | tmux
 *
 * iTerm2, IntelliJ, Terminal.app, Oh My Posh, and Sublime Text require
 * manual import via their GUIs or manual copy.
 */

import { existsSync, globSync, readFileSync, realpathSync } from "node:fs";
import { join, normalize, resolve } from "node:path";
import { homedir, platform } from "node:os";

import { create as createStarship } from "./installers/starship.js";
import { create as createAlacritty } from "./installers/alacritty.js";
import { create as createKitty } from "./installers/kitty.js";
import { create as createWezterm } from "./installers/wezterm.js";
import { create as createGhostty } from "./installers/ghostty.js";
import { create as createNeovim } from "./installers/neovim.js";
import { create as createVscode } from "./installers/vscode.js";
import { create as createZed } from "./installers/zed.js";
import { create as createWindowsTerminal } from "./installers/windows-terminal.js";
import { create as createHelix } from "./installers/helix.js";
import { create as createTmux } from "./installers/tmux.js";

// Re-export upsertLine so existing tests and external callers can import it
// from this module without needing to know about the internal module split.
export { upsertLine } from "./installers/_helpers.js";

const DEFAULT_REPO = join(import.meta.dirname, "..");
const DEFAULT_HOME = homedir();
const IS_WIN = platform() === "win32";

// ── Helpers ───────────────────────────────────────────────────────────────────

function availableThemes(repo) {
  return globSync("*/", { cwd: join(repo, "themes") }).map((d) => d.replace(/\/$/, ""));
}

// ── Installer factory ─────────────────────────────────────────────────────────

export function createInstallers(home, repo) {
  const themesDir = resolve(repo, "themes");
  const src = (name) => {
    const p = normalize(join(repo, "themes", name));
    if (!p.startsWith(themesDir + "/") && p !== themesDir) {
      throw new Error(`Unsafe theme path: "${name}"`);
    }
    return p;
  };
  const loadMeta = (name) => {
    const metaPath = join(src(name), `${name}.json`);
    try {
      return JSON.parse(readFileSync(metaPath, "utf8"));
    } catch (err) {
      throw new Error(`Theme "${name}" has invalid JSON: ${err.message}`);
    }
  };

  const ctx = { src, loadMeta, home, repo, IS_WIN };

  return {
    installStarship: createStarship(ctx),
    installAlacritty: createAlacritty(ctx),
    installKitty: createKitty(ctx),
    installWezterm: createWezterm(ctx),
    installGhostty: createGhostty(ctx),
    installNeovim: createNeovim(ctx),
    installVscode: createVscode(ctx),
    installZed: createZed(ctx),
    installWindowsTerminal: createWindowsTerminal(ctx),
    installHelix: createHelix(ctx),
    installTmux: createTmux(ctx),
  };
}

// ── Dispatch ──────────────────────────────────────────────────────────────────

const MANUAL = {
  iterm2: (name) =>
    `manual — import themes/${name}/iterm2.itermcolors via Preferences › Profiles › Colors › Color Presets ▾ › Import…`,
  intellij: (name) =>
    `manual — import themes/${name}/intellij.icls via Settings › Editor › Color Scheme › ⚙ › Import Scheme`,
  "terminal-app": (name) =>
    `manual — import themes/${name}/terminal.terminal via Terminal › Preferences › Profiles › ⚙ › Import…`,
  "oh-my-posh": (name) =>
    `manual — copy themes/${name}/oh-my-posh.omp.json to ~/.config/oh-my-posh/themes/${name}.omp.json`,
  "sublime-text": (name) =>
    `manual — copy themes/${name}/sublime-text.sublime-color-scheme to ~/Library/Application Support/Sublime Text/Packages/User/`,
};

const TARGET_KEYS = [
  "starship",
  "alacritty",
  "kitty",
  "wezterm",
  "ghostty",
  "neovim",
  "vscode",
  "zed",
  "windows-terminal",
  "helix",
  "tmux",
];

export function run(themeName, targetName, home = DEFAULT_HOME, repo = DEFAULT_REPO) {
  const themes = themeName === "all" ? availableThemes(repo) : [themeName];
  const targets = [targetName];

  const inst = createInstallers(home, repo);

  const installerMap = {
    starship: inst.installStarship,
    alacritty: inst.installAlacritty,
    kitty: inst.installKitty,
    wezterm: inst.installWezterm,
    ghostty: inst.installGhostty,
    neovim: inst.installNeovim,
    vscode: inst.installVscode,
    zed: inst.installZed,
    "windows-terminal": inst.installWindowsTerminal,
    helix: inst.installHelix,
    tmux: inst.installTmux,
  };

  for (const theme of themes) {
    if (!existsSync(join(repo, "themes", theme))) {
      throw new Error(`Unknown theme "${theme}". Available: ${availableThemes(repo).join(", ")}`);
    }
    for (const target of targets) {
      if (MANUAL[target]) {
        console.log(`  ${theme}/${target}: ${MANUAL[target](theme)}`);
        continue;
      }
      if (!installerMap[target]) {
        throw new Error(
          `Unknown target "${target}". Available: ${[...TARGET_KEYS, ...Object.keys(MANUAL)].join(", ")}`,
        );
      }
      try {
        const msg = installerMap[target](theme);
        console.log(`  ${theme}/${target}: ${msg}`);
      } catch (err) {
        console.error(`  ${theme}/${target}: failed — ${err.message}`);
      }
    }
  }
}

// ── CLI ───────────────────────────────────────────────────────────────────────

if (realpathSync(process.argv[1]) === import.meta.filename) {
  const [themeName, targetName] = process.argv.slice(2);

  if (!themeName || !targetName) {
    console.log(`Usage: node scripts/install.js <theme> <target>
       node scripts/install.js all   <target>

Themes:  ${availableThemes(DEFAULT_REPO).join(" | ")} | all

Targets: ${[...TARGET_KEYS, ...Object.keys(MANUAL)].join(" | ")}

iTerm2 and IntelliJ require manual import via their GUIs.`);
    process.exit(1);
  }

  run(themeName, targetName);
}
