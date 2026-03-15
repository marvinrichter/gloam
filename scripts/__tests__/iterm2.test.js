import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateIterm2 } from "../generators/iterm2.js";
import { theme, lightTheme } from "./fixture.js";

describe("generateIterm2", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof generateIterm2(theme), "string");
  });

  it("starts with <?xml", () => {
    assert.match(generateIterm2(theme), /^<\?xml/);
  });

  it("is a plist document", () => {
    assert.match(generateIterm2(theme), /<plist/);
    assert.match(generateIterm2(theme), /<\/plist>/);
  });

  it("includes theme name in a comment", () => {
    assert.match(generateIterm2(theme), /testtheme/i);
  });

  it("has Background Color key", () => {
    assert.match(generateIterm2(theme), /Background Color/);
  });

  it("has Foreground Color key", () => {
    assert.match(generateIterm2(theme), /Foreground Color/);
  });

  it("has Cursor Color key", () => {
    assert.match(generateIterm2(theme), /Cursor Color/);
  });

  it("has Cursor Text Color key", () => {
    assert.match(generateIterm2(theme), /Cursor Text Color/);
  });

  it("has Selection Color key", () => {
    assert.match(generateIterm2(theme), /Selection Color/);
  });

  it("has Selected Text Color key", () => {
    assert.match(generateIterm2(theme), /Selected Text Color/);
  });

  it("has Bold Color key", () => {
    assert.match(generateIterm2(theme), /Bold Color/);
  });

  it("has Link Color key", () => {
    assert.match(generateIterm2(theme), /Link Color/);
  });

  it("has all 16 Ansi N Color keys", () => {
    const out = generateIterm2(theme);
    for (let i = 0; i <= 15; i++) {
      assert.match(out, new RegExp(`Ansi ${i} Color`));
    }
  });

  it("uses Calibrated color space", () => {
    assert.match(generateIterm2(theme), /Calibrated/);
  });

  it("uses Red Component / Green Component / Blue Component keys", () => {
    const out = generateIterm2(theme);
    assert.match(out, /Red Component/);
    assert.match(out, /Green Component/);
    assert.match(out, /Blue Component/);
  });

  it("background float is correct for #0D0F1A", () => {
    // #0D = 13, 13/255 ≈ 0.05098 (Red)
    // #0F = 15, 15/255 ≈ 0.05882 (Green)
    // #1A = 26, 26/255 ≈ 0.10196 (Blue)
    const out = generateIterm2(theme);
    // Look for these values appearing in the plist (within 3 decimal places)
    assert.match(out, /0\.05[01]/); // red component of bg
    assert.match(out, /0\.058/); // green component of bg
    assert.match(out, /0\.10[12]/); // blue component of bg
  });

  it("ANSI 0 (black) matches background", () => {
    // theme.ansi[0] = "#0D0F1A" = same as background
    // Both should produce the same float values
    const out = generateIterm2(theme);
    // Count occurrences of bg red component (0.05098) — should appear at least twice
    const matches = (out.match(/0\.0509[0-9]/g) || []).length;
    assert.ok(matches >= 2, `expected bg red component to appear ≥2 times, got ${matches}`);
  });

  it("ANSI 15 (bright white) matches foreground", () => {
    // theme.ansi[15] = "#F0EAD6" = foreground
    // #F0 = 240, 240/255 ≈ 0.94118
    const out = generateIterm2(theme);
    const matches = (out.match(/0\.9411[0-9]/g) || []).length;
    assert.ok(matches >= 2, `expected fg red component to appear ≥2 times, got ${matches}`);
  });

  it("works for light themes", () => {
    const out = generateIterm2(lightTheme);
    assert.match(out, /lighttest/i);
    // #EDE0C8 bg: #ED = 237, 237/255 ≈ 0.92941
    assert.match(out, /0\.929/);
  });
});
