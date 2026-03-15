import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateZed } from "../generators/zed.js";
import { theme, lightTheme } from "./fixture.js";

describe("generateZed", () => {
  it("returns valid JSON string", () => {
    const out = generateZed(theme);
    assert.doesNotThrow(() => JSON.parse(out));
  });

  it("has top-level themes array", () => {
    const obj = JSON.parse(generateZed(theme));
    assert.ok(Array.isArray(obj.themes));
    assert.strictEqual(obj.themes.length, 1);
  });

  it("theme entry has name matching theme name", () => {
    const obj = JSON.parse(generateZed(theme));
    assert.match(obj.themes[0].name, /testtheme/i);
  });

  it("theme entry has appearance dark for dark themes", () => {
    const obj = JSON.parse(generateZed(theme));
    assert.strictEqual(obj.themes[0].appearance, "dark");
  });

  it("theme entry has appearance light for light themes", () => {
    const obj = JSON.parse(generateZed(lightTheme));
    assert.strictEqual(obj.themes[0].appearance, "light");
  });

  it("theme entry has style object", () => {
    const obj = JSON.parse(generateZed(theme));
    assert.strictEqual(typeof obj.themes[0].style, "object");
  });

  it("sets background in style", () => {
    const obj = JSON.parse(generateZed(theme));
    assert.strictEqual(obj.themes[0].style.background.toLowerCase(), "#0d0f1a");
  });

  it("sets foreground in style", () => {
    const obj = JSON.parse(generateZed(theme));
    assert.strictEqual(obj.themes[0].style.foreground.toLowerCase(), "#f0ead6");
  });

  it("sets terminal.background", () => {
    const obj = JSON.parse(generateZed(theme));
    assert.strictEqual(obj.themes[0].style["terminal.background"].toLowerCase(), "#0d0f1a");
  });

  it("sets all 16 terminal ANSI colors", () => {
    const obj = JSON.parse(generateZed(theme));
    const style = obj.themes[0].style;
    const expected = [
      "terminal.ansi.black",
      "terminal.ansi.red",
      "terminal.ansi.green",
      "terminal.ansi.yellow",
      "terminal.ansi.blue",
      "terminal.ansi.magenta",
      "terminal.ansi.cyan",
      "terminal.ansi.white",
      "terminal.ansi.bright_black",
      "terminal.ansi.bright_red",
      "terminal.ansi.bright_green",
      "terminal.ansi.bright_yellow",
      "terminal.ansi.bright_blue",
      "terminal.ansi.bright_magenta",
      "terminal.ansi.bright_cyan",
      "terminal.ansi.bright_white",
    ];
    expected.forEach((k) => assert.ok(k in style, `missing ${k}`));
  });

  it("maps ANSI colors correctly", () => {
    const obj = JSON.parse(generateZed(theme));
    const style = obj.themes[0].style;
    assert.strictEqual(style["terminal.ansi.black"].toLowerCase(), "#0d0f1a");
    assert.strictEqual(style["terminal.ansi.bright_white"].toLowerCase(), "#f0ead6");
  });

  it("sets syntax colors", () => {
    const obj = JSON.parse(generateZed(theme));
    const style = obj.themes[0].style;
    assert.ok("syntax" in style, "missing syntax key");
  });

  it("keywords use accent color", () => {
    const obj = JSON.parse(generateZed(theme));
    const kw = obj.themes[0].style.syntax?.keyword;
    assert.ok(kw, "missing syntax.keyword");
    assert.strictEqual(kw.color.toLowerCase(), "#ff7f57");
  });

  it("comments use muted color", () => {
    const obj = JSON.parse(generateZed(theme));
    const cm = obj.themes[0].style.syntax?.comment;
    assert.ok(cm, "missing syntax.comment");
    assert.strictEqual(cm.color.toLowerCase(), "#8b84c4");
  });

  it("works for light themes", () => {
    const obj = JSON.parse(generateZed(lightTheme));
    assert.strictEqual(obj.themes[0].style.background.toLowerCase(), "#ede0c8");
    assert.strictEqual(obj.themes[0].appearance, "light");
  });
});
