import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateIntellij } from "../generators/intellij.js";
import { theme, lightTheme } from "./fixture.js";

describe("generateIntellij", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof generateIntellij(theme), "string");
  });

  it("is valid XML (starts with <?xml)", () => {
    assert.match(generateIntellij(theme), /^<\?xml/);
  });

  it("has scheme element with name attribute containing theme name", () => {
    assert.match(generateIntellij(theme), /scheme.*name="[^"]*testtheme/i);
  });

  it("has CONSOLE_BACKGROUND_KEY option", () => {
    assert.match(generateIntellij(theme), /CONSOLE_BACKGROUND_KEY/);
  });

  it("sets background color in CONSOLE_BACKGROUND_KEY", () => {
    const out = generateIntellij(theme);
    // Background is #0D0F1A → stored as 6-char hex without #, possibly prefixed with alpha
    assert.match(out, /0d0f1a/i);
  });

  it("has ANSI color options", () => {
    const out = generateIntellij(theme);
    assert.match(out, /ANSI_COLOR_0/);
    assert.match(out, /ANSI_COLOR_15/);
  });

  it("ANSI color values are 6-digit hex without #", () => {
    const out = generateIntellij(theme);
    // Should have value="0d0f1a" (ANSI 0 = background)
    assert.match(out, /value="0d0f1a"/i);
  });

  it("has keyword color attribute", () => {
    assert.match(generateIntellij(theme), /KEYWORD/i);
  });

  it("has comment color attribute", () => {
    assert.match(generateIntellij(theme), /COMMENT/i);
  });

  it("has string color attribute", () => {
    assert.match(generateIntellij(theme), /STRING/i);
  });

  it("sets dark scheme parent for dark themes", () => {
    assert.match(generateIntellij(theme), /Darcula/i);
  });

  it("sets light scheme parent for light themes", () => {
    assert.match(generateIntellij(lightTheme), /Default/i);
  });

  it("works for light themes", () => {
    const out = generateIntellij(lightTheme);
    assert.match(out, /ede0c8/i);
  });
});
