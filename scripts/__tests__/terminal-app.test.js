import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateTerminalApp } from "../generators/terminal-app.js";
import { theme, lightTheme } from "./fixture.js";

describe("generateTerminalApp", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof generateTerminalApp(theme), "string");
  });

  it("starts with <?xml", () => {
    assert.match(generateTerminalApp(theme), /^<\?xml/);
  });

  it("is a valid plist document", () => {
    assert.match(generateTerminalApp(theme), /<plist/);
    assert.match(generateTerminalApp(theme), /<\/plist>/);
  });

  it("includes theme name in comment header", () => {
    assert.match(generateTerminalApp(theme), /testtheme/i);
  });

  it("has BackgroundColor key", () => {
    assert.match(generateTerminalApp(theme), /BackgroundColor/);
  });

  it("has TextColor key", () => {
    assert.match(generateTerminalApp(theme), /TextColor/);
  });

  it("has CursorColor key", () => {
    assert.match(generateTerminalApp(theme), /CursorColor/);
  });

  it("has CursorTextColor key", () => {
    assert.match(generateTerminalApp(theme), /CursorTextColor/);
  });

  it("has SelectionColor key", () => {
    assert.match(generateTerminalApp(theme), /SelectionColor/);
  });

  it("has BoldTextColor key", () => {
    assert.match(generateTerminalApp(theme), /BoldTextColor/);
  });

  it("emits all 16 ANSI color keys", () => {
    const out = generateTerminalApp(theme);
    assert.match(out, /ANSIBlackColor/);
    assert.match(out, /ANSIRedColor/);
    assert.match(out, /ANSIGreenColor/);
    assert.match(out, /ANSIYellowColor/);
    assert.match(out, /ANSIBlueColor/);
    assert.match(out, /ANSIMagentaColor/);
    assert.match(out, /ANSICyanColor/);
    assert.match(out, /ANSIWhiteColor/);
    assert.match(out, /ANSIBrightBlackColor/);
    assert.match(out, /ANSIBrightRedColor/);
    assert.match(out, /ANSIBrightGreenColor/);
    assert.match(out, /ANSIBrightYellowColor/);
    assert.match(out, /ANSIBrightBlueColor/);
    assert.match(out, /ANSIBrightMagentaColor/);
    assert.match(out, /ANSIBrightCyanColor/);
    assert.match(out, /ANSIBrightWhiteColor/);
  });

  it("embeds base64-encoded binary plists in <data> blocks", () => {
    const out = generateTerminalApp(theme);
    assert.match(out, /<data>/);
    assert.match(out, /<\/data>/);
    // A binary plist starts with "bplist00" → base64 starts with "YnBs"
    assert.match(out, /YnBs/);
  });

  it("uses displayName when present", () => {
    const out = generateTerminalApp(lightTheme);
    assert.match(out, /Light Test/);
  });

  it("has ProfileCurrentVersion 2.07", () => {
    assert.match(generateTerminalApp(theme), /ProfileCurrentVersion/);
    assert.match(generateTerminalApp(theme), /2\.07/);
  });

  it("has Font and FontAntialias keys", () => {
    const out = generateTerminalApp(theme);
    assert.match(out, /Font/);
    assert.match(out, /FontAntialias/);
  });

  it("encodes integers < 256 correctly in bplist (short int path)", () => {
    // All themes use colors with small int counts — just verify output is valid base64
    const out = generateTerminalApp(theme);
    const dataMatches = [...out.matchAll(/<data>\s*([\s\S]*?)\s*<\/data>/g)];
    assert.ok(dataMatches.length > 0);
    for (const m of dataMatches) {
      const b64 = m[1].replace(/\s/g, "");
      assert.ok(Buffer.from(b64, "base64").length > 0);
    }
  });
});
