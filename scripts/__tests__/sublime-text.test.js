import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateSublimeText } from "../generators/sublime-text.js";
import { theme, lightTheme } from "./fixture.js";

describe("generateSublimeText", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof generateSublimeText(theme), "string");
  });

  it("ends with a newline", () => {
    assert.ok(generateSublimeText(theme).endsWith("\n"));
  });

  it("produces valid JSON", () => {
    assert.doesNotThrow(() => JSON.parse(generateSublimeText(theme)));
  });

  it("uses displayName when present", () => {
    const obj = JSON.parse(generateSublimeText(lightTheme));
    assert.strictEqual(obj.name, "Light Test");
  });

  it("falls back to name when displayName is absent", () => {
    const obj = JSON.parse(generateSublimeText(theme));
    assert.strictEqual(obj.name, "testtheme");
  });

  it("has author field referencing gloam", () => {
    const obj = JSON.parse(generateSublimeText(theme));
    assert.match(obj.author, /gloam/);
  });

  it("has variables block with background and foreground", () => {
    const obj = JSON.parse(generateSublimeText(theme));
    assert.strictEqual(obj.variables.background, "#0D0F1A");
    assert.strictEqual(obj.variables.foreground, "#F0EAD6");
  });

  it("variables block includes all 4 semantic tokens", () => {
    const obj = JSON.parse(generateSublimeText(theme));
    assert.strictEqual(obj.variables.primary, "#E8B86D");
    assert.strictEqual(obj.variables.accent, "#FF7F57");
    assert.strictEqual(obj.variables.muted, "#8B84C4");
    assert.strictEqual(obj.variables.error, "#E85D5D");
  });

  it("has globals block with required keys", () => {
    const obj = JSON.parse(generateSublimeText(theme));
    assert.ok("background" in obj.globals);
    assert.ok("foreground" in obj.globals);
    assert.ok("caret" in obj.globals);
    assert.ok("selection" in obj.globals);
    assert.ok("gutter" in obj.globals);
  });

  it("globals.caret matches ui.cursor", () => {
    const obj = JSON.parse(generateSublimeText(theme));
    assert.strictEqual(obj.globals.caret, "#FF7F57");
  });

  it("globals.selection matches ui.selection", () => {
    const obj = JSON.parse(generateSublimeText(theme));
    assert.strictEqual(obj.globals.selection, "#1E2040");
  });

  it("has a non-empty rules array", () => {
    const obj = JSON.parse(generateSublimeText(theme));
    assert.ok(Array.isArray(obj.rules));
    assert.ok(obj.rules.length > 0);
  });

  it("rules include Comment, Keyword, Function, String, Number entries", () => {
    const obj = JSON.parse(generateSublimeText(theme));
    const names = obj.rules.map((r) => r.name);
    assert.ok(names.includes("Comment"));
    assert.ok(names.includes("Keyword"));
    assert.ok(names.includes("Function"));
    assert.ok(names.includes("String"));
    assert.ok(names.includes("Number"));
  });

  it("rules include Markdown heading entry", () => {
    const obj = JSON.parse(generateSublimeText(theme));
    const names = obj.rules.map((r) => r.name);
    assert.ok(names.includes("Markdown heading"));
  });

  it("rules include Diff entries", () => {
    const obj = JSON.parse(generateSublimeText(theme));
    const names = obj.rules.map((r) => r.name);
    assert.ok(names.some((n) => n.startsWith("Diff")));
  });
});
