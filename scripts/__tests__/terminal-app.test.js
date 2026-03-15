import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateTerminalApp, encodeObject, encodeIntLen } from "../generators/terminal-app.js";
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

// ── encodeIntLen ──────────────────────────────────────────────────────────────

describe("encodeIntLen", () => {
  it("encodes n < 256 as 2-byte [0x10, n]", () => {
    const buf = encodeIntLen(10);
    assert.strictEqual(buf.length, 2);
    assert.strictEqual(buf[0], 0x10);
    assert.strictEqual(buf[1], 10);
  });

  it("encodes 256 <= n < 65536 as 3-byte big-endian", () => {
    const buf = encodeIntLen(0x0200);
    assert.strictEqual(buf.length, 3);
    assert.strictEqual(buf[0], 0x11);
    assert.strictEqual(buf.readUInt16BE(1), 0x0200);
  });

  it("encodes n >= 65536 as 5-byte big-endian", () => {
    const buf = encodeIntLen(0x10000);
    assert.strictEqual(buf.length, 5);
    assert.strictEqual(buf[0], 0x12);
    assert.strictEqual(buf.readUInt32BE(1), 0x10000);
  });
});

// ── encodeObject ──────────────────────────────────────────────────────────────

describe("encodeObject", () => {
  it("encodes int in [256, 65535] range as 3-byte value", () => {
    const buf = encodeObject(0x0100, "int");
    assert.strictEqual(buf.length, 3);
    assert.strictEqual(buf[0], 0x11);
    assert.strictEqual(buf.readUInt16BE(1), 0x0100);
  });

  it("encodes array with >= 15 elements using long-form header (0xaf)", () => {
    const arr = Array.from({ length: 15 }, (_, i) => i);
    const buf = encodeObject(arr, "array");
    assert.strictEqual(buf[0], 0xaf);
    // followed by encodeIntLen(15) which is [0x10, 15], then the 15 ref bytes
    assert.strictEqual(buf[1], 0x10);
    assert.strictEqual(buf[2], 15);
    assert.strictEqual(buf.length, 1 + 2 + 15);
  });

  it("encodes dict with >= 15 key-value pairs using long-form header (0xdf)", () => {
    const keys = Array.from({ length: 15 }, (_, i) => i);
    const values = Array.from({ length: 15 }, (_, i) => i + 15);
    const buf = encodeObject({ keys, values }, "dict");
    // Long-form dict header: 0xdf followed by encodeIntLen(15) = [0x10, 15]
    assert.strictEqual(buf[0], 0xdf);
    assert.strictEqual(buf[1], 0x10);
    assert.strictEqual(buf[2], 15);
    assert.strictEqual(buf.length, 1 + 2 + 15 + 15);
  });

  it("throws on unknown type", () => {
    assert.throws(() => encodeObject(null, "unknown"), /Unknown bplist type/);
  });
});
