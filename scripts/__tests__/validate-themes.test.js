import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { readFileSync, globSync } from "node:fs";
import { join } from "node:path";
import { validateTheme } from "../generate.js";

const THEMES_DIR = join(import.meta.dirname, "../../themes");

// ── Unit tests for validateTheme() ───────────────────────────────────────────

describe("validateTheme() — unit", () => {
  const validTheme = {
    name: "test",
    type: "dark",
    background: "#000000",
    foreground: "#FFFFFF",
    tokens: { primary: "#FF0000", accent: "#00FF00", muted: "#0000FF", error: "#FFFF00" },
    ansi: Array(16).fill("#000000"),
  };

  it("accepts a valid dark theme with no errors", () => {
    assert.deepStrictEqual(validateTheme(validTheme), []);
  });

  it("accepts a valid light theme", () => {
    const light = { ...validTheme, type: "light" };
    assert.deepStrictEqual(validateTheme(light), []);
  });

  function omit(obj, ...keys) {
    const copy = { ...obj };
    for (const k of keys) delete copy[k];
    return copy;
  }

  it("reports error for missing 'name'", () => {
    const errors = validateTheme(omit(validTheme, "name"));
    assert.ok(errors.some((e) => e.includes('"name"')), `expected "name" error in: ${errors}`);
  });

  it("reports error for missing 'type'", () => {
    const errors = validateTheme(omit(validTheme, "type"));
    assert.ok(errors.some((e) => e.includes('"type"')));
  });

  it("reports error for invalid 'type' value", () => {
    const errors = validateTheme({ ...validTheme, type: "DARK" });
    assert.ok(errors.some((e) => e.includes('"type"')));
  });

  it("reports error for missing 'background'", () => {
    const errors = validateTheme(omit(validTheme, "background"));
    assert.ok(errors.some((e) => e.includes('"background"')));
  });

  it("reports error for invalid 'background' hex", () => {
    const errors = validateTheme({ ...validTheme, background: "#ABC" });
    assert.ok(errors.some((e) => e.includes('"background"')));
  });

  it("reports error for missing 'foreground'", () => {
    const errors = validateTheme(omit(validTheme, "foreground"));
    assert.ok(errors.some((e) => e.includes('"foreground"')));
  });

  it("reports error for missing 'ansi'", () => {
    const errors = validateTheme(omit(validTheme, "ansi"));
    assert.ok(errors.some((e) => e.includes('"ansi"')));
  });

  it("reports error for ansi with 15 elements (not 16)", () => {
    const errors = validateTheme({ ...validTheme, ansi: Array(15).fill("#000000") });
    assert.ok(errors.some((e) => e.includes('"ansi"')));
  });

  it("reports error for ansi with 17 elements", () => {
    const errors = validateTheme({ ...validTheme, ansi: Array(17).fill("#000000") });
    assert.ok(errors.some((e) => e.includes('"ansi"')));
  });

  it("reports error for short-form hex in ansi slot", () => {
    const ansi = Array(16).fill("#000000");
    ansi[5] = "#ABC";
    const errors = validateTheme({ ...validTheme, ansi });
    assert.ok(errors.some((e) => e.includes('"ansi[5]"')));
  });

  it("reports error for missing 'tokens'", () => {
    const errors = validateTheme(omit(validTheme, "tokens"));
    assert.ok(errors.some((e) => e.includes('"tokens"')));
  });

  it("reports error for missing tokens.error", () => {
    const errors = validateTheme({ ...validTheme, tokens: omit(validTheme.tokens, "error") });
    assert.ok(errors.some((e) => e.includes('"tokens.error"')));
  });

  it("reports error for invalid hex in tokens.primary", () => {
    const errors = validateTheme({ ...validTheme, tokens: { ...validTheme.tokens, primary: "red" } });
    assert.ok(errors.some((e) => e.includes('"tokens.primary"')));
  });

  it("returns multiple errors at once", () => {
    const empty = {};
    const errors = validateTheme(empty);
    assert.ok(errors.length > 1, `expected multiple errors, got: ${errors}`);
  });
});

// ── Integration: all real theme JSON files must pass validation ───────────────

const themeNames = globSync("*/", { cwd: THEMES_DIR }).map((d) => d.replace(/\/$/, ""));

describe("real theme JSON files pass validateTheme()", () => {
  for (const name of themeNames) {
    it(`${name} has no validation errors`, () => {
      const json = JSON.parse(readFileSync(join(THEMES_DIR, name, `${name}.json`), "utf8"));
      const errors = validateTheme(json);
      assert.deepStrictEqual(errors, [], `${name}: ${errors.join("; ")}`);
    });
  }
});
