#!/usr/bin/env node
/**
 * create-gap-themes.js — Scaffold all 17 gap themes identified in the 2026-03-15 gap analysis.
 *
 * Usage:  node scripts/create-gap-themes.js
 *
 * After running:
 *   npm run generate   — produce all 16 format files per theme
 *   npm test           — verify WCAG AA contrast + schema
 */

import { writeFileSync, mkdirSync, existsSync } from "node:fs";
import { join } from "node:path";
import { fileURLToPath } from "node:url";
import { buildThemeMd } from "./new-theme.js";

const THEMES_DIR = join(fileURLToPath(import.meta.url), "../..", "themes");

// ── WCAG helpers ──────────────────────────────────────────────────────────────

function luminance(hex) {
  const c = hex.replace(/^#/, "");
  const toLinear = (v) => {
    const s = parseInt(c.slice(v, v + 2), 16) / 255;
    return s <= 0.04045 ? s / 12.92 : Math.pow((s + 0.055) / 1.055, 2.4);
  };
  return 0.2126 * toLinear(0) + 0.7152 * toLinear(2) + 0.0722 * toLinear(4);
}

function contrast(a, b) {
  const l1 = luminance(a);
  const l2 = luminance(b);
  return (Math.max(l1, l2) + 0.05) / (Math.min(l1, l2) + 0.05);
}

// ── Theme definitions ─────────────────────────────────────────────────────────

const themes = [
  // ── 1. Carmine — deep crimson red-primary ─────────────────────────────────
  {
    name: "carmine",
    displayName: "Carmine",
    concept: "aged carmine ink bleeding through wet paper — the only red that matters",
    type: "dark",
    background: "#100808",
    foreground: "#F2E4E0",
    tokens: {
      primary: "#E87070",
      accent: "#FFAA70",
      muted: "#9A7880",
      error: "#FF4A4A",
    },
    ansi: [
      "#100808", // 0  black = background
      "#C85858", // 1  muted red
      "#5A8A60", // 2  muted green
      "#C08040", // 3  muted amber
      "#705870", // 4  muted violet-rose
      "#A85878", // 5  muted rose-magenta
      "#407888", // 6  muted teal-blue
      "#B8A0A0", // 7  muted warm white
      "#2A1818", // 8  bright-black = dim bg
      "#FF4A4A", // 9  bright red = error
      "#78C878", // 10 bright green
      "#E87070", // 11 bright yellow slot = primary
      "#9A7880", // 12 bright blue slot = muted
      "#D08090", // 13 bright magenta
      "#58A8B8", // 14 bright cyan
      "#F2E4E0", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#FFAA70",
      cursorText: "#100808",
      selection: "#281010",
      selectionText: "#F2E4E0",
      bold: "#F2E4E0",
      link: "#E890A0",
    },
    prompt: {
      layout: "two-line-box",
      showUsername: false,
      fill: "╴",
      timePrefix: "◉",
      successSymbol: "❯",
      vimSymbol: "❮",
    },
  },

  // ── 2. Synthwave — retro neon magenta + cyan ──────────────────────────────
  {
    name: "synthwave",
    displayName: "Synthwave",
    concept: "neon grids and chrome reflections in a rain-slicked midnight arcade",
    type: "dark",
    background: "#0D0818",
    foreground: "#F0E8FF",
    tokens: {
      primary: "#FF60C8",
      accent: "#40E8E0",
      muted: "#9070C8",
      error: "#FF4070",
    },
    ansi: [
      "#0D0818", // 0  black = background
      "#C84060", // 1  muted red-pink
      "#40C890", // 2  muted neon-green
      "#D080C0", // 3  muted magenta-gold
      "#6050D0", // 4  muted deep purple
      "#C040C8", // 5  muted magenta
      "#40C0D8", // 6  muted cyan
      "#B0A0D0", // 7  dim lavender-white
      "#281848", // 8  bright-black = deep purple dim
      "#FF4070", // 9  bright red-pink = error
      "#50E890", // 10 bright neon-green
      "#FF60C8", // 11 bright slot = primary hot-magenta
      "#9070C8", // 12 bright slot = muted purple
      "#E060F0", // 13 bright violet
      "#40E8E0", // 14 bright cyan = accent
      "#F0E8FF", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#40E8E0",
      cursorText: "#0D0818",
      selection: "#1A1030",
      selectionText: "#F0E8FF",
      bold: "#F0E8FF",
      link: "#60C8FF",
    },
    prompt: {
      layout: "two-line-box",
      showUsername: false,
      fill: "▒",
      timePrefix: "⬡",
      successSymbol: "⟫",
      vimSymbol: "⟪",
    },
  },

  // ── 3. Sumi — Japanese ink wash ───────────────────────────────────────────
  {
    name: "sumi",
    displayName: "Sumi",
    concept: "sumi ink dissolving in cold water — the moment the brush lifts from washi",
    type: "dark",
    background: "#0A0B0D",
    foreground: "#D8D0C0",
    tokens: {
      primary: "#D8B878",
      accent: "#7898B8",
      muted: "#788090",
      error: "#B86868",
    },
    ansi: [
      "#0A0B0D", // 0  black = background
      "#9A5050", // 1  muted red
      "#4A8860", // 2  muted pine green
      "#A09060", // 3  muted aged gold
      "#587080", // 4  muted slate blue
      "#806878", // 5  muted mulberry
      "#407880", // 6  muted ink-teal
      "#909090", // 7  neutral gray
      "#202428", // 8  bright-black = dark stone
      "#B86868", // 9  bright red = error vermilion
      "#60A870", // 10 bright mossy green
      "#D8B878", // 11 bright slot = primary aged gold
      "#788090", // 12 bright slot = muted slate
      "#9078A0", // 13 bright mulberry
      "#5898A8", // 14 bright washed blue
      "#D8D0C0", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#7898B8",
      cursorText: "#0A0B0D",
      selection: "#181A20",
      selectionText: "#D8D0C0",
      bold: "#D8D0C0",
      link: "#8AB0C8",
    },
    prompt: {
      layout: "single-line",
      showUsername: false,
      fill: "∷",
      timePrefix: "◎",
      successSymbol: "›",
      vimSymbol: "‹",
    },
  },

  // ── 4. Ironcast — storm steel ─────────────────────────────────────────────
  {
    name: "ironcast",
    displayName: "Ironcast",
    concept: "charged atmosphere before a storm breaks — steel sky split by lightning",
    type: "dark",
    background: "#0B0D10",
    foreground: "#CDD4DC",
    tokens: {
      primary: "#78A8C8",
      accent: "#C8D838",
      muted: "#6A7888",
      error: "#D05858",
    },
    ansi: [
      "#0B0D10", // 0  black = background
      "#B05050", // 1  muted warning red
      "#487858", // 2  muted iron-green
      "#9A9050", // 3  muted tarnished gold
      "#4868A0", // 4  muted cobalt
      "#786890", // 5  muted violet-steel
      "#407888", // 6  muted teal-steel
      "#909898", // 7  cold gray
      "#1C2028", // 8  bright-black = steel dim
      "#D05858", // 9  bright red = error
      "#60A878", // 10 bright green
      "#78A8C8", // 11 bright slot = primary steel blue
      "#6A7888", // 12 bright slot = muted slate
      "#9880B8", // 13 bright violet
      "#50A0B8", // 14 bright steel cyan
      "#CDD4DC", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#C8D838",
      cursorText: "#0B0D10",
      selection: "#181C24",
      selectionText: "#CDD4DC",
      bold: "#CDD4DC",
      link: "#90C8E0",
    },
    prompt: {
      layout: "two-line-box",
      showUsername: false,
      fill: "═",
      timePrefix: "▪",
      successSymbol: "❯",
      vimSymbol: "❮",
    },
  },

  // ── 5. Canopy — deep forest ───────────────────────────────────────────────
  {
    name: "canopy",
    displayName: "Canopy",
    concept: "ancient forest floor looking up — layered canopy filtering green light into shadow",
    type: "dark",
    background: "#080E0A",
    foreground: "#D4E0C8",
    tokens: {
      primary: "#60C870",
      accent: "#C8A060",
      muted: "#709068",
      error: "#D06868",
    },
    ansi: [
      "#080E0A", // 0  black = background
      "#A05858", // 1  muted red berry
      "#4EA858", // 2  muted forest green
      "#A88840", // 3  muted amber
      "#406080", // 4  muted water-blue
      "#8058A0", // 5  muted forest-violet
      "#3A8878", // 6  muted deep teal
      "#909880", // 7  muted sage
      "#182018", // 8  bright-black = deep shadow
      "#D06868", // 9  bright red = error berry
      "#60C870", // 10 bright leaf green = primary
      "#B0D060", // 11 bright yellow-green
      "#709068", // 12 bright slot = muted moss
      "#A070B8", // 13 bright violet
      "#50A890", // 14 bright teal-green
      "#D4E0C8", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#C8A060",
      cursorText: "#080E0A",
      selection: "#101A12",
      selectionText: "#D4E0C8",
      bold: "#D4E0C8",
      link: "#70C898",
    },
    prompt: {
      layout: "two-line-box",
      showUsername: false,
      fill: "⋅",
      timePrefix: "❧",
      successSymbol: "❯",
      vimSymbol: "❮",
    },
  },

  // ── 6. Noir — film noir spotlight ────────────────────────────────────────
  {
    name: "noir",
    displayName: "Noir",
    concept: "a single incandescent bulb swinging in an empty room — everything else is shadow",
    type: "dark",
    background: "#0A0A0A",
    foreground: "#E8E0D0",
    tokens: {
      primary: "#E8D080",
      accent: "#E89048",
      muted: "#909090",
      error: "#D05050",
    },
    ansi: [
      "#0A0A0A", // 0  black = background
      "#A85050", // 1  muted red
      "#506848", // 2  muted olive-green
      "#A09050", // 3  muted tarnished gold
      "#484858", // 4  muted cool gray-blue
      "#786068", // 5  muted rose-gray
      "#487080", // 6  muted cyan-gray
      "#A09888", // 7  warm gray
      "#1A1A1A", // 8  bright-black = dim bg
      "#D05050", // 9  bright red = error
      "#609850", // 10 bright olive
      "#E8D080", // 11 bright slot = primary spotlight gold
      "#909090", // 12 bright slot = muted gray
      "#A07880", // 13 bright rose-gray
      "#5898A8", // 14 bright cool cyan
      "#E8E0D0", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#E89048",
      cursorText: "#0A0A0A",
      selection: "#181818",
      selectionText: "#E8E0D0",
      bold: "#F0E8D8",
      link: "#A8C0D0",
    },
    prompt: {
      layout: "single-line",
      showUsername: false,
      fill: "∶",
      timePrefix: "●",
      successSymbol: "›",
      vimSymbol: "‹",
    },
  },

  // ── 7. Rosewater — dark rose-mauve ────────────────────────────────────────
  {
    name: "rosewater",
    displayName: "Rosewater",
    concept: "petals steeping in cold water — rose oil rising to the surface at dusk",
    type: "dark",
    background: "#100A0F",
    foreground: "#F0E0E8",
    tokens: {
      primary: "#E880B8",
      accent: "#C8A0D8",
      muted: "#9A7890",
      error: "#E05A5A",
    },
    ansi: [
      "#100A0F", // 0  black = background
      "#C86070", // 1  muted rose-red
      "#5A9068", // 2  muted sage green
      "#C09068", // 3  muted rose-amber
      "#6858A0", // 4  muted violet-blue
      "#B06090", // 5  muted rose-magenta
      "#508098", // 6  muted teal
      "#B09898", // 7  dusty rose-gray
      "#2A1828", // 8  bright-black = deep rose-dark
      "#E05A5A", // 9  bright red = error
      "#70B880", // 10 bright green
      "#E880B8", // 11 bright slot = primary rose
      "#9A7890", // 12 bright slot = muted mauve
      "#D080C8", // 13 bright violet
      "#60A8C0", // 14 bright teal
      "#F0E0E8", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#C8A0D8",
      cursorText: "#100A0F",
      selection: "#201018",
      selectionText: "#F0E0E8",
      bold: "#F0E0E8",
      link: "#C0A0E8",
    },
    prompt: {
      layout: "two-line-box",
      showUsername: false,
      fill: "≈",
      timePrefix: "✿",
      successSymbol: "❯",
      vimSymbol: "❮",
    },
  },

  // ── 8. Cobalt — royal blue ────────────────────────────────────────────────
  {
    name: "cobalt",
    displayName: "Cobalt",
    concept: "deep-sea cobalt glass — light refracting through dense saturated blue",
    type: "dark",
    background: "#080C18",
    foreground: "#D8E0F0",
    tokens: {
      primary: "#5090F0",
      accent: "#70D8F0",
      muted: "#6878A8",
      error: "#D05860",
    },
    ansi: [
      "#080C18", // 0  black = background
      "#B05060", // 1  muted red
      "#3878A0", // 2  muted steel blue-green
      "#8098C8", // 3  muted periwinkle-gold
      "#4858C8", // 4  muted deep blue
      "#8068B0", // 5  muted blue-violet
      "#3898C0", // 6  muted cyan-blue
      "#8898C0", // 7  blue-gray
      "#182038", // 8  bright-black = deep navy
      "#D05860", // 9  bright red = error
      "#4898A8", // 10 bright teal-blue
      "#5090F0", // 11 bright slot = primary cobalt
      "#6878A8", // 12 bright slot = muted slate
      "#9080D0", // 13 bright violet-blue
      "#40B8D8", // 14 bright cyan
      "#D8E0F0", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#70D8F0",
      cursorText: "#080C18",
      selection: "#101828",
      selectionText: "#D8E0F0",
      bold: "#D8E0F0",
      link: "#80C0F0",
    },
    prompt: {
      layout: "two-line-box",
      showUsername: false,
      fill: "╍",
      timePrefix: "⊕",
      successSymbol: "❯",
      vimSymbol: "❮",
    },
  },

  // ── 9. Weld — olive gold-green ────────────────────────────────────────────
  {
    name: "weld",
    displayName: "Weld",
    concept: "molten metal oxidizing — yellow-green flame at the seam where steel fuses",
    type: "dark",
    background: "#0E0E08",
    foreground: "#E8E0C0",
    tokens: {
      primary: "#98B838",
      accent: "#E8B040",
      muted: "#909060",
      error: "#D06060",
    },
    ansi: [
      "#0E0E08", // 0  black = background
      "#A86050", // 1  muted rust
      "#7A9848", // 2  muted olive
      "#B09040", // 3  muted gold
      "#5A7870", // 4  muted sage-teal
      "#8870A0", // 5  muted purple
      "#4A8870", // 6  muted teal
      "#9A9870", // 7  warm sage gray
      "#202018", // 8  bright-black = warm dark
      "#D06060", // 9  bright red = error
      "#90C058", // 10 bright lime-green
      "#98B838", // 11 bright slot = primary olive
      "#909060", // 12 bright slot = muted olive-gray
      "#A888C0", // 13 bright purple
      "#60A880", // 14 bright teal-green
      "#E8E0C0", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#E8B040",
      cursorText: "#0E0E08",
      selection: "#1C1C10",
      selectionText: "#E8E0C0",
      bold: "#E8E0C0",
      link: "#78C890",
    },
    prompt: {
      layout: "two-line-box",
      showUsername: false,
      fill: "≡",
      timePrefix: "⬢",
      successSymbol: "❯",
      vimSymbol: "❮",
    },
  },

  // ── 10. Graphite — near-monochrome ────────────────────────────────────────
  {
    name: "graphite",
    displayName: "Graphite",
    concept: "graphite smeared across cold paper — almost no color, only pressure and light",
    type: "dark",
    background: "#0C0C0C",
    foreground: "#E0E0E0",
    tokens: {
      primary: "#B8C0C8",
      accent: "#D8C8A0",
      muted: "#808888",
      error: "#C86060",
    },
    ansi: [
      "#0C0C0C", // 0  black = background
      "#986868", // 1  muted grayish red
      "#508858", // 2  muted grayish green
      "#988870", // 3  muted grayish amber
      "#586878", // 4  muted grayish blue
      "#887888", // 5  muted gray-violet
      "#508088", // 6  muted gray-cyan
      "#A0A0A0", // 7  mid gray
      "#202020", // 8  bright-black = dim bg
      "#C86060", // 9  bright red = error — the only real color
      "#68A870", // 10 desaturated green
      "#B8C0C8", // 11 bright slot = primary cool silver
      "#808888", // 12 bright slot = muted cool gray
      "#9888A8", // 13 desaturated violet
      "#5898A0", // 14 desaturated cyan
      "#E0E0E0", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#D8C8A0",
      cursorText: "#0C0C0C",
      selection: "#1C1C1C",
      selectionText: "#E0E0E0",
      bold: "#E0E0E0",
      link: "#90A8C0",
    },
    prompt: {
      layout: "two-line-box",
      showUsername: false,
      fill: "⋯",
      timePrefix: "◑",
      successSymbol: "❯",
      vimSymbol: "❮",
    },
  },

  // ── 11. Bamboo — East Asian ink aesthetic ─────────────────────────────────
  {
    name: "bamboo",
    displayName: "Bamboo",
    concept: "gilded calligraphy on lacquered bamboo — gold ink over deep sumi black",
    type: "dark",
    background: "#090C08",
    foreground: "#E0DDD4",
    tokens: {
      primary: "#E8C880",
      accent: "#80B8A0",
      muted: "#888A90",
      error: "#C86868",
    },
    ansi: [
      "#090C08", // 0  black = background
      "#A85858", // 1  cinnabar red
      "#508060", // 2  bamboo green
      "#A89050", // 3  aged gold
      "#507090", // 4  ink-blue
      "#90607A", // 5  plum
      "#407880", // 6  river teal
      "#909888", // 7  sage-gray
      "#182018", // 8  bright-black = dim bg
      "#C86868", // 9  bright red = error vermilion
      "#68A870", // 10 jade green
      "#E8C880", // 11 bright slot = primary gold
      "#888A90", // 12 bright slot = muted ink-gray
      "#A878A8", // 13 wisteria
      "#5898A8", // 14 water blue
      "#E0DDD4", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#80B8A0",
      cursorText: "#090C08",
      selection: "#141A12",
      selectionText: "#E0DDD4",
      bold: "#E0DDD4",
      link: "#98D0B8",
    },
    prompt: {
      layout: "single-line",
      showUsername: false,
      fill: "┄",
      timePrefix: "⊛",
      successSymbol: "›",
      vimSymbol: "‹",
    },
  },

  // ── 12. Tallow — cozy hygge candlelight ───────────────────────────────────
  {
    name: "tallow",
    displayName: "Tallow",
    concept: "tallow candle burning low — amber light pooling soft on worn wooden surfaces",
    type: "dark",
    background: "#120E08",
    foreground: "#F0E8D8",
    tokens: {
      primary: "#E8C888",
      accent: "#D4905A",
      muted: "#9A8870",
      error: "#D86060",
    },
    ansi: [
      "#120E08", // 0  black = background
      "#B06050", // 1  muted warm red
      "#608050", // 2  muted sage green
      "#C09858", // 3  muted amber
      "#606870", // 4  muted cool gray-blue
      "#907868", // 5  muted warm brown-purple
      "#488078", // 6  muted teal
      "#B0A088", // 7  warm tan
      "#282018", // 8  bright-black = amber-dark
      "#D86060", // 9  bright red = ember
      "#70A860", // 10 bright sage
      "#E8C888", // 11 bright slot = primary honeyed amber
      "#9A8870", // 12 bright slot = muted oak
      "#B088A0", // 13 bright dusty rose
      "#5898A8", // 14 bright teal
      "#F0E8D8", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#D4905A",
      cursorText: "#120E08",
      selection: "#201808",
      selectionText: "#F0E8D8",
      bold: "#F0E8D8",
      link: "#C8A870",
    },
    prompt: {
      layout: "single-line",
      showUsername: false,
      fill: "⠿",
      timePrefix: "◐",
      successSymbol: "›",
      vimSymbol: "‹",
    },
  },

  // ── 13. Cast — brutalist concrete ────────────────────────────────────────
  {
    name: "cast",
    displayName: "Cast",
    concept: "raw poured concrete — no ornament, no apology, only weight and form",
    type: "dark",
    background: "#101010",
    foreground: "#C8C8C0",
    tokens: {
      primary: "#A0B0C0",
      accent: "#D8C040",
      muted: "#787870",
      error: "#C04040",
    },
    ansi: [
      "#101010", // 0  black = background
      "#A06060", // 1  muted red oxide
      "#508060", // 2  muted industrial green
      "#909050", // 3  muted yellow oxide
      "#506080", // 4  muted concrete blue
      "#786080", // 5  muted violet
      "#407880", // 6  muted cyan
      "#909088", // 7  concrete gray
      "#202020", // 8  bright-black = dim bg
      "#C04040", // 9  bright red = error
      "#68A068", // 10 industrial green
      "#A0B0C0", // 11 bright slot = primary concrete
      "#787870", // 12 bright slot = muted gray
      "#908090", // 13 dim violet
      "#50A0A8", // 14 dim cyan
      "#C8C8C0", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#D8C040",
      cursorText: "#101010",
      selection: "#1C1C1C",
      selectionText: "#C8C8C0",
      bold: "#C8C8C0",
      link: "#80A8C8",
    },
    prompt: {
      layout: "two-line-box",
      showUsername: false,
      fill: "∴",
      timePrefix: "∅",
      successSymbol: "❯",
      vimSymbol: "❮",
    },
  },

  // ── 14. Bloom — light rose-blush ─────────────────────────────────────────
  {
    name: "bloom",
    displayName: "Bloom",
    concept: "pale roses pressed between book pages — blush petals drying on cream paper",
    type: "light",
    background: "#FFF0F0",
    foreground: "#2A1420",
    tokens: {
      primary: "#7A1840",
      accent: "#5A2080",
      muted: "#7A5868",
      error: "#8A1020",
    },
    ansi: [
      "#1A0810", // 0  black (near-black rose)
      "#7A2020", // 1  muted red
      "#286020", // 2  muted green
      "#705A10", // 3  muted amber
      "#28287A", // 4  muted blue
      "#58285A", // 5  muted plum
      "#1A5058", // 6  muted teal
      "#D8B8C0", // 7  muted rose-white
      "#3A2030", // 8  bright-black = dark rose separator
      "#8A1020", // 9  bright red = error
      "#386028", // 10 bright green
      "#7A1840", // 11 bright slot = primary deep rose
      "#7A5868", // 12 bright slot = muted mauve
      "#703888", // 13 bright violet
      "#285878", // 14 bright blue-teal
      "#F8E8F0", // 15 bright white = near-white blush
    ],
    ui: {
      cursor: "#5A2080",
      cursorText: "#FFF0F0",
      selection: "#F0C8D0",
      selectionText: "#2A1420",
      bold: "#1A0810",
      link: "#28287A",
    },
    prompt: {
      layout: "single-line",
      showUsername: false,
      fill: "∵",
      timePrefix: "✽",
      successSymbol: "›",
      vimSymbol: "‹",
    },
  },

  // ── 15. Fern — light sage green ───────────────────────────────────────────
  {
    name: "fern",
    displayName: "Fern",
    concept: "morning light through fern fronds — soft green filtering warm sun",
    type: "light",
    background: "#EEF2EC",
    foreground: "#1A2E1A",
    tokens: {
      primary: "#1A4A2A",
      accent: "#604A10",
      muted: "#4A5E50",
      error: "#6A1818",
    },
    ansi: [
      "#0E1A0E", // 0  black (deep forest)
      "#6A2020", // 1  muted red
      "#2A5828", // 2  muted green
      "#684A10", // 3  muted amber
      "#284068", // 4  muted blue
      "#505270", // 5  muted violet
      "#1A5048", // 6  muted teal
      "#C8D4C0", // 7  muted sage-white
      "#30403A", // 8  bright-black = mossy dark
      "#6A1818", // 9  bright red = error
      "#3A6828", // 10 bright forest green
      "#1A4A2A", // 11 bright slot = primary forest
      "#4A5E50", // 12 bright slot = muted sage
      "#584878", // 13 bright violet
      "#287858", // 14 bright green-teal
      "#F0F4EE", // 15 bright white-green
    ],
    ui: {
      cursor: "#604A10",
      cursorText: "#EEF2EC",
      selection: "#D4DED0",
      selectionText: "#1A2E1A",
      bold: "#0E1A0E",
      link: "#284068",
    },
    prompt: {
      layout: "single-line",
      showUsername: false,
      fill: "≀",
      timePrefix: "❄",
      successSymbol: "›",
      vimSymbol: "‹",
    },
  },

  // ── 16. Stark — high-contrast accessibility ───────────────────────────────
  {
    name: "stark",
    displayName: "Stark",
    concept: "maximum clarity — pure contrast for those who need every pixel to count",
    type: "light",
    background: "#FFFFFF",
    foreground: "#000000",
    tokens: {
      primary: "#001A8C",
      accent: "#8C3000",
      muted: "#3A3A3A",
      error: "#8C0000",
    },
    ansi: [
      "#000000", // 0  pure black
      "#880000", // 1  pure red
      "#005500", // 2  pure green
      "#885500", // 3  olive
      "#000088", // 4  pure blue
      "#880088", // 5  pure magenta
      "#008888", // 6  pure cyan
      "#888888", // 7  medium gray
      "#444444", // 8  bright-black = dark gray
      "#8C0000", // 9  bright red = error
      "#007700", // 10 bright green
      "#001A8C", // 11 bright slot = primary navy
      "#3A3A3A", // 12 bright slot = muted dark gray
      "#9900AA", // 13 bright magenta
      "#0077AA", // 14 bright cyan-blue
      "#FFFFFF", // 15 bright white = fg
    ],
    ui: {
      cursor: "#8C3000",
      cursorText: "#FFFFFF",
      selection: "#E0E0E0",
      selectionText: "#000000",
      bold: "#000000",
      link: "#000088",
    },
    prompt: {
      layout: "two-line-box",
      showUsername: false,
      fill: "┅",
      timePrefix: "⊞",
      successSymbol: "❯",
      vimSymbol: "❮",
    },
  },

  // ── 17. Dusk — mid-tone twilight ─────────────────────────────────────────
  {
    name: "dusk",
    displayName: "Dusk",
    concept:
      "civil twilight — the exact moment the sky becomes indeterminate between day and night",
    type: "dark",
    background: "#282834",
    foreground: "#C8C4BC",
    tokens: {
      primary: "#90C0E0",
      accent: "#E8A860",
      muted: "#808898",
      error: "#D06060",
    },
    ansi: [
      "#282834", // 0  black = background (mid-tone)
      "#A87070", // 1  muted red
      "#608870", // 2  muted green
      "#A89868", // 3  muted amber
      "#6880A8", // 4  muted blue
      "#9068A0", // 5  muted violet
      "#488898", // 6  muted teal
      "#A0A0A0", // 7  neutral mid-gray
      "#3A3A48", // 8  bright-black = dim bg
      "#D06060", // 9  bright red = error
      "#70B878", // 10 bright green
      "#90C0E0", // 11 bright slot = primary sky-blue
      "#808898", // 12 bright slot = muted blue-gray
      "#A880C0", // 13 bright violet
      "#60A8C0", // 14 bright teal-blue
      "#C8C4BC", // 15 bright white = foreground
    ],
    ui: {
      cursor: "#E8A860",
      cursorText: "#282834",
      selection: "#363648",
      selectionText: "#C8C4BC",
      bold: "#C8C4BC",
      link: "#80B8E0",
    },
    prompt: {
      layout: "two-line-box",
      showUsername: false,
      fill: "⋰",
      timePrefix: "◓",
      successSymbol: "❯",
      vimSymbol: "❮",
    },
  },
];

// ── Scaffold ──────────────────────────────────────────────────────────────────

let created = 0;
let skipped = 0;
let warnings = 0;

for (const t of themes) {
  const themeDir = join(THEMES_DIR, t.name);

  if (existsSync(themeDir)) {
    console.log(`  skip  ${t.name} (directory already exists)`);
    skipped++;
    continue;
  }

  // WCAG pre-check
  const checks = [
    ["primary", t.tokens.primary],
    ["accent", t.tokens.accent],
    ["muted", t.tokens.muted],
    ["error", t.tokens.error],
  ];
  let themeWarnings = false;
  for (const [token, hex] of checks) {
    const r = contrast(hex, t.background);
    if (r < 4.5) {
      console.warn(`  WARN  ${t.name}: tokens.${token} ${hex} = ${r.toFixed(2)}:1 — fails WCAG AA`);
      themeWarnings = true;
      warnings++;
    }
  }

  // Build the full JSON (schema-compliant, no extra fields)
  const json = {
    name: t.name,
    displayName: t.displayName,
    type: t.type,
    background: t.background,
    foreground: t.foreground,
    tokens: t.tokens,
    ansi: t.ansi,
    ui: t.ui,
    prompt: t.prompt,
  };

  mkdirSync(themeDir, { recursive: true });
  writeFileSync(join(themeDir, `${t.name}.json`), JSON.stringify(json, null, 2) + "\n", "utf8");
  writeFileSync(join(themeDir, `${t.name}.md`), buildThemeMd(t), "utf8");

  const warn = themeWarnings ? " ⚠" : "";
  console.log(`  ✓     ${t.name}${warn}`);
  created++;
}

console.log(
  `\n${created} created, ${skipped} skipped${warnings ? `, ${warnings} WCAG warning(s)` : ""}`,
);
console.log("\nNext: npm run generate && npm test");
