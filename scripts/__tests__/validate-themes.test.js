import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { readFileSync, globSync, existsSync } from "node:fs";
import { join } from "node:path";
import { validateTheme } from "../generate.js";

// ── WCAG 2.1 contrast helpers ─────────────────────────────────────────────────

/** Convert a 6-digit hex color to relative luminance (WCAG 2.1). */
function luminance(hex) {
  const c = hex.replace(/^#/, "");
  const toLinear = (v) => {
    const s = parseInt(c.slice(v, v + 2), 16) / 255;
    return s <= 0.04045 ? s / 12.92 : Math.pow((s + 0.055) / 1.055, 2.4);
  };
  return 0.2126 * toLinear(0) + 0.7152 * toLinear(2) + 0.0722 * toLinear(4);
}

/** Return WCAG 2.1 contrast ratio between two hex colors (always ≥ 1). */
export function wcagContrast(hex1, hex2) {
  const l1 = luminance(hex1);
  const l2 = luminance(hex2);
  const lighter = Math.max(l1, l2);
  const darker = Math.min(l1, l2);
  return (lighter + 0.05) / (darker + 0.05);
}

const THEMES_DIR = join(import.meta.dirname, "../../themes");

// ── Unit tests for validateTheme() ───────────────────────────────────────────

describe("validateTheme() — unit", () => {
  const validTheme = {
    name: "test",
    type: "dark",
    background: "#000000",
    foreground: "#FFFFFF",
    tokens: { primary: "#FF0000", accent: "#00FF00", muted: "#0000FF", error: "#FFFF00" },
    ansi: Array(16).fill("#000000"),
    ui: {
      cursor: "#FF0000",
      cursorText: "#000000",
      selection: "#111111",
      selectionText: "#FFFFFF",
      bold: "#FFFFFF",
      link: "#00FF00",
    },
    prompt: {
      layout: "single-line",
      showUsername: false,
      fill: "·",
      timePrefix: "○",
      successSymbol: "›",
      vimSymbol: "‹",
    },
  };

  it("accepts a valid dark theme with no errors", () => {
    assert.deepStrictEqual(validateTheme(validTheme), []);
  });

  it("accepts a valid light theme", () => {
    const light = { ...validTheme, type: "light" };
    assert.deepStrictEqual(validateTheme(light), []);
  });

  function omit(obj, ...keys) {
    const copy = { ...obj };
    for (const k of keys) delete copy[k];
    return copy;
  }

  it("reports error for missing 'name'", () => {
    const errors = validateTheme(omit(validTheme, "name"));
    assert.ok(
      errors.some((e) => e.includes('"name"')),
      `expected "name" error in: ${errors}`,
    );
  });

  it("reports error for missing 'type'", () => {
    const errors = validateTheme(omit(validTheme, "type"));
    assert.ok(errors.some((e) => e.includes('"type"')));
  });

  it("reports error for invalid 'type' value", () => {
    const errors = validateTheme({ ...validTheme, type: "DARK" });
    assert.ok(errors.some((e) => e.includes('"type"')));
  });

  it("reports error for missing 'background'", () => {
    const errors = validateTheme(omit(validTheme, "background"));
    assert.ok(errors.some((e) => e.includes('"background"')));
  });

  it("reports error for invalid 'background' hex", () => {
    const errors = validateTheme({ ...validTheme, background: "#ABC" });
    assert.ok(errors.some((e) => e.includes('"background"')));
  });

  it("reports error for missing 'foreground'", () => {
    const errors = validateTheme(omit(validTheme, "foreground"));
    assert.ok(errors.some((e) => e.includes('"foreground"')));
  });

  it("reports error for missing 'ansi'", () => {
    const errors = validateTheme(omit(validTheme, "ansi"));
    assert.ok(errors.some((e) => e.includes('"ansi"')));
  });

  it("reports error for ansi with 15 elements (not 16)", () => {
    const errors = validateTheme({ ...validTheme, ansi: Array(15).fill("#000000") });
    assert.ok(errors.some((e) => e.includes('"ansi"')));
  });

  it("reports error for ansi with 17 elements", () => {
    const errors = validateTheme({ ...validTheme, ansi: Array(17).fill("#000000") });
    assert.ok(errors.some((e) => e.includes('"ansi"')));
  });

  it("reports error for short-form hex in ansi slot", () => {
    const ansi = Array(16).fill("#000000");
    ansi[5] = "#ABC";
    const errors = validateTheme({ ...validTheme, ansi });
    assert.ok(errors.some((e) => e.includes('"ansi[5]"')));
  });

  it("reports error for missing 'tokens'", () => {
    const errors = validateTheme(omit(validTheme, "tokens"));
    assert.ok(errors.some((e) => e.includes('"tokens"')));
  });

  it("reports error for missing tokens.error", () => {
    const errors = validateTheme({ ...validTheme, tokens: omit(validTheme.tokens, "error") });
    assert.ok(errors.some((e) => e.includes('"tokens.error"')));
  });

  it("reports error for invalid hex in tokens.primary", () => {
    const errors = validateTheme({
      ...validTheme,
      tokens: { ...validTheme.tokens, primary: "red" },
    });
    assert.ok(errors.some((e) => e.includes('"tokens.primary"')));
  });

  it("returns multiple errors at once", () => {
    const empty = {};
    const errors = validateTheme(empty);
    assert.ok(errors.length > 1, `expected multiple errors, got: ${errors}`);
  });

  it("reports error for missing 'ui'", () => {
    const errors = validateTheme(omit(validTheme, "ui"));
    assert.ok(errors.some((e) => e.includes('"ui"')));
  });

  it("reports error for missing individual ui field (cursor)", () => {
    const errors = validateTheme({
      ...validTheme,
      ui: omit(validTheme.ui, "cursor"),
    });
    assert.ok(errors.some((e) => e.includes('"ui.cursor"')));
  });

  it("reports error for invalid hex in ui.selection", () => {
    const errors = validateTheme({
      ...validTheme,
      ui: { ...validTheme.ui, selection: "blue" },
    });
    assert.ok(errors.some((e) => e.includes('"ui.selection"')));
  });

  it("reports error for missing 'prompt'", () => {
    const errors = validateTheme(omit(validTheme, "prompt"));
    assert.ok(errors.some((e) => e.includes('"prompt"')));
  });

  it("reports error for invalid prompt.layout value", () => {
    const errors = validateTheme({
      ...validTheme,
      prompt: { ...validTheme.prompt, layout: "fancy" },
    });
    assert.ok(errors.some((e) => e.includes('"prompt.layout"')));
  });

  it("reports error for empty prompt.fill string", () => {
    const errors = validateTheme({
      ...validTheme,
      prompt: { ...validTheme.prompt, fill: "" },
    });
    assert.ok(errors.some((e) => e.includes('"prompt.fill"')));
  });

  it("reports error for missing prompt.successSymbol", () => {
    const errors = validateTheme({
      ...validTheme,
      prompt: omit(validTheme.prompt, "successSymbol"),
    });
    assert.ok(errors.some((e) => e.includes('"prompt.successSymbol"')));
  });
});

// ── Integration: all real theme JSON files must pass validation ───────────────

const themeNames = globSync("*/", { cwd: THEMES_DIR })
  .map((d) => d.replace(/\/$/, ""))
  .filter((name) => existsSync(join(THEMES_DIR, name, `${name}.json`)));

describe("real theme JSON files pass validateTheme()", () => {
  for (const name of themeNames) {
    it(`${name} has no validation errors`, () => {
      const json = JSON.parse(readFileSync(join(THEMES_DIR, name, `${name}.json`), "utf8"));
      const errors = validateTheme(json);
      assert.deepStrictEqual(errors, [], `${name}: ${errors.join("; ")}`);
    });
  }
});

// ── Palette uniqueness: no two same-type themes are perceptually indistinguishable ───

/** Convert 6-digit hex to OKLab [L, a, b] (perceptually uniform color space). */
function hexToOklab(hex) {
  const c = hex.replace(/^#/, "");
  const toLinear = (offset) => {
    const s = parseInt(c.slice(offset, offset + 2), 16) / 255;
    return s <= 0.04045 ? s / 12.92 : Math.pow((s + 0.055) / 1.055, 2.4);
  };
  const r = toLinear(0),
    g = toLinear(2),
    b = toLinear(4);
  // Linear sRGB → LMS (OKLab M1 matrix)
  const l = 0.4122214708 * r + 0.5363325363 * g + 0.0514459929 * b;
  const m = 0.2119034982 * r + 0.6806995451 * g + 0.1073969566 * b;
  const s = 0.0883024619 * r + 0.2817188376 * g + 0.6299787005 * b;
  // Cube root
  const l_ = Math.cbrt(l),
    m_ = Math.cbrt(m),
    s_ = Math.cbrt(s);
  // LMS → OKLab (M2 matrix)
  return [
    0.2104542553 * l_ + 0.793617785 * m_ - 0.0040720468 * s_,
    1.9779984951 * l_ - 2.428592205 * m_ + 0.4505937099 * s_,
    0.0259040371 * l_ + 0.7827717662 * m_ - 0.808675766 * s_,
  ];
}

/** Euclidean distance between two colors in OKLab space. */
function oklabDist(hex1, hex2) {
  const [L1, a1, b1] = hexToOklab(hex1);
  const [L2, a2, b2] = hexToOklab(hex2);
  return Math.sqrt((L1 - L2) ** 2 + (a1 - a2) ** 2 + (b1 - b2) ** 2);
}

describe("palette uniqueness — no two same-type themes are perceptually indistinguishable", () => {
  // A theme pair is distinct if primary, accent, OR muted differs enough.
  // All three must fall below MIN_DIST (logical AND) to fail.
  // OKLab is perceptually uniform, so saturation and lightness differences count,
  // unlike the old hue-only check that required ~35 grandfathered exceptions.
  // Using three tokens (primary+accent+muted) means a theme that shares primary
  // and accent territory but has a distinctive muted (e.g. eventide's lavender
  // muted vs ember's warm brown) passes naturally.
  const MIN_DIST = 0.07;

  // Pairs that pre-date this rule and are accepted as distinct concepts.
  // Each entry notes the weaker theme (lower min-token WCAG contrast) if removal
  // is ever considered.
  const KNOWN_CLOSE = new Set([
    "espresso|kiln", // weaker: kiln (WCAG 4.53 vs espresso 4.55) — ceramic vs coffee
    "noir|tallow", // weaker: noir (WCAG 4.66 vs tallow 5.28)   — film noir vs candle
  ]);
  const pairKey = (a, b) => [a, b].sort().join("|");

  const allThemes = [];
  for (const name of themeNames) {
    try {
      const theme = JSON.parse(readFileSync(join(THEMES_DIR, name, `${name}.json`), "utf8"));
      if (theme.tokens?.primary && theme.tokens?.accent && theme.tokens?.muted && theme.type) {
        allThemes.push({
          name,
          type: theme.type,
          primary: theme.tokens.primary,
          accent: theme.tokens.accent,
          muted: theme.tokens.muted,
        });
      }
    } catch {
      // skip invalid
    }
  }

  for (let i = 0; i < allThemes.length; i++) {
    for (let j = i + 1; j < allThemes.length; j++) {
      const a = allThemes[i];
      const b = allThemes[j];
      if (a.type !== b.type) continue;
      if (KNOWN_CLOSE.has(pairKey(a.name, b.name))) continue;

      it(`${a.name} vs ${b.name} (${a.type}): palette perceptually distinct`, () => {
        const dPrimary = oklabDist(a.primary, b.primary);
        const dAccent = oklabDist(a.accent, b.accent);
        const dMuted = oklabDist(a.muted, b.muted);
        assert.ok(
          dPrimary >= MIN_DIST || dAccent >= MIN_DIST || dMuted >= MIN_DIST,
          `${a.name} and ${b.name} are perceptually indistinct: ` +
            `primary ΔE=${dPrimary.toFixed(3)}, accent ΔE=${dAccent.toFixed(3)}, muted ΔE=${dMuted.toFixed(3)} — ` +
            `all three below MIN_DIST=${MIN_DIST}`,
        );
      });
    }
  }
});

// ── WCAG contrast: all semantic tokens must clear 4.5:1 against background ────

describe("WCAG AA contrast — semantic tokens vs background", () => {
  const MINIMUM = 4.5;
  const TOKEN_NAMES = ["primary", "accent", "muted", "error"];

  for (const name of themeNames) {
    const jsonPath = join(THEMES_DIR, name, `${name}.json`);
    let theme;
    try {
      theme = JSON.parse(readFileSync(jsonPath, "utf8"));
    } catch {
      // validateTheme tests already catch missing/invalid JSON
      continue;
    }
    if (!theme.background || !theme.tokens) continue;

    for (const token of TOKEN_NAMES) {
      const hex = theme.tokens[token];
      if (!hex) continue;

      it(`${name}: tokens.${token} (${hex}) ≥ ${MINIMUM}:1 vs background (${theme.background})`, () => {
        const ratio = wcagContrast(hex, theme.background);
        assert.ok(
          ratio >= MINIMUM,
          `${name}/tokens.${token} = ${hex} — contrast ${ratio.toFixed(2)}:1 against ${theme.background} is below WCAG AA minimum ${MINIMUM}:1`,
        );
      });
    }
  }
});
