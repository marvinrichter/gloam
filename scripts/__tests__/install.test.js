import { describe, it, before, after } from "node:test";
import assert from "node:assert/strict";
import { mkdtempSync, rmSync, mkdirSync, writeFileSync, readFileSync, existsSync } from "node:fs";
import { join } from "node:path";
import { tmpdir } from "node:os";

// ── Test environment ──────────────────────────────────────────────────────────

let TMP_HOME;
let TMP_REPO;

// Minimal fake theme for the test repo, matching the real source-of-truth schema.
const FAKE_THEME = {
  name: "testtheme",
  displayName: "Testtheme",
  type: "dark",
  background: "#0D0F1A",
  foreground: "#F0EAD6",
  tokens: { primary: "#E8B86D", accent: "#FF7F57", muted: "#8B84C4", error: "#E85D5D" },
  ansi: Array(16).fill("#000000"),
  ui: { cursor: "#FF7F57", cursorText: "#0D0F1A", selection: "#1E2040", selectionText: "#F0EAD6", bold: "#F0EAD6", link: "#B8B4E8" },
  prompt: { layout: "two-line-box", showUsername: true, fill: "─", timePrefix: "◆", successSymbol: "❯", vimSymbol: "❮" },
};

const FAKE_LIGHT_THEME = { ...FAKE_THEME, name: "lighttest", displayName: "Light Test", type: "light" };

function scaffoldFakeTheme(repoDir, meta) {
  const themeDir = join(repoDir, "themes", meta.name);
  mkdirSync(themeDir, { recursive: true });

  writeFileSync(join(themeDir, `${meta.name}.json`), JSON.stringify(meta));
  writeFileSync(join(themeDir, "starship.toml"), `# ${meta.name} starship config\n`);
  writeFileSync(join(themeDir, "alacritty.toml"), `# ${meta.name} alacritty config\n`);
  writeFileSync(join(themeDir, "kitty.conf"),     `# ${meta.name} kitty config\n`);
  writeFileSync(join(themeDir, "wezterm.lua"),    `-- ${meta.name} wezterm config\n`);
  writeFileSync(join(themeDir, "ghostty"),        `# ${meta.name} ghostty config\n`);
  writeFileSync(join(themeDir, "neovim.lua"),     `-- ${meta.name} neovim config\n`);
  writeFileSync(join(themeDir, "vscode.json"),    JSON.stringify({ name: meta.displayName, type: meta.type, colors: {}, tokenColors: [] }));
  writeFileSync(join(themeDir, "zed.json"),       JSON.stringify({ name: meta.displayName, themes: [{ name: meta.displayName, appearance: meta.type === "light" ? "light" : "dark" }] }));
  writeFileSync(join(themeDir, "windows-terminal.json"), JSON.stringify({ name: meta.displayName, background: meta.background }));
}

before(() => {
  TMP_HOME = mkdtempSync(join(tmpdir(), "gloam-install-home-"));
  TMP_REPO = mkdtempSync(join(tmpdir(), "gloam-install-repo-"));
  scaffoldFakeTheme(TMP_REPO, FAKE_THEME);
  scaffoldFakeTheme(TMP_REPO, FAKE_LIGHT_THEME);
});

after(() => {
  rmSync(TMP_HOME, { recursive: true, force: true });
  rmSync(TMP_REPO, { recursive: true, force: true });
});

// Lazy-import the installer with injected paths after temp dirs are set up.
async function installers() {
  const { createInstallers } = await import("../install.js");
  return createInstallers(TMP_HOME, TMP_REPO);
}

// ── upsertLine ────────────────────────────────────────────────────────────────

describe("upsertLine", async () => {
  const { upsertLine } = await import("../install.js");

  it("creates the file with the line when it does not exist", () => {
    const p = join(TMP_HOME, "upsert-create.conf");
    const result = upsertLine(p, /^theme\s*=/, "theme = red");
    assert.strictEqual(result, "created");
    assert.strictEqual(readFileSync(p, "utf8").trim(), "theme = red");
  });

  it("appends the line when the pattern is not found", () => {
    const p = join(TMP_HOME, "upsert-append.conf");
    writeFileSync(p, "# existing config\n");
    const result = upsertLine(p, /^theme\s*=/, "theme = red");
    assert.strictEqual(result, "appended");
    assert.match(readFileSync(p, "utf8"), /theme = red/);
    assert.match(readFileSync(p, "utf8"), /# existing config/);
  });

  it("replaces the matching line when found", () => {
    const p = join(TMP_HOME, "upsert-replace.conf");
    writeFileSync(p, "# config\ntheme = blue\n# end\n");
    const result = upsertLine(p, /^theme\s*=.*/m, "theme = red");
    assert.strictEqual(result, "updated");
    assert.match(readFileSync(p, "utf8"), /theme = red/);
    assert.doesNotMatch(readFileSync(p, "utf8"), /theme = blue/);
  });

  it("creates parent directories if they do not exist", () => {
    const p = join(TMP_HOME, "deeply", "nested", "config.conf");
    upsertLine(p, /^x/, "x = 1");
    assert.ok(existsSync(p));
  });
});

// ── starship ──────────────────────────────────────────────────────────────────

describe("installStarship", async () => {
  const { installStarship } = await installers();

  it("copies starship.toml to ~/.config/starship.toml", () => {
    installStarship("testtheme");
    const dest = join(TMP_HOME, ".config", "starship.toml");
    assert.ok(existsSync(dest));
    assert.match(readFileSync(dest, "utf8"), /testtheme/);
  });

  it("returns a message containing the destination path", () => {
    const msg = installStarship("testtheme");
    assert.match(msg, /starship\.toml/);
  });
});

// ── alacritty ─────────────────────────────────────────────────────────────────

describe("installAlacritty", async () => {
  const { installAlacritty } = await installers();

  it("copies alacritty.toml into the themes subdirectory", () => {
    installAlacritty("testtheme");
    const dest = join(TMP_HOME, ".config", "alacritty", "themes", "testtheme.toml");
    assert.ok(existsSync(dest));
  });

  it("appends an import line to alacritty.toml when none exists", () => {
    const configPath = join(TMP_HOME, ".config", "alacritty", "alacritty.toml");
    if (existsSync(configPath)) rmSync(configPath);
    installAlacritty("testtheme");
    assert.match(readFileSync(configPath, "utf8"), /import\s*=\s*\[.*testtheme/);
  });

  it("updates an existing gloam import line on re-install", () => {
    const configPath = join(TMP_HOME, ".config", "alacritty", "alacritty.toml");
    writeFileSync(configPath, 'import = ["~/.config/alacritty/themes/testtheme.toml"]\n');
    installAlacritty("testtheme");
    const content = readFileSync(configPath, "utf8");
    assert.strictEqual((content.match(/^import\s*=/gm) ?? []).length, 1);
  });
});

// ── kitty ─────────────────────────────────────────────────────────────────────

describe("installKitty", async () => {
  const { installKitty } = await installers();

  it("copies kitty.conf into ~/.config/kitty/", () => {
    installKitty("testtheme");
    assert.ok(existsSync(join(TMP_HOME, ".config", "kitty", "testtheme.conf")));
  });

  it("appends include line to kitty.conf when none exists", () => {
    const configPath = join(TMP_HOME, ".config", "kitty", "kitty.conf");
    if (existsSync(configPath)) rmSync(configPath);
    installKitty("testtheme");
    assert.match(readFileSync(configPath, "utf8"), /include testtheme\.conf/);
  });

  it("replaces existing gloam include on re-install", () => {
    const configPath = join(TMP_HOME, ".config", "kitty", "kitty.conf");
    writeFileSync(configPath, "include testtheme.conf\n");
    installKitty("testtheme");
    const content = readFileSync(configPath, "utf8");
    assert.strictEqual((content.match(/^include\s+\S*\.conf/gm) ?? []).length, 1);
  });
});

// ── wezterm ───────────────────────────────────────────────────────────────────

describe("installWezterm", async () => {
  const { installWezterm } = await installers();

  it("copies wezterm.lua into the colors subdirectory", () => {
    installWezterm("testtheme");
    assert.ok(existsSync(join(TMP_HOME, ".config", "wezterm", "colors", "testtheme.lua")));
  });

  it("appends color_scheme line to wezterm.lua when none exists", () => {
    const configPath = join(TMP_HOME, ".config", "wezterm", "wezterm.lua");
    if (existsSync(configPath)) rmSync(configPath);
    installWezterm("testtheme");
    assert.match(readFileSync(configPath, "utf8"), /config\.color_scheme\s*=\s*"Testtheme"/);
  });

  it("replaces existing color_scheme on re-install", () => {
    const configPath = join(TMP_HOME, ".config", "wezterm", "wezterm.lua");
    writeFileSync(configPath, 'config.color_scheme = "OtherTheme"\n');
    installWezterm("testtheme");
    const content = readFileSync(configPath, "utf8");
    assert.match(content, /Testtheme/);
    assert.doesNotMatch(content, /OtherTheme/);
  });
});

// ── ghostty ───────────────────────────────────────────────────────────────────

describe("installGhostty", async () => {
  const { installGhostty } = await installers();

  it("copies ghostty config into themes subdirectory", () => {
    installGhostty("testtheme");
    assert.ok(existsSync(join(TMP_HOME, ".config", "ghostty", "themes", "testtheme")));
  });

  it("appends theme line to ghostty config when none exists", () => {
    const configPath = join(TMP_HOME, ".config", "ghostty", "config");
    if (existsSync(configPath)) rmSync(configPath);
    installGhostty("testtheme");
    assert.match(readFileSync(configPath, "utf8"), /theme\s*=\s*testtheme/);
  });

  it("replaces existing theme on re-install", () => {
    const configPath = join(TMP_HOME, ".config", "ghostty", "config");
    writeFileSync(configPath, "theme = othertheme\n");
    installGhostty("testtheme");
    assert.match(readFileSync(configPath, "utf8"), /theme = testtheme/);
    assert.doesNotMatch(readFileSync(configPath, "utf8"), /othertheme/);
  });
});

// ── neovim ────────────────────────────────────────────────────────────────────

describe("installNeovim", async () => {
  const { installNeovim } = await installers();

  it("copies neovim.lua into ~/.config/nvim/colors/", () => {
    installNeovim("testtheme");
    assert.ok(existsSync(join(TMP_HOME, ".config", "nvim", "colors", "testtheme.lua")));
  });

  it("returns a message reminding user to add colorscheme to init.lua", () => {
    const msg = installNeovim("testtheme");
    assert.match(msg, /init\.lua/);
  });
});

// ── vscode ────────────────────────────────────────────────────────────────────

describe("installVscode", async () => {
  const { installVscode } = await installers();

  it("creates the extension directory", () => {
    installVscode("testtheme");
    assert.ok(existsSync(join(TMP_HOME, ".vscode", "extensions", "gloam-testtheme")));
  });

  it("copies vscode.json into the extension themes subdirectory", () => {
    installVscode("testtheme");
    assert.ok(existsSync(join(TMP_HOME, ".vscode", "extensions", "gloam-testtheme", "themes", "testtheme.json")));
  });

  it("generates a valid package.json", () => {
    installVscode("testtheme");
    const pkg = JSON.parse(readFileSync(join(TMP_HOME, ".vscode", "extensions", "gloam-testtheme", "package.json"), "utf8"));
    assert.strictEqual(pkg.name, "gloam-testtheme");
    assert.ok(Array.isArray(pkg.contributes.themes));
    assert.strictEqual(pkg.contributes.themes[0].uiTheme, "vs-dark");
  });

  it("uses uiTheme vs for light themes", () => {
    installVscode("lighttest");
    const pkg = JSON.parse(readFileSync(join(TMP_HOME, ".vscode", "extensions", "gloam-lighttest", "package.json"), "utf8"));
    assert.strictEqual(pkg.contributes.themes[0].uiTheme, "vs");
  });
});

// ── zed ───────────────────────────────────────────────────────────────────────

describe("installZed", async () => {
  const { installZed } = await installers();

  it("copies zed.json into ~/.config/zed/themes/", () => {
    installZed("testtheme");
    assert.ok(existsSync(join(TMP_HOME, ".config", "zed", "themes", "testtheme.json")));
  });

  it("sets the theme key in zed settings.json", () => {
    const settingsPath = join(TMP_HOME, ".config", "zed", "settings.json");
    if (existsSync(settingsPath)) rmSync(settingsPath);
    installZed("testtheme");
    const settings = JSON.parse(readFileSync(settingsPath, "utf8"));
    assert.strictEqual(settings.theme, "Testtheme");
  });

  it("preserves existing keys in zed settings.json", () => {
    const settingsPath = join(TMP_HOME, ".config", "zed", "settings.json");
    writeFileSync(settingsPath, JSON.stringify({ "font-size": 14 }));
    installZed("testtheme");
    const settings = JSON.parse(readFileSync(settingsPath, "utf8"));
    assert.strictEqual(settings["font-size"], 14);
    assert.strictEqual(settings.theme, "Testtheme");
  });
});

// ── windows-terminal ──────────────────────────────────────────────────────────

describe("installWindowsTerminal", async () => {
  const { installWindowsTerminal } = await installers();

  it("returns a skip message on non-Windows platforms", { skip: process.platform === "win32" }, () => {
    const msg = installWindowsTerminal("testtheme");
    assert.match(msg, /skip/i);
  });
});

// ── error handling ────────────────────────────────────────────────────────────

describe("run — error handling", async () => {
  const { run } = await import("../install.js");

  it("throws on unknown theme name", () => {
    assert.throws(
      () => run("nonexistent", "starship", TMP_HOME, TMP_REPO),
      /unknown theme/i,
    );
  });

  it("throws on unknown target name", () => {
    assert.throws(
      () => run("testtheme", "nonexistent", TMP_HOME, TMP_REPO),
      /unknown target/i,
    );
  });

  it("throws when target is 'all' (unknown target)", () => {
    assert.throws(
      () => run("testtheme", "all", TMP_HOME, TMP_REPO),
      /unknown target/i,
    );
  });
});
