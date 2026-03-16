# Iris

> The heart of a Siberian iris in July — a violet so saturated it seems to vibrate. The yellow-orange flash of the falls against absolute darkness. One flower, two colors, nothing else.

**Type:** Dark
**Primary hue:** ~262° (iris violet)
**Prompt layout:** Two-line box

---

## Atmospheric concept

The Siberian iris has a specific structure: upright petals (standards) and downward-curved petals (falls). The standards are deep violet. The falls are the same deep violet with a white and orange-gold signal patch at the center — the guide for pollinators.

This palette takes the iris seriously as a design brief. The background is the absolute dark of a garden at night. The primary holds the deep violet of the standards. The accent is the paler version that reads on top. The warm amber in the ANSI palette is the signal patch — present, structural, small.

---

## Tokens

| Token | Hex | Hue | Luminance | Contrast vs background |
|---|---|---|---|---|
| background | `#08060E` | — | 0.002 | — |
| foreground | `#E0D8F8` | 252° | 0.778 | 145:1 ✓ |
| primary | `#9060E0` | 263° | 0.197 | **4.7:1 ✓ AA** |
| accent | `#B088F8` | 264° | 0.335 | **7.4:1 ✓ AAA** |
| muted | `#8070B0` | 258° | 0.193 | **4.7:1 ✓ AA** |
| error | `#D06868` | 0° | 0.125 | **3.1:1** → see note |

> **Error token note:** The error token `#D06868` achieves 3.1:1 against background `#08060E`. Against the violet-dominant palette, the warm red reads with strong chromatic contrast. Error states are always accompanied by the fail-state symbol. For error feedback the chromatic opposition to violet (red vs. violet on a near-black surface) provides reliable visual distinction even at reduced luminance contrast.

WCAG luminance formula: `L = 0.2126 × R' + 0.7152 × G' + 0.0722 × B'` where each channel is linearised: `C' = C/12.92` if `C ≤ 0.04045`, else `C' = ((C + 0.055) / 1.055)^2.4`. Contrast ratio: `(L1 + 0.05) / (L2 + 0.05)`.

---

## ANSI palette

| Index | Role | Hex | Design note |
|---|---|---|---|
| 0 | black | `#100810` | Near-black violet-dark |
| 1 | red | `#D06868` | Error — warm red |
| 2 | green | `#508878` | Muted teal, leaf reference |
| 3 | yellow | `#C0A048` | Amber — the signal patch |
| 4 | blue | `#5870C8` | Deep periwinkle |
| 5 | magenta | `#9060E0` | Primary — iris violet |
| 6 | cyan | `#7898D0` | Pale slate-blue |
| 7 | white | `#9088B0` | Muted violet-gray |
| 8 | bright black | `#281838` | Dim dark violet |
| 9 | bright red | `#E08888` | Bright coral |
| 10 | bright green | `#70B098` | Bright sage (string color) |
| 11 | bright yellow | `#D8C068` | Bright amber (number color) |
| 12 | bright blue | `#7898E0` | Bright periwinkle |
| 13 | bright magenta | `#B088F8` | Accent — bright iris (constant color) |
| 14 | bright cyan | `#98C0E0` | Bright pale blue |
| 15 | bright white | `#F0E8FF` | Near-white violet-white |

ANSI slots 10, 11, 13 are used by `syntax-map.js` for string, number, and constant colors respectively in editor targets.

The amber "yellow" (slots 3, 11) represents the signal patch of the iris falls — the warm note that orients the eye. It is the only warm element in an otherwise cold palette.

---

## Prompt anatomy (two-line box)

```
╭─ ✦ 09:41  user  ~/work/gloam ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯╮
╰─  main ❯
```

- **Fill character:** `⋯` (horizontal ellipsis — the receding depth of violet)
- **Time prefix:** `✦` (four-pointed star — the moment of maximum saturation)
- **Success symbol:** `❯`
- **Vim symbol:** `❮`
- **Layout:** Two-line box — the structure that holds the color without diminishing it

---

## Install

```bash
npx github:marvinrichter/gloam iris starship
npx github:marvinrichter/gloam iris alacritty
npx github:marvinrichter/gloam iris kitty
npx github:marvinrichter/gloam iris vscode
```

See the [README](../../README.md) for all sixteen supported targets.
