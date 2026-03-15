import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateOhMyPosh } from "../generators/oh-my-posh.js";
import { theme } from "./fixture.js";

// oh-my-posh generator requires prompt metadata
const t = {
  ...theme,
  prompt: {
    layout: "two-line-box",
    showUsername: true,
    fill: "─",
    timePrefix: "◆",
    successSymbol: "❯",
    vimSymbol: "❮",
  },
};

const tSingleLine = {
  ...theme,
  prompt: {
    layout: "single-line",
    showUsername: false,
    fill: "·",
    timePrefix: "⋄",
    successSymbol: "▸",
    vimSymbol: "◂",
  },
};

describe("generateOhMyPosh", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof generateOhMyPosh(t), "string");
  });

  it("ends with a newline", () => {
    assert.ok(generateOhMyPosh(t).endsWith("\n"));
  });

  it("produces valid JSON", () => {
    assert.doesNotThrow(() => JSON.parse(generateOhMyPosh(t)));
  });

  it("has $schema pointing to oh-my-posh", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    assert.match(obj.$schema, /oh-my-posh/i);
  });

  it("has version 2", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    assert.strictEqual(obj.version, 2);
  });

  it("has final_space true", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    assert.strictEqual(obj.final_space, true);
  });

  it("has a palette block with all 4 semantic colors", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    assert.strictEqual(obj.palette.primary, "#E8B86D");
    assert.strictEqual(obj.palette.accent, "#FF7F57");
    assert.strictEqual(obj.palette.muted, "#8B84C4");
    assert.strictEqual(obj.palette.error, "#E85D5D");
  });

  it("palette has background and foreground", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    assert.strictEqual(obj.palette.background, "#0D0F1A");
    assert.strictEqual(obj.palette.foreground, "#F0EAD6");
  });

  it("has 3 prompt blocks (left line1, right line1, left line2)", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    assert.ok(Array.isArray(obj.blocks));
    assert.strictEqual(obj.blocks.length, 3);
  });

  it("first block is left-aligned with newline", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    assert.strictEqual(obj.blocks[0].alignment, "left");
    assert.strictEqual(obj.blocks[0].newline, true);
  });

  it("second block is right-aligned (time)", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    assert.strictEqual(obj.blocks[1].alignment, "right");
  });

  it("third block is left-aligned with newline (cursor line)", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    assert.strictEqual(obj.blocks[2].alignment, "left");
    assert.strictEqual(obj.blocks[2].newline, true);
  });

  it("two-line-box layout includes opening bracket text segment", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    const firstSegs = obj.blocks[0].segments;
    const textSegs = firstSegs.filter((s) => s.type === "text");
    assert.ok(textSegs.some((s) => s.template.includes("╭")));
  });

  it("two-line-box layout includes closing bracket on cursor line", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    const lastSegs = obj.blocks[2].segments;
    const textSegs = lastSegs.filter((s) => s.type === "text");
    assert.ok(textSegs.some((s) => s.template.includes("╰")));
  });

  it("showUsername=true includes session segment", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    const segs = obj.blocks[0].segments;
    assert.ok(segs.some((s) => s.type === "session"));
  });

  it("showUsername=false omits session segment", () => {
    const obj = JSON.parse(generateOhMyPosh(tSingleLine));
    const segs = obj.blocks[0].segments;
    assert.ok(segs.every((s) => s.type !== "session"));
  });

  it("single-line layout omits bracket text segments", () => {
    const obj = JSON.parse(generateOhMyPosh(tSingleLine));
    const firstSegs = obj.blocks[0].segments;
    const textSegs = firstSegs.filter((s) => s.type === "text");
    assert.strictEqual(textSegs.length, 0);
  });

  it("first block always has path segment", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    assert.ok(obj.blocks[0].segments.some((s) => s.type === "path"));
  });

  it("first block has git segment", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    assert.ok(obj.blocks[0].segments.some((s) => s.type === "git"));
  });

  it("first block has executiontime segment", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    assert.ok(obj.blocks[0].segments.some((s) => s.type === "executiontime"));
  });

  it("right block has time segment with 15:04 format", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    const timeSeg = obj.blocks[1].segments.find((s) => s.type === "time");
    assert.ok(timeSeg);
    assert.strictEqual(timeSeg.properties.time_format, "15:04");
  });

  it("cursor line has status segment with always_enabled", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    const lastSegs = obj.blocks[2].segments;
    const statusSeg = lastSegs.find((s) => s.type === "status");
    assert.ok(statusSeg);
    assert.strictEqual(statusSeg.properties.always_enabled, true);
  });

  it("status segment template uses successSymbol", () => {
    const obj = JSON.parse(generateOhMyPosh(t));
    const lastSegs = obj.blocks[2].segments;
    const statusSeg = lastSegs.find((s) => s.type === "status");
    assert.match(statusSeg.template, /❯/);
  });
});
