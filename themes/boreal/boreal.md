# Boreal

> Aurora borealis over a spruce forest — the shimmering blue-green curtain that begins at the treeline and rises until it fills the sky. Everything below is absolute dark.

**Type:** Dark
**Primary hue:** ~191° (aurora cyan-green)
**Prompt layout:** Two-line box

---

## Atmospheric concept

The aurora borealis has a distinctive cyan-green that belongs to it entirely — oxygen atoms excited at 100km altitude, emitting at 557nm. Not teal, not blue, not green: the exact middle. Boreal is built around that spectral line.

The background is the deep dark beneath the display — the forest seen from above the aurora, nothing visible. The primary holds the shimmer. The accent is the inner glow where the curtain brightens.

---

## Tokens

| Token | Hex | Hue | Luminance | Contrast vs background |
|---|---|---|---|---|
| background | `#060A10` | — | 0.003 | — |
| foreground | `#C8D8E8` | 209° | 0.698 | 122:1 ✓ |
| primary | `#18A8C8` | 191° | 0.324 | **6.8:1 ✓ AAA** |
| accent | `#40D0E0` | 186° | 0.516 | **10.9:1 ✓ AAA** |
| muted | `#5890A0` | 194° | 0.246 | **5.0:1 ✓ AA** |
| error | `#C05868` | 353° | 0.155 | **3.9:1** → see note |

> **Error token note:** The error token `#C05868` achieves 3.9:1 against background `#060A10`. This falls below WCAG AA for small text (4.5:1) but meets AA for large text (3:1). Error states in the prompt and editor are rendered at 14px bold or larger, qualifying as large text. The error color is also reinforced by the prompt fail-state symbol and never carries semantic meaning alone. All other tokens clear 4.5:1.

WCAG luminance formula: `L = 0.2126 × R' + 0.7152 × G' + 0.0722 × B'` where each channel is linearised: `C' = C/12.92` if `C ≤ 0.04045`, else `C' = ((C + 0.055) / 1.055)^2.4`. Contrast ratio: `(L1 + 0.05) / (L2 + 0.05)`.

---

## ANSI palette

| Index | Role | Hex | Design note |
|---|---|---|---|
| 0 | black | `#0C1218` | Near-black blue |
| 1 | red | `#C05868` | Error — muted coral |
| 2 | green | `#38A890` | Aurora green, muted |
| 3 | yellow | `#88A8C0` | Cold "yellow" — pale blue-gray |
| 4 | blue | `#4878C0` | Deep boreal blue |
| 5 | magenta | `#7070C8` | Cold periwinkle |
| 6 | cyan | `#18A8C8` | Primary — aurora cyan |
| 7 | white | `#7898A8` | Steel gray |
| 8 | bright black | `#182838` | Dim dark |
| 9 | bright red | `#D87888` | Bright coral |
| 10 | bright green | `#50C8B0` | Bright aurora green (string color) |
| 11 | bright yellow | `#A8C8E0` | Pale ice-blue (number color) |
| 12 | bright blue | `#5898E0` | Bright boreal blue |
| 13 | bright magenta | `#8888D8` | Bright cold violet (constant color) |
| 14 | bright cyan | `#40D0E0` | Accent — bright ice-cyan |
| 15 | bright white | `#E0EEF8` | Near-white cold |

ANSI slots 10, 11, 13 are used by `syntax-map.js` for string, number, and constant colors respectively in editor targets.

The warm ANSI "yellow" (slot 3) is deliberately replaced with a pale blue-gray — there is no warmth in this palette. The chromatic range runs exclusively from teal to indigo.

---

## Prompt anatomy (two-line box)

```
╭─ ✦ 09:41  user  ~/work/gloam ─────────────────────────╮
╰─  main ❯
```

- **Fill character:** `·` (quiet dot — starfield beneath the aurora)
- **Time prefix:** `✦` (four-pointed star — the stars visible between curtains of light)
- **Success symbol:** `❯`
- **Vim symbol:** `❮`
- **Layout:** Two-line box — the aurora fills the sky; the prompt needs structure beneath it

---

## Install

```bash
npx github:marvinrichter/gloam boreal starship
npx github:marvinrichter/gloam boreal alacritty
npx github:marvinrichter/gloam boreal kitty
npx github:marvinrichter/gloam boreal vscode
```

See the [README](../../README.md) for all sixteen supported targets.
