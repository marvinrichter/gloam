import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { generateStarship } from "../generators/starship.js";
import { theme, lightTheme } from "./fixture.js";

// Extend fixture with prompt metadata (required for starship generator)
const t = {
  ...theme,
  prompt: {
    layout:        "two-line-box",
    showUsername:  true,
    fill:          "─",
    timePrefix:    "◆",
    successSymbol: "❯",
    vimSymbol:     "❮",
  },
};

const tSingle = {
  ...theme,
  name: "testtheme-single",
  prompt: {
    layout:        "single-line",
    showUsername:  false,
    fill:          "·",
    timePrefix:    "⋄",
    successSymbol: "▸",
    vimSymbol:     "◂",
  },
};

describe("generateStarship", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof generateStarship(t), "string");
  });

  it("includes theme name in a comment header", () => {
    assert.match(generateStarship(t), /testtheme/i);
  });

  it("has add_newline = true", () => {
    assert.match(generateStarship(t), /add_newline\s*=\s*true/);
  });

  it("sets correct palette name", () => {
    assert.match(generateStarship(t), /palette\s*=\s*"testtheme"/);
  });

  it("has [palettes.testtheme] block", () => {
    assert.match(generateStarship(t), /\[palettes\.testtheme\]/);
  });

  it("palette block has all 4 token colors", () => {
    const out = generateStarship(t);
    assert.match(out, /primary\s*=\s*"#E8B86D"/i);
    assert.match(out, /accent\s*=\s*"#FF7F57"/i);
    assert.match(out, /muted\s*=\s*"#8B84C4"/i);
    assert.match(out, /error\s*=\s*"#E85D5D"/i);
  });

  it("two-line-box layout has ╭ and ╰─ frame lines", () => {
    const out = generateStarship(t);
    assert.match(out, /╭/);
    assert.match(out, /╰─/);
  });

  it("single-line layout has NO ╭ frame", () => {
    assert.doesNotMatch(generateStarship(tSingle), /╭/);
  });

  it("shows $username when showUsername is true", () => {
    assert.match(generateStarship(t), /\$username/);
  });

  it("omits $username when showUsername is false", () => {
    assert.doesNotMatch(generateStarship(tSingle), /\$username/);
  });

  it("uses the correct fill symbol", () => {
    assert.match(generateStarship(t), /symbol\s*=\s*"─"/);
    assert.match(generateStarship(tSingle), /symbol\s*=\s*"·"/);
  });

  it("uses the correct time prefix", () => {
    assert.match(generateStarship(t), /◆/);
    assert.match(generateStarship(tSingle), /⋄/);
  });

  it("sets success_symbol with successSymbol glyph in accent color", () => {
    assert.match(generateStarship(t), /success_symbol\s*=\s*"\[❯\]\(fg:accent\)"/);
    assert.match(generateStarship(tSingle), /success_symbol\s*=\s*"\[▸\]\(fg:accent\)"/);
  });

  it("sets error_symbol with successSymbol glyph in error color", () => {
    assert.match(generateStarship(t), /error_symbol\s*=\s*"\[❯\]\(fg:error\)"/);
  });

  it("sets vimcmd_symbol with vimSymbol glyph in primary color", () => {
    assert.match(generateStarship(t), /vimcmd_symbol\s*=\s*"\[❮\]\(fg:primary\)"/);
  });

  it("includes $directory module", () => {
    assert.match(generateStarship(t), /\$directory/);
  });

  it("includes $git_branch module", () => {
    assert.match(generateStarship(t), /\$git_branch/);
  });

  it("includes $fill module", () => {
    assert.match(generateStarship(t), /\$fill/);
  });

  it("includes $time module", () => {
    assert.match(generateStarship(t), /\$time/);
  });

  it("includes $cmd_duration module", () => {
    assert.match(generateStarship(t), /\$cmd_duration/);
  });

  it("has [time] block with disabled = false", () => {
    assert.match(generateStarship(t), /\[time\]/);
    assert.match(generateStarship(t), /disabled\s*=\s*false/);
  });

  it("has [directory] block with truncation_length", () => {
    assert.match(generateStarship(t), /\[directory\]/);
    assert.match(generateStarship(t), /truncation_length\s*=\s*3/);
  });

  it("has [git_branch] block", () => {
    assert.match(generateStarship(t), /\[git_branch\]/);
  });

  it("works for light themes", () => {
    const lt = { ...lightTheme, prompt: t.prompt };
    const out = generateStarship(lt);
    assert.match(out, /palette\s*=\s*"lighttest"/);
  });
});
