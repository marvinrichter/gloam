import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateWindowsTerminal } from "../generators/windows-terminal.js";
import { theme, lightTheme } from "./fixture.js";

describe("generateWindowsTerminal", () => {
  it("returns valid JSON string", () => {
    const out = generateWindowsTerminal(theme);
    assert.doesNotThrow(() => JSON.parse(out));
  });

  it("has a name field matching the theme name", () => {
    const obj = JSON.parse(generateWindowsTerminal(theme));
    assert.match(obj.name, /testtheme/i);
  });

  it("sets background", () => {
    const obj = JSON.parse(generateWindowsTerminal(theme));
    assert.strictEqual(obj.background.toLowerCase(), "#0d0f1a");
  });

  it("sets foreground", () => {
    const obj = JSON.parse(generateWindowsTerminal(theme));
    assert.strictEqual(obj.foreground.toLowerCase(), "#f0ead6");
  });

  it("sets cursorColor", () => {
    const obj = JSON.parse(generateWindowsTerminal(theme));
    assert.strictEqual(obj.cursorColor.toLowerCase(), "#ff7f57");
  });

  it("sets selectionBackground", () => {
    const obj = JSON.parse(generateWindowsTerminal(theme));
    assert.strictEqual(obj.selectionBackground.toLowerCase(), "#1e2040");
  });

  it("includes all 8 normal ANSI color keys", () => {
    const obj = JSON.parse(generateWindowsTerminal(theme));
    const keys = ["black", "red", "green", "yellow", "blue", "purple", "cyan", "white"];
    keys.forEach((k) => assert.ok(k in obj, `missing key: ${k}`));
  });

  it("includes all 8 bright ANSI color keys", () => {
    const obj = JSON.parse(generateWindowsTerminal(theme));
    const keys = [
      "brightBlack",
      "brightRed",
      "brightGreen",
      "brightYellow",
      "brightBlue",
      "brightPurple",
      "brightCyan",
      "brightWhite",
    ];
    keys.forEach((k) => assert.ok(k in obj, `missing key: ${k}`));
  });

  it("maps ANSI colors correctly", () => {
    const obj = JSON.parse(generateWindowsTerminal(theme));
    assert.strictEqual(obj.black.toLowerCase(), "#0d0f1a");
    assert.strictEqual(obj.brightWhite.toLowerCase(), "#f0ead6");
    assert.strictEqual(obj.red.toLowerCase(), "#c85a5a");
    assert.strictEqual(obj.brightYellow.toLowerCase(), "#e8b86d");
  });

  it("works for light themes", () => {
    const obj = JSON.parse(generateWindowsTerminal(lightTheme));
    assert.strictEqual(obj.background.toLowerCase(), "#ede0c8");
  });
});
