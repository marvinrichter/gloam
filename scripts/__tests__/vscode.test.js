import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateVscode } from "../generators/vscode.js";
import { theme, lightTheme } from "./fixture.js";

describe("generateVscode", () => {
  it("returns valid JSON string", () => {
    const out = generateVscode(theme);
    assert.doesNotThrow(() => JSON.parse(out));
  });

  it("has a name field", () => {
    const obj = JSON.parse(generateVscode(theme));
    assert.match(obj.name, /testtheme/i);
  });

  it("sets type to dark for dark themes", () => {
    const obj = JSON.parse(generateVscode(theme));
    assert.strictEqual(obj.type, "dark");
  });

  it("sets type to light for light themes", () => {
    const obj = JSON.parse(generateVscode(lightTheme));
    assert.strictEqual(obj.type, "light");
  });

  it("has colors object", () => {
    const obj = JSON.parse(generateVscode(theme));
    assert.strictEqual(typeof obj.colors, "object");
  });

  it("sets editor.background", () => {
    const obj = JSON.parse(generateVscode(theme));
    assert.strictEqual(obj.colors["editor.background"].toLowerCase(), "#0d0f1a");
  });

  it("sets editor.foreground", () => {
    const obj = JSON.parse(generateVscode(theme));
    assert.strictEqual(obj.colors["editor.foreground"].toLowerCase(), "#f0ead6");
  });

  it("sets terminal.ansiBlack to ANSI 0", () => {
    const obj = JSON.parse(generateVscode(theme));
    assert.strictEqual(obj.colors["terminal.ansiBlack"].toLowerCase(), "#0d0f1a");
  });

  it("sets terminal.ansiWhite to ANSI 7", () => {
    const obj = JSON.parse(generateVscode(theme));
    assert.strictEqual(obj.colors["terminal.ansiWhite"].toLowerCase(), "#b8b0cc");
  });

  it("sets all 16 terminal ANSI colors", () => {
    const obj = JSON.parse(generateVscode(theme));
    const expected = [
      "terminal.ansiBlack",   "terminal.ansiRed",       "terminal.ansiGreen",  "terminal.ansiYellow",
      "terminal.ansiBlue",    "terminal.ansiMagenta",   "terminal.ansiCyan",   "terminal.ansiWhite",
      "terminal.ansiBrightBlack", "terminal.ansiBrightRed", "terminal.ansiBrightGreen", "terminal.ansiBrightYellow",
      "terminal.ansiBrightBlue",  "terminal.ansiBrightMagenta", "terminal.ansiBrightCyan", "terminal.ansiBrightWhite",
    ];
    expected.forEach((k) => assert.ok(k in obj.colors, `missing ${k}`));
  });

  it("has tokenColors array", () => {
    const obj = JSON.parse(generateVscode(theme));
    assert.ok(Array.isArray(obj.tokenColors));
    assert.ok(obj.tokenColors.length > 0);
  });

  it("tokenColors entries have scope and settings.foreground", () => {
    const obj = JSON.parse(generateVscode(theme));
    obj.tokenColors.forEach((tc) => {
      assert.ok("scope" in tc || "name" in tc, "entry missing scope or name");
      assert.ok("settings" in tc, "entry missing settings");
    });
  });

  it("keywords use accent color", () => {
    const obj = JSON.parse(generateVscode(theme));
    const kw = obj.tokenColors.find((tc) =>
      [].concat(tc.scope).some((s) => s.includes("keyword"))
    );
    assert.ok(kw, "no keyword token found");
    assert.strictEqual(kw.settings.foreground.toLowerCase(), "#ff7f57");
  });

  it("comments use muted color", () => {
    const obj = JSON.parse(generateVscode(theme));
    const cm = obj.tokenColors.find((tc) =>
      [].concat(tc.scope).some((s) => s.includes("comment"))
    );
    assert.ok(cm, "no comment token found");
    assert.strictEqual(cm.settings.foreground.toLowerCase(), "#8b84c4");
  });

  it("types/classes use primary color", () => {
    const obj = JSON.parse(generateVscode(theme));
    const tp = obj.tokenColors.find((tc) =>
      [].concat(tc.scope).some((s) => s.includes("entity.name.type"))
    );
    assert.ok(tp, "no type token found");
    assert.strictEqual(tp.settings.foreground.toLowerCase(), "#e8b86d");
  });

  it("works for light themes", () => {
    const obj = JSON.parse(generateVscode(lightTheme));
    assert.strictEqual(obj.type, "light");
    assert.strictEqual(obj.colors["editor.background"].toLowerCase(), "#ede0c8");
  });
});
