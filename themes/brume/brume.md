# Brume

> The seafront before the fog burns off — everything reduced to values, the world compressed to a few shades of gray-blue. The boundary between sea and sky erased.

**Type:** Light
**Primary hue:** ~186° (sea-teal)
**Prompt layout:** Single-line

---

## Atmospheric concept

Brume is the French word for mist — specifically the coastal mist that sits low over harbours in the early morning. No colour survives it. The palette is built around this reduction: a pale gray-blue ground, deep teal-green ink that reads as almost-black. The warmth is gone. Only the fog remains.

The light is diffuse and directionless. There are no shadows. The pier, the water, the sky — all the same soft nothing.

---

## Tokens

| Token | Hex | Hue | Luminance | Contrast vs background |
|---|---|---|---|---|
| background | `#EEF2F0` | — | 0.877 | — |
| foreground | `#1C3030` | 180° | 0.027 | 21.3:1 ✓ |
| primary | `#1A6068` | 186° | 0.097 | **6.3:1 ✓ AAA** |
| accent | `#1A7880` | 185° | 0.153 | **4.6:1 ✓ AA** |
| muted | `#486878` | 205° | 0.127 | **5.3:1 ✓ AAA** |
| error | `#8A1A28` | 352° | 0.067 | **7.9:1 ✓ AAA** |

WCAG luminance formula: `L = 0.2126 × R' + 0.7152 × G' + 0.0722 × B'` where each channel is linearised: `C' = C/12.92` if `C ≤ 0.04045`, else `C' = ((C + 0.055) / 1.055)^2.4`. Contrast ratio: `(L1 + 0.05) / (L2 + 0.05)`.

---

## ANSI palette

| Index | Role | Hex | Design note |
|---|---|---|---|
| 0 | black | `#EEF2F0` | Background — fog ground |
| 1 | red | `#8A1A28` | Error — deep crimson |
| 2 | green | `#1A5038` | Dark forest teal |
| 3 | yellow | `#705810` | Dark amber, reference note |
| 4 | blue | `#1A6068` | Primary — sea-teal |
| 5 | magenta | `#482870` | Muted purple, shadow depth |
| 6 | cyan | `#1A7880` | Accent — deeper teal |
| 7 | white | `#486878` | Muted — slate |
| 8 | bright black | `#B8C8C8` | Fog mid-tone |
| 9 | bright red | `#C04048` | Warm coral error |
| 10 | bright green | `#207850` | Bright sea-green (string color) |
| 11 | bright yellow | `#906800` | Dark amber (number color) |
| 12 | bright blue | `#2068A8` | Bright cerulean |
| 13 | bright magenta | `#603890` | Bright violet (constant color) |
| 14 | bright cyan | `#2090A0` | Bright sea-teal |
| 15 | bright white | `#1C3030` | Foreground — deep teal-gray |

ANSI slots 10, 11, 13 are used by `syntax-map.js` for string, number, and constant colors respectively in editor targets.

---

## Prompt anatomy (single-line)

```
◌ 09:41  ~/work/gloam  main ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ ›
```

- **Fill character:** `≈` (wave-form, evokes water and mist)
- **Time prefix:** `◌` (open circle, minimal — the fog contains nothing)
- **Success symbol:** `›`
- **Vim symbol:** `‹`
- **Layout:** Single-line — the fog presses everything flat

---

## Install

```bash
npx github:marvinrichter/gloam brume starship
npx github:marvinrichter/gloam brume alacritty
npx github:marvinrichter/gloam brume kitty
npx github:marvinrichter/gloam brume vscode
```

See the [README](../../README.md) for all sixteen supported targets.
