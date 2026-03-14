import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateKitty } from "../generators/kitty.js";
import { theme, lightTheme } from "./fixture.js";

describe("generateKitty", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof generateKitty(theme), "string");
  });

  it("includes theme name as comment", () => {
    assert.match(generateKitty(theme), /testtheme/i);
  });

  it("sets background", () => {
    assert.match(generateKitty(theme), /background\s+#0D0F1A/i);
  });

  it("sets foreground", () => {
    assert.match(generateKitty(theme), /foreground\s+#F0EAD6/i);
  });

  it("sets cursor", () => {
    assert.match(generateKitty(theme), /cursor\s+#FF7F57/i);
  });

  it("sets cursor text color", () => {
    assert.match(generateKitty(theme), /cursor_text_color\s+#0D0F1A/i);
  });

  it("sets selection background", () => {
    assert.match(generateKitty(theme), /selection_background\s+#1E2040/i);
  });

  it("sets selection foreground", () => {
    assert.match(generateKitty(theme), /selection_foreground\s+#F0EAD6/i);
  });

  it("uses color0 through color15 keys", () => {
    const out = generateKitty(theme);
    assert.match(out, /color0\s+#0D0F1A/i);
    assert.match(out, /color15\s+#F0EAD6/i);
  });

  it("includes all 16 ANSI colors", () => {
    const out = generateKitty(theme);
    theme.ansi.forEach((hex) => assert.match(out, new RegExp(hex, "i")));
  });

  it("works for light themes", () => {
    const out = generateKitty(lightTheme);
    assert.match(out, /#EDE0C8/i);
  });
});
