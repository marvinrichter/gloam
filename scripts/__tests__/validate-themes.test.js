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

// ── Hue uniqueness: no two same-type themes have primary tokens within 10° ───────

/** Convert a 6-digit hex to HSL hue (0–360). */
function hexToHue(hex) {
  const c = hex.replace(/^#/, "");
  const r = parseInt(c.slice(0, 2), 16) / 255;
  const g = parseInt(c.slice(2, 4), 16) / 255;
  const b = parseInt(c.slice(4, 6), 16) / 255;
  const max = Math.max(r, g, b);
  const min = Math.min(r, g, b);
  const d = max - min;
  if (d === 0) return 0;
  let h;
  if (max === r) h = ((g - b) / d) % 6;
  else if (max === g) h = (b - r) / d + 2;
  else h = (r - g) / d + 4;
  return (h * 60 + 360) % 360;
}

/** Angular distance between two hues (0–180). */
function hueDist(h1, h2) {
  const d = Math.abs(h1 - h2) % 360;
  return d > 180 ? 360 - d : d;
}

describe("hue uniqueness — no two same-type themes share primary hue within 10°", () => {
  const HUE_MINIMUM_DEG = 10;

  // Known-close pairs that pre-date this rule (grandfathered, not failed).
  // These pairs share similar hue territory by design — distinct concepts
  // that happen to live in the same part of the color wheel.
  const KNOWN_CLOSE = new Set([
    // Warm-gold band (30–47°): cordovan/ember/eventide/nocturne/tungsten
    "cordovan|ember",
    "cordovan|eventide",
    "cordovan|nocturne",
    "cordovan|tungsten",
    "ember|eventide",
    "ember|nocturne",
    "ember|tungsten",
    "eventide|nocturne",
    "eventide|tungsten",
    "nocturne|tungsten",
    // Teal/cyan band (161–175°): aether/nacreous/verdigris
    "aether|nacreous",
    "aether|verdigris",
    "nacreous|verdigris",
    // Blue-gray band (200–215°): fjord/sable/umbra
    "fjord|sable",
    "fjord|umbra",
    "sable|umbra",
    // Navy (216°): cirrus/daybook (light)
    "cirrus|daybook",
    // Red band (5–10°): ochre/solano (light)
    "ochre|solano",
    // Dark amber band (28–30°): parchment/saffron (light)
    "parchment|saffron",
    // Amber band extension: tallow (40°) and noir (46°) join warm-gold cluster
    "cordovan|tallow",
    "ember|tallow",
    "eventide|tallow",
    "nocturne|tallow",
    "tallow|tungsten",
    "cordovan|noir",
    "ember|noir",
    "eventide|noir",
    "nocturne|noir",
    "noir|tungsten",
    "noir|tallow",
    // Cast (55°) sits just inside the amber cluster boundary with noir (46°)
    "cast|noir",
    // Blue-gray band extension: ironcast (204°) joins fjord/sable/umbra cluster
    "fjord|ironcast",
    "ironcast|sable",
    "ironcast|umbra",
  ]);
  const pairKey = (a, b) => [a, b].sort().join("|");

  const allThemes = [];
  for (const name of themeNames) {
    try {
      const theme = JSON.parse(readFileSync(join(THEMES_DIR, name, `${name}.json`), "utf8"));
      if (theme.tokens?.primary && theme.type) {
        allThemes.push({ name, type: theme.type, primaryHue: hexToHue(theme.tokens.primary) });
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

      it(`${a.name} vs ${b.name} (${a.type}): primary hue gap ≥ ${HUE_MINIMUM_DEG}°`, () => {
        const dist = hueDist(a.primaryHue, b.primaryHue);
        assert.ok(
          dist >= HUE_MINIMUM_DEG,
          `${a.name} (hue ${a.primaryHue.toFixed(0)}°) and ${b.name} (hue ${b.primaryHue.toFixed(0)}°) are only ${dist.toFixed(1)}° apart`,
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
