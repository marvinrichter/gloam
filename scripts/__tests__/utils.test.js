import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { hex, component, rgb } from "../generators/utils.js";

describe("hex()", () => {
  it("strips leading # from a 6-digit hex color", () => {
    assert.strictEqual(hex("#AABBCC"), "AABBCC");
  });

  it("returns input unchanged when no leading #", () => {
    assert.strictEqual(hex("AABBCC"), "AABBCC");
  });

  it("handles lowercase input", () => {
    assert.strictEqual(hex("#aabbcc"), "aabbcc");
  });

  it("handles mixed-case input", () => {
    assert.strictEqual(hex("#AaBbCc"), "AaBbCc");
  });

  it("throws on 3-digit shorthand hex", () => {
    assert.throws(() => hex("#ABC"), /invalid/i);
  });

  it("throws on empty string", () => {
    assert.throws(() => hex(""), /invalid/i);
  });

  it("throws on 7-char string without #", () => {
    assert.throws(() => hex("AABBCCD"), /invalid/i);
  });

  it("throws on 8-digit hex (e.g. with alpha)", () => {
    assert.throws(() => hex("#AABBCCDD"), /invalid/i);
  });
});

describe("component()", () => {
  it("returns 1.0 for red channel of #FF0000", () => {
    assert.strictEqual(component("#FF0000", 0), 1.0);
  });

  it("returns 1.0 for green channel of #00FF00", () => {
    assert.strictEqual(component("#00FF00", 2), 1.0);
  });

  it("returns 1.0 for blue channel of #0000FF", () => {
    assert.strictEqual(component("#0000FF", 4), 1.0);
  });

  it("returns 0 for red channel of #000000", () => {
    assert.strictEqual(component("#000000", 0), 0);
  });

  it("returns approximately 0.502 for 0x80", () => {
    const val = component("#800000", 0);
    assert.ok(Math.abs(val - 128 / 255) < 0.001);
  });
});

describe("rgb()", () => {
  it("returns {r:1, g:0, b:0} for #FF0000", () => {
    const result = rgb("#FF0000");
    assert.strictEqual(result.r, 1.0);
    assert.strictEqual(result.g, 0);
    assert.strictEqual(result.b, 0);
  });

  it("returns {r:0, g:0, b:0} for black", () => {
    const result = rgb("#000000");
    assert.strictEqual(result.r, 0);
    assert.strictEqual(result.g, 0);
    assert.strictEqual(result.b, 0);
  });

  it("returns {r:1, g:1, b:1} for white", () => {
    const result = rgb("#FFFFFF");
    assert.strictEqual(result.r, 1);
    assert.strictEqual(result.g, 1);
    assert.strictEqual(result.b, 1);
  });

  it("has r, g, b keys", () => {
    const result = rgb("#C4894A");
    assert.ok("r" in result);
    assert.ok("g" in result);
    assert.ok("b" in result);
  });
});
