import { describe, it, before, after } from "node:test";
import assert from "node:assert/strict";
import { mkdirSync, rmSync, existsSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { tmpdir } from "node:os";
import { generate } from "../generate.js";
import { theme as _theme } from "./fixture.js";

// Fixture needs prompt metadata for starship generator
const theme = {
  ..._theme,
  prompt: {
    layout: "two-line-box",
    showUsername: true,
    fill: "─",
    timePrefix: "◆",
    successSymbol: "❯",
    vimSymbol: "❮",
  },
};

// generate() writes into themes/<name>/ — all files for one theme in one place.
const TMP = join(tmpdir(), `starship-test-${Date.now()}`);
const THEMES_DIR = join(TMP, "themes");
const THEME_DIR = join(THEMES_DIR, "testtheme");

before(() => mkdirSync(THEMES_DIR, { recursive: true }));
after(() => rmSync(TMP, { recursive: true, force: true }));

// Helper — call generate once, then assert paths.
// The flag is set before the call so concurrent test runners cannot trigger
// a second invocation while the first is in progress.
let generated = false;
function ensureGenerated() {
  if (!generated) {
    generated = true;
    generate([theme], THEMES_DIR);
  }
}

// Expected output files inside themes/testtheme/
const EXPECTED = [
  ["starship.toml", "toml"],
  ["iterm2.itermcolors", "text"],
  ["alacritty.toml", "toml"],
  ["kitty.conf", "text"],
  ["wezterm.lua", "text"],
  ["ghostty", "text"],
  ["windows-terminal.json", "json"],
  ["vscode.json", "json"],
  ["neovim.lua", "text"],
  ["intellij.icls", "text"],
  ["zed.json", "json"],
];

describe("generate()", () => {
  it("creates the theme directory", async () => {
    await ensureGenerated();
    assert.ok(existsSync(THEME_DIR));
  });

  for (const [filename] of EXPECTED) {
    it(`writes ${filename}`, async () => {
      await ensureGenerated();
      assert.ok(existsSync(join(THEME_DIR, filename)), `missing ${filename}`);
    });
  }

  it("generated files are inside the theme directory, not a format subdirectory", async () => {
    await ensureGenerated();
    // There should be no subdirs inside THEME_DIR
    const { readdirSync } = await import("node:fs");
    const entries = readdirSync(THEME_DIR, { withFileTypes: true });
    const subdirs = entries.filter((e) => e.isDirectory());
    assert.strictEqual(subdirs.length, 0, `unexpected subdirs: ${subdirs.map((d) => d.name)}`);
  });

  it("all JSON output files are valid JSON", async () => {
    await ensureGenerated();
    for (const [filename, kind] of EXPECTED) {
      if (kind !== "json") continue;
      const content = readFileSync(join(THEME_DIR, filename), "utf8");
      assert.doesNotThrow(() => JSON.parse(content), `${filename} is not valid JSON`);
    }
  });

  it("alacritty.toml is non-empty", async () => {
    await ensureGenerated();
    const content = readFileSync(join(THEME_DIR, "alacritty.toml"), "utf8");
    assert.ok(content.length > 100);
  });

  it("does NOT write a format-named subdirectory structure", async () => {
    await ensureGenerated();
    // Old structure: themes/alacritty/testtheme.toml — should not exist
    assert.ok(!existsSync(join(THEMES_DIR, "alacritty", "testtheme.toml")));
  });
});

// ── generate() error handling ─────────────────────────────────────────────────

describe("generate() — invalid theme is skipped", () => {
  const TMP_ERR = join(tmpdir(), `generate-error-test-${Date.now()}`);

  before(() => mkdirSync(TMP_ERR, { recursive: true }));
  after(() => rmSync(TMP_ERR, { recursive: true, force: true }));

  it("skips a theme that fails validation and does not create its directory", () => {
    const invalidTheme = { name: "badtheme" }; // missing all required fields
    const savedCode = process.exitCode;
    generate([invalidTheme], TMP_ERR);
    process.exitCode = savedCode; // restore so test runner is not affected
    assert.ok(!existsSync(join(TMP_ERR, "badtheme")));
  });

  it("sets process.exitCode to 1 when a theme fails validation", () => {
    const invalidTheme = { name: "badtheme2" };
    const savedCode = process.exitCode;
    generate([invalidTheme], TMP_ERR);
    assert.strictEqual(process.exitCode, 1);
    process.exitCode = savedCode;
  });

  it("still processes valid themes after an invalid one", () => {
    const invalidTheme = { name: "bad" };
    const validTheme = { ...theme, name: "goodtheme" };
    const savedCode = process.exitCode;
    generate([invalidTheme, validTheme], TMP_ERR);
    process.exitCode = savedCode;
    assert.ok(existsSync(join(TMP_ERR, "goodtheme")));
  });

  it("catches per-file generator errors and sets exitCode=1", () => {
    // Pre-create starship.toml as a directory so writeFileSync throws EISDIR
    const themeDir = join(TMP_ERR, theme.name);
    mkdirSync(join(themeDir, "starship.toml"), { recursive: true });
    const savedCode = process.exitCode;
    generate([theme], TMP_ERR);
    const result = process.exitCode;
    process.exitCode = savedCode;
    assert.strictEqual(result, 1);
    rmSync(themeDir, { recursive: true, force: true });
  });
});
