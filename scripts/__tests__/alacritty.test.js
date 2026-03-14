import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateAlacritty } from "../generators/alacritty.js";
import { theme, lightTheme } from "./fixture.js";

describe("generateAlacritty", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof generateAlacritty(theme), "string");
  });

  it("includes theme name as comment", () => {
    assert.match(generateAlacritty(theme), /testtheme/i);
  });

  it("sets primary background color", () => {
    assert.match(generateAlacritty(theme), /background\s*=\s*["']?#0D0F1A["']?/i);
  });

  it("sets primary foreground color", () => {
    assert.match(generateAlacritty(theme), /foreground\s*=\s*["']?#F0EAD6["']?/i);
  });

  it("sets cursor color", () => {
    assert.match(generateAlacritty(theme), /#FF7F57/i);
  });

  it("includes all 16 ANSI normal colors", () => {
    const out = generateAlacritty(theme);
    // ANSI normal 0–7
    assert.match(out, /#0D0F1A/i); // black
    assert.match(out, /#C85A5A/i); // red
    assert.match(out, /#6BB08A/i); // green
    assert.match(out, /#C4983A/i); // yellow
    assert.match(out, /#6B64A8/i); // blue
    assert.match(out, /#A870BC/i); // magenta
    assert.match(out, /#4A9CA8/i); // cyan
    assert.match(out, /#B8B0CC/i); // white
  });

  it("includes all 8 ANSI bright colors", () => {
    const out = generateAlacritty(theme);
    assert.match(out, /#2A2D3E/i); // bright black
    assert.match(out, /#E87070/i); // bright red
    assert.match(out, /#7EC99A/i); // bright green
    assert.match(out, /#E8B86D/i); // bright yellow
    assert.match(out, /#8B84C4/i); // bright blue
    assert.match(out, /#C490D1/i); // bright magenta
    assert.match(out, /#5FB8C0/i); // bright cyan
    assert.match(out, /#F0EAD6/i); // bright white
  });

  it("uses [colors] section headers", () => {
    assert.match(generateAlacritty(theme), /\[colors/);
  });

  it("works for light themes", () => {
    const out = generateAlacritty(lightTheme);
    assert.match(out, /#EDE0C8/i); // light background
  });
});
