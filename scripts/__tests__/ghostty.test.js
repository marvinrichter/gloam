import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateGhostty } from "../generators/ghostty.js";
import { theme, lightTheme } from "./fixture.js";

describe("generateGhostty", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof generateGhostty(theme), "string");
  });

  it("includes theme name as comment", () => {
    assert.match(generateGhostty(theme), /testtheme/i);
  });

  it("sets background", () => {
    assert.match(generateGhostty(theme), /background\s*=\s*0d0f1a/i);
  });

  it("sets foreground", () => {
    assert.match(generateGhostty(theme), /foreground\s*=\s*f0ead6/i);
  });

  it("sets cursor color", () => {
    assert.match(generateGhostty(theme), /cursor-color\s*=\s*ff7f57/i);
  });

  it("sets selection background", () => {
    assert.match(generateGhostty(theme), /selection-background\s*=\s*1e2040/i);
  });

  it("sets selection foreground", () => {
    assert.match(generateGhostty(theme), /selection-foreground\s*=\s*f0ead6/i);
  });

  it("uses palette = N=RRGGBB format for ANSI colors", () => {
    const out = generateGhostty(theme);
    assert.match(out, /palette\s*=\s*0=/i);
    assert.match(out, /palette\s*=\s*15=/i);
  });

  it("includes all 16 ANSI color values without # prefix", () => {
    const out = generateGhostty(theme);
    // Ghostty uses hex without the # sign
    assert.match(out, /0d0f1a/i);
    assert.match(out, /f0ead6/i);
  });

  it("works for light themes", () => {
    const out = generateGhostty(lightTheme);
    assert.match(out, /ede0c8/i);
  });
});
