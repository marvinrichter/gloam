import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { mkdirSync, rmSync } from "node:fs";
import { join } from "node:path";
import { fileURLToPath } from "node:url";
import { buildThemeJson, buildThemeMd } from "../new-theme.js";

const SCRIPT = join(fileURLToPath(import.meta.url), "..", "..", "new-theme.js");

// ── Shared test data ──────────────────────────────────────────────────────────

const DATA = {
  name: "testtheme",
  displayName: "Test Theme",
  concept: "a violet sky at dusk",
  type: "dark",
  background: "#0D1020",
  foreground: "#E0D8C8",
  primary: "#80C0E0",
  accent: "#E0A060",
  muted: "#7080A0",
  error: "#E06060",
  layout: "two-line-box",
  fill: "─",
  timePrefix: "◆",
};

const LIGHT_DATA = { ...DATA, name: "lighttest", type: "light" };

// ── buildThemeJson ────────────────────────────────────────────────────────────

describe("buildThemeJson", () => {
  it("returns an object", () => {
    assert.strictEqual(typeof buildThemeJson(DATA), "object");
  });

  it("sets name and displayName", () => {
    const obj = buildThemeJson(DATA);
    assert.strictEqual(obj.name, "testtheme");
    assert.strictEqual(obj.displayName, "Test Theme");
  });

  it("sets type", () => {
    assert.strictEqual(buildThemeJson(DATA).type, "dark");
    assert.strictEqual(buildThemeJson(LIGHT_DATA).type, "light");
  });

  it("sets background and foreground", () => {
    const obj = buildThemeJson(DATA);
    assert.strictEqual(obj.background, "#0D1020");
    assert.strictEqual(obj.foreground, "#E0D8C8");
  });

  it("tokens block has all 4 semantic colors", () => {
    const { tokens } = buildThemeJson(DATA);
    assert.strictEqual(tokens.primary, "#80C0E0");
    assert.strictEqual(tokens.accent, "#E0A060");
    assert.strictEqual(tokens.muted, "#7080A0");
    assert.strictEqual(tokens.error, "#E06060");
  });

  it("ansi array has exactly 16 entries", () => {
    const obj = buildThemeJson(DATA);
    assert.ok(Array.isArray(obj.ansi));
    assert.strictEqual(obj.ansi.length, 16);
  });

  it("ansi[0] is background (black = background)", () => {
    assert.strictEqual(buildThemeJson(DATA).ansi[0], "#0D1020");
  });

  it("ansi[15] is foreground (bright white = foreground)", () => {
    assert.strictEqual(buildThemeJson(DATA).ansi[15], "#E0D8C8");
  });

  it("dark theme uses dark bright-black value", () => {
    assert.strictEqual(buildThemeJson(DATA).ansi[8], "#2A2A2A");
  });

  it("light theme uses light bright-black value", () => {
    assert.strictEqual(buildThemeJson(LIGHT_DATA).ansi[8], "#D0C8B8");
  });

  it("ui.cursor is accent color", () => {
    assert.strictEqual(buildThemeJson(DATA).ui.cursor, "#E0A060");
  });

  it("ui.cursorText is background", () => {
    assert.strictEqual(buildThemeJson(DATA).ui.cursorText, "#0D1020");
  });

  it("prompt block has layout and symbols", () => {
    const { prompt } = buildThemeJson(DATA);
    assert.strictEqual(prompt.layout, "two-line-box");
    assert.strictEqual(prompt.successSymbol, "❯");
    assert.strictEqual(prompt.vimSymbol, "❮");
  });

  it("single-line layout uses › and ‹ symbols", () => {
    const obj = buildThemeJson({ ...DATA, layout: "single-line" });
    assert.strictEqual(obj.prompt.successSymbol, "›");
    assert.strictEqual(obj.prompt.vimSymbol, "‹");
  });

  it("dark theme selection uses dark selection color", () => {
    assert.strictEqual(buildThemeJson(DATA).ui.selection, "#2A2A3A");
  });

  it("light theme selection uses light selection color", () => {
    assert.strictEqual(buildThemeJson(LIGHT_DATA).ui.selection, "#D8CCA8");
  });
});

// ── buildThemeMd ──────────────────────────────────────────────────────────────

describe("buildThemeMd", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof buildThemeMd(DATA), "string");
  });

  it("starts with an H1 heading containing displayName", () => {
    assert.match(buildThemeMd(DATA), /^# Test Theme/);
  });

  it("includes the concept line", () => {
    assert.match(buildThemeMd(DATA), /a violet sky at dusk/);
  });

  it("includes all 4 token hex values", () => {
    const md = buildThemeMd(DATA);
    assert.match(md, /#80C0E0/);
    assert.match(md, /#E0A060/);
    assert.match(md, /#7080A0/);
    assert.match(md, /#E06060/);
  });

  it("has Color System section", () => {
    assert.match(buildThemeMd(DATA), /## Color System/);
  });

  it("has File Reference section listing all output files", () => {
    const md = buildThemeMd(DATA);
    assert.match(md, /## File Reference/);
    assert.match(md, /starship\.toml/);
    assert.match(md, /vscode\.json/);
    assert.match(md, /neovim\.lua/);
  });

  it("has Install section with npx command", () => {
    const md = buildThemeMd(DATA);
    assert.match(md, /## Install/);
    assert.match(md, /npx.*testtheme/);
  });
});

// ── CLI — error paths (no stdin required) ─────────────────────────────────────

describe("new-theme.js CLI — error paths", () => {
  it("exits 1 and reports error when theme directory already exists", () => {
    const slug = "test-scaffold-exists-tmp";
    const realDir = join(fileURLToPath(import.meta.url), "..", "..", "..", "themes", slug);
    mkdirSync(realDir, { recursive: true });
    try {
      const result = spawnSync(process.execPath, [SCRIPT, "--name", slug], {
        input: "\n",
        encoding: "utf8",
        timeout: 5_000,
      });
      assert.strictEqual(result.status, 1);
      assert.match(result.stderr, /already exists/i);
    } finally {
      rmSync(realDir, { recursive: true, force: true });
    }
  });
});
