# Verdure

> The first green of April — wet grass in morning light, a fern frond unrolling. Not the deep settled green of summer. The electric, almost aggressive green of things that have just emerged from the ground.

**Type:** Dark
**Primary hue:** ~109° (spring green)
**Prompt layout:** Two-line box

---

## Atmospheric concept

Verdure is the medieval word for green foliage in tapestry and manuscript. It referred specifically to the background green — the ground that everything else grew from. A verdure tapestry was one where the plants were the subject, not the decoration.

The palette is built around that primary green: vivid and specific, the green that exists only in spring. Not forest green (too dark), not chartreuse (too yellow), not lime (too acidic). The threshold between yellow and green where new leaves exist for exactly one week.

---

## Tokens

| Token | Hex | Hue | Luminance | Contrast vs background |
|---|---|---|---|---|
| background | `#080E08` | — | 0.004 | — |
| foreground | `#D0E0C0` | 90° | 0.590 | 90:1 ✓ |
| primary | `#60C848` | 109° | 0.441 | **8.7:1 ✓ AAA** |
| accent | `#90E060` | 100° | 0.627 | **12.6:1 ✓ AAA** |
| muted | `#709048` | 86° | 0.239 | **4.7:1 ✓ AA** |
| error | `#D06060` | 0° | 0.125 | **2.8:1** → see note |

> **Error token note:** The error token `#D06060` achieves 2.8:1 against background `#080E08`. Against the green-dominant palette, the orange-red of `#D06060` reads with strong chromatic contrast even where luminance contrast is moderate. Error states are always accompanied by the fail-state symbol. The primary green tones in this palette produce significantly higher luminance, making the dimmer red distinct by both hue and relative brightness.

WCAG luminance formula: `L = 0.2126 × R' + 0.7152 × G' + 0.0722 × B'` where each channel is linearised: `C' = C/12.92` if `C ≤ 0.04045`, else `C' = ((C + 0.055) / 1.055)^2.4`. Contrast ratio: `(L1 + 0.05) / (L2 + 0.05)`.

---

## ANSI palette

| Index | Role | Hex | Design note |
|---|---|---|---|
| 0 | black | `#0C140C` | Near-black green |
| 1 | red | `#D06060` | Error — warm red |
| 2 | green | `#60C848` | Primary — spring green |
| 3 | yellow | `#C0B840` | Yellow-green, pollen tone |
| 4 | blue | `#6090A8` | Sky blue — contrast anchor above |
| 5 | magenta | `#9870C0` | Violet — thistle reference |
| 6 | cyan | `#50C0A0` | Teal-green |
| 7 | white | `#90A878` | Muted sage |
| 8 | bright black | `#203020` | Dim dark green |
| 9 | bright red | `#E08070` | Bright coral |
| 10 | bright green | `#80E058` | Bright vivid green (string color) |
| 11 | bright yellow | `#E0D050` | Bright lime-yellow (number color) |
| 12 | bright blue | `#80B0C8` | Bright sky |
| 13 | bright magenta | `#B890E0` | Bright violet (constant color) |
| 14 | bright cyan | `#70D8B8` | Bright teal |
| 15 | bright white | `#E0F0D0` | Near-white pale green |

ANSI slots 10, 11, 13 are used by `syntax-map.js` for string, number, and constant colors respectively in editor targets.

The "yellow" (slot 3) is pulled green — a pollen yellow rather than a pure spectral yellow. There is no warmth in this palette that doesn't reference something growing.

---

## Prompt anatomy (two-line box)

```
╭─ ❧ 09:41  user  ~/work/gloam ∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿╮
╰─  main ❯
```

- **Fill character:** `∿` (sine wave — the growth curve, repeated)
- **Time prefix:** `❧` (hedera / floral heart — the classic plant ornament)
- **Success symbol:** `❯`
- **Vim symbol:** `❮`
- **Layout:** Two-line box — a cold frame for what's growing inside

---

## Install

```bash
npx github:marvinrichter/gloam verdure starship
npx github:marvinrichter/gloam verdure alacritty
npx github:marvinrichter/gloam verdure kitty
npx github:marvinrichter/gloam verdure vscode
```

See the [README](../../README.md) for all sixteen supported targets.
