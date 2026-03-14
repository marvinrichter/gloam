#!/usr/bin/env node
/**
 * gloam theme installer
 *
 * Usage:
 *   node scripts/install.js <theme> <target>
 *   node scripts/install.js all <target>
 *
 * Themes:  eventide | aether | ember | absinthe | verdigris | sable |
 *          fjord | umbra | cordovan | tungsten | amethyst | parchment | all
 *
 * Targets: starship | alacritty | kitty | wezterm | ghostty |
 *          neovim | vscode | zed | windows-terminal
 *
 * iTerm2 and IntelliJ require manual import via their GUIs.
 */

import { copyFileSync, existsSync, globSync, mkdirSync, readFileSync, realpathSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { homedir, platform } from "node:os";

const DEFAULT_REPO = join(import.meta.dirname, "..");
const DEFAULT_HOME = homedir();
const IS_WIN       = platform() === "win32";

// ── Helpers ───────────────────────────────────────────────────────────────────

function ensureDir(p) {
  mkdirSync(p, { recursive: true });
}

function copy(src, dest) {
  ensureDir(dirname(dest));
  copyFileSync(src, dest);
}

function readText(p) {
  return existsSync(p) ? readFileSync(p, "utf8") : null;
}

function writeText(p, content) {
  ensureDir(dirname(p));
  writeFileSync(p, content, "utf8");
}

function readJson(p) {
  const raw = readText(p);
  return raw ? JSON.parse(raw) : null;
}

function writeJson(p, obj) {
  ensureDir(dirname(p));
  writeFileSync(p, JSON.stringify(obj, null, 2) + "\n", "utf8");
}

/**
 * Find a line matching `pattern` and replace it with `line`.
 * If no match, append `line` at the end.
 * If the file doesn't exist, create it containing only `line`.
 * Returns "created" | "updated" | "appended".
 */
export function upsertLine(filePath, pattern, line) {
  const existing = readText(filePath);
  if (existing === null) {
    writeText(filePath, line + "\n");
    return "created";
  }
  if (pattern.test(existing)) {
    // Use a global version of the pattern so all matching occurrences are replaced,
    // preventing duplicates if a user config has multiple matching lines.
    const globalPattern = new RegExp(pattern.source, pattern.flags.includes("g") ? pattern.flags : `${pattern.flags}g`);
    writeText(filePath, existing.replace(globalPattern, line));
    return "updated";
  }
  writeText(filePath, existing.trimEnd() + "\n" + line + "\n");
  return "appended";
}

function capitalize(s) {
  return s.charAt(0).toUpperCase() + s.slice(1);
}

function availableThemes(repo) {
  return globSync("*/", { cwd: join(repo, "themes") }).map((d) => d.replace(/\/$/, ""));
}

// ── Installer factory ─────────────────────────────────────────────────────────

export function createInstallers(home, repo) {
  const src = (name) => join(repo, "themes", name);
  const loadMeta = (name) => JSON.parse(readFileSync(join(src(name), `${name}.json`), "utf8"));

  function installStarship(name) {
    const dest = join(home, ".config", "starship.toml");
    copy(join(src(name), "starship.toml"), dest);
    return `copied → ${dest}`;
  }

  function installAlacritty(name) {
    const destTheme  = join(home, ".config", "alacritty", "themes", `${name}.toml`);
    const configPath = join(home, ".config", "alacritty", "alacritty.toml");
    const importLine = `import = ["~/.config/alacritty/themes/${name}.toml"]`;

    copy(join(src(name), "alacritty.toml"), destTheme);
    const result = upsertLine(configPath, /^import\s*=\s*\["~\/\.config\/alacritty\/themes\/[^"]+"\]/m, importLine);

    return result === "updated"
      ? `copied → ${destTheme}\n  ~ updated import in ${configPath}`
      : `copied → ${destTheme}\n  + added import to ${configPath}`;
  }

  function installKitty(name) {
    const destTheme  = join(home, ".config", "kitty", `${name}.conf`);
    const configPath = join(home, ".config", "kitty", "kitty.conf");
    // Write a "# gloam" marker on the include line so future re-installs can
    // identify it. Also match lines without the marker to handle upgrades from
    // older gloam versions or manual installs of the same theme file.
    const includeLine = `include ${name}.conf  # gloam`;
    const pattern = new RegExp(`^include\\s+${name}\\.conf(?:\\s.*)?$`, "m");

    copy(join(src(name), "kitty.conf"), destTheme);
    const result = upsertLine(configPath, pattern, includeLine);

    return result === "updated"
      ? `copied → ${destTheme}\n  ~ updated include in ${configPath}`
      : `copied → ${destTheme}\n  + added include to ${configPath}`;
  }

  function installWezterm(name) {
    const destTheme  = join(home, ".config", "wezterm", "colors", `${name}.lua`);
    const configPath = join(home, ".config", "wezterm", "wezterm.lua");
    const schemeLine = `config.color_scheme = "${capitalize(name)}"`;

    copy(join(src(name), "wezterm.lua"), destTheme);
    const result = upsertLine(configPath, /^config\.color_scheme\s*=\s*.*/m, schemeLine);

    return result === "updated"
      ? `copied → ${destTheme}\n  ~ updated color_scheme in ${configPath}`
      : `copied → ${destTheme}\n  + added color_scheme to ${configPath}`;
  }

  function installGhostty(name) {
    const destTheme  = join(home, ".config", "ghostty", "themes", name);
    const configPath = join(home, ".config", "ghostty", "config");
    const themeLine  = `theme = ${name}`;

    copy(join(src(name), "ghostty"), destTheme);
    const result = upsertLine(configPath, /^theme\s*=\s*.*/m, themeLine);

    return result === "updated"
      ? `copied → ${destTheme}\n  ~ updated theme in ${configPath}`
      : `copied → ${destTheme}\n  + added theme to ${configPath}`;
  }

  function installNeovim(name) {
    const dest = join(home, ".config", "nvim", "colors", `${name}.lua`);
    copy(join(src(name), "neovim.lua"), dest);
    return `copied → ${dest}\n  ! add vim.cmd("colorscheme ${name}") to your init.lua`;
  }

  function installVscode(name) {
    const meta    = loadMeta(name);
    const uiTheme = meta.type === "light" ? "vs" : "vs-dark";
    const display = capitalize(name);
    const extDir  = join(home, ".vscode", "extensions", `gloam-${name}`);
    const { version } = JSON.parse(readFileSync(join(repo, "package.json"), "utf8"));

    copy(join(src(name), "vscode.json"), join(extDir, "themes", `${name}.json`));

    writeJson(join(extDir, "package.json"), {
      name:        `gloam-${name}`,
      publisher:   "gloam",
      displayName: `Gloam \u2014 ${display}`,
      version,
      engines:     { vscode: "^1.70.0" },
      categories:  ["Themes"],
      contributes: {
        themes: [{
          label:   `Gloam ${display}`,
          uiTheme,
          path:    `./themes/${name}.json`,
        }],
      },
    });

    // Register the extension in VS Code's extensions registry so it is
    // discovered on the next reload (VS Code does not scan arbitrary
    // sub-directories — it uses extensions.json as its source of truth).
    const registryPath = join(home, ".vscode", "extensions", "extensions.json");
    const registry = readJson(registryPath) ?? [];
    const extId = `gloam.gloam-${name}`;
    const filtered = registry.filter((e) => e.identifier?.id !== extId);
    filtered.push({
      identifier:       { id: extId },
      version,
      location:         { $mid: 1, path: extDir, scheme: "file" },
      relativeLocation: `gloam-${name}`,
      metadata:         { installedTimestamp: Date.now(), source: "local" },
    });
    writeJson(registryPath, filtered);

    return `installed extension → ${extDir}\n  Reload VS Code, then Cmd+K Cmd+T`;
  }

  function installZed(name) {
    const destTheme    = join(home, ".config", "zed", "themes", `${name}.json`);
    const settingsPath = join(home, ".config", "zed", "settings.json");

    copy(join(src(name), "zed.json"), destTheme);

    let settings = {};
    try {
      settings = readJson(settingsPath) ?? {};
    } catch {
      return `copied → ${destTheme}\n  ! skipped updating ${settingsPath} — it may contain JSONC comments which are not supported. Set "theme": "${capitalize(name)}" manually.`;
    }
    settings.theme = capitalize(name);
    writeJson(settingsPath, settings);

    return `copied → ${destTheme}\n  ~ set theme in ${settingsPath}`;
  }

  function installWindowsTerminal(name) {
    if (!IS_WIN) return "skipped (Windows only)";

    const localAppData = process.env.LOCALAPPDATA ?? join(home, "AppData", "Local");
    const candidates   = [
      join(localAppData, "Packages", "Microsoft.WindowsTerminal_8wekyb3d8bbwe", "LocalState", "settings.json"),
      join(localAppData, "Packages", "Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe", "LocalState", "settings.json"),
    ];
    const settingsPath = candidates.find(existsSync);

    if (!settingsPath) return "skipped — could not find Windows Terminal settings.json";

    const scheme   = JSON.parse(readFileSync(join(src(name), "windows-terminal.json"), "utf8"));
    const settings = readJson(settingsPath) ?? {};

    settings.schemes ??= [];
    const idx = settings.schemes.findIndex((s) => s.name === scheme.name);
    if (idx >= 0) {
      settings.schemes[idx] = scheme;
    } else {
      settings.schemes.push(scheme);
    }

    writeJson(settingsPath, settings);
    return `updated schemes in ${settingsPath}\n  Set "colorScheme": "${scheme.name}" on your profile to activate`;
  }

  return {
    installStarship,
    installAlacritty,
    installKitty,
    installWezterm,
    installGhostty,
    installNeovim,
    installVscode,
    installZed,
    installWindowsTerminal,
  };
}

// ── Dispatch ──────────────────────────────────────────────────────────────────

const MANUAL = {
  iterm2:   (name) => `manual — import themes/${name}/iterm2.itermcolors via Preferences › Profiles › Colors › Color Presets ▾ › Import…`,
  intellij: (name) => `manual — import themes/${name}/intellij.icls via Settings › Editor › Color Scheme › ⚙ › Import Scheme`,
};

const TARGET_KEYS = ["starship", "alacritty", "kitty", "wezterm", "ghostty", "neovim", "vscode", "zed", "windows-terminal"];

export function run(themeName, targetName, home = DEFAULT_HOME, repo = DEFAULT_REPO) {
  const themes  = themeName === "all" ? availableThemes(repo) : [themeName];
  const targets = [targetName];

  const inst = createInstallers(home, repo);

  const installerMap = {
    starship:           inst.installStarship,
    alacritty:          inst.installAlacritty,
    kitty:              inst.installKitty,
    wezterm:            inst.installWezterm,
    ghostty:            inst.installGhostty,
    neovim:             inst.installNeovim,
    vscode:             inst.installVscode,
    zed:                inst.installZed,
    "windows-terminal": inst.installWindowsTerminal,
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
        throw new Error(`Unknown target "${target}". Available: ${[...TARGET_KEYS, ...Object.keys(MANUAL)].join(", ")}`);
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
