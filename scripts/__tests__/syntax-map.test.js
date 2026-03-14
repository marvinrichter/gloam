import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { syntaxColors } from "../generators/syntax-map.js";
import { theme } from "./fixture.js";

const EXPECTED_KEYS = [
  "keyword", "type", "class", "function", "string", "number",
  "comment", "variable", "constant", "operator", "punctuation",
  "tag", "attribute", "error", "warning",
];

describe("syntaxColors()", () => {
  it("returns all expected keys", () => {
    const result = syntaxColors(theme);
    for (const key of EXPECTED_KEYS) {
      assert.ok(key in result, `missing key "${key}"`);
    }
  });

  it("returns no extra keys beyond the documented set", () => {
    const result = syntaxColors(theme);
    for (const key of Object.keys(result)) {
      assert.ok(EXPECTED_KEYS.includes(key), `unexpected key "${key}"`);
    }
  });

  it("keyword maps to tokens.accent", () => {
    assert.strictEqual(syntaxColors(theme).keyword, theme.tokens.accent);
  });

  it("type maps to tokens.primary", () => {
    assert.strictEqual(syntaxColors(theme).type, theme.tokens.primary);
  });

  it("class maps to tokens.primary", () => {
    assert.strictEqual(syntaxColors(theme).class, theme.tokens.primary);
  });

  it("function maps to tokens.primary", () => {
    assert.strictEqual(syntaxColors(theme).function, theme.tokens.primary);
  });

  it("string maps to ansi[10] (bright green)", () => {
    assert.strictEqual(syntaxColors(theme).string, theme.ansi[10]);
  });

  it("number maps to ansi[11] (bright yellow)", () => {
    assert.strictEqual(syntaxColors(theme).number, theme.ansi[11]);
  });

  it("comment maps to tokens.muted", () => {
    assert.strictEqual(syntaxColors(theme).comment, theme.tokens.muted);
  });

  it("variable maps to foreground", () => {
    assert.strictEqual(syntaxColors(theme).variable, theme.foreground);
  });

  it("constant maps to ansi[13] (bright magenta)", () => {
    assert.strictEqual(syntaxColors(theme).constant, theme.ansi[13]);
  });

  it("operator maps to tokens.muted", () => {
    assert.strictEqual(syntaxColors(theme).operator, theme.tokens.muted);
  });

  it("punctuation maps to tokens.muted", () => {
    assert.strictEqual(syntaxColors(theme).punctuation, theme.tokens.muted);
  });

  it("tag maps to tokens.accent", () => {
    assert.strictEqual(syntaxColors(theme).tag, theme.tokens.accent);
  });

  it("attribute maps to tokens.primary", () => {
    assert.strictEqual(syntaxColors(theme).attribute, theme.tokens.primary);
  });

  it("error maps to tokens.error", () => {
    assert.strictEqual(syntaxColors(theme).error, theme.tokens.error);
  });

  it("warning maps to ansi[3] (yellow)", () => {
    assert.strictEqual(syntaxColors(theme).warning, theme.ansi[3]);
  });

  it("all values are non-empty strings", () => {
    const result = syntaxColors(theme);
    for (const [key, value] of Object.entries(result)) {
      assert.ok(typeof value === "string" && value.length > 0, `"${key}" is not a non-empty string`);
    }
  });
});
