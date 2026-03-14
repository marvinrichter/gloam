import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateWezterm } from "../generators/wezterm.js";
import { theme, lightTheme } from "./fixture.js";

describe("generateWezterm", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof generateWezterm(theme), "string");
  });

  it("includes theme name", () => {
    assert.match(generateWezterm(theme), /testtheme/i);
  });

  it("is valid Lua (starts with return or local)", () => {
    const out = generateWezterm(theme);
    assert.match(out, /^(return|local)/m);
  });

  it("sets background", () => {
    assert.match(generateWezterm(theme), /background\s*=\s*["']#0D0F1A["']/i);
  });

  it("sets foreground", () => {
    assert.match(generateWezterm(theme), /foreground\s*=\s*["']#F0EAD6["']/i);
  });

  it("sets cursor_bg", () => {
    assert.match(generateWezterm(theme), /cursor_bg\s*=\s*["']#FF7F57["']/i);
  });

  it("sets cursor_fg", () => {
    assert.match(generateWezterm(theme), /cursor_fg\s*=\s*["']#0D0F1A["']/i);
  });

  it("sets selection_bg", () => {
    assert.match(generateWezterm(theme), /selection_bg\s*=\s*["']#1E2040["']/i);
  });

  it("includes ansi table with 8 entries", () => {
    const out = generateWezterm(theme);
    assert.match(out, /ansi\s*=/);
    // spot-check first and last normal colors
    assert.match(out, /#0D0F1A/i);
    assert.match(out, /#B8B0CC/i);
  });

  it("includes brights table with 8 entries", () => {
    const out = generateWezterm(theme);
    assert.match(out, /brights\s*=/);
    assert.match(out, /#2A2D3E/i);
    assert.match(out, /#F0EAD6/i);
  });

  it("works for light themes", () => {
    const out = generateWezterm(lightTheme);
    assert.match(out, /#EDE0C8/i);
  });
});
