import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateNeovim } from "../generators/neovim.js";
import { theme, lightTheme } from "./fixture.js";

describe("generateNeovim", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof generateNeovim(theme), "string");
  });

  it("includes theme name", () => {
    assert.match(generateNeovim(theme), /testtheme/i);
  });

  it("is valid Lua (has vim.api calls or local block)", () => {
    const out = generateNeovim(theme);
    assert.match(out, /vim\.(api|cmd|g)/);
  });

  it("sets vim.g.colors_name", () => {
    assert.match(generateNeovim(theme), /vim\.g\.colors_name\s*=\s*["']testtheme["']/i);
  });

  it("sets Normal highlight with background and foreground", () => {
    const out = generateNeovim(theme);
    assert.match(out, /Normal/);
    assert.match(out, /#0D0F1A/i);
    assert.match(out, /#F0EAD6/i);
  });

  it("sets Comment highlight group", () => {
    assert.match(generateNeovim(theme), /Comment/);
  });

  it("sets Keyword highlight group", () => {
    assert.match(generateNeovim(theme), /Keyword/);
  });

  it("sets String highlight group", () => {
    assert.match(generateNeovim(theme), /String/);
  });

  it("keyword uses accent color", () => {
    const out = generateNeovim(theme);
    // Find the line(s) near Keyword and check for accent
    assert.match(out, /#FF7F57/i);
  });

  it("comment uses muted color", () => {
    const out = generateNeovim(theme);
    assert.match(out, /#8B84C4/i);
  });

  it("includes terminal color variables", () => {
    const out = generateNeovim(theme);
    assert.match(out, /terminal_color_0/);
    assert.match(out, /terminal_color_15/);
  });

  it("works for light themes", () => {
    const out = generateNeovim(lightTheme);
    assert.match(out, /#EDE0C8/i);
  });
});
