# Madder

> The dye vat at a medieval cloth workshop — the deep crimson of *Rubia tinctorum* in water, bolts of undyed linen darkening in the bath. The oldest red. Iron gall. Mordant. The smell of alum.

**Type:** Dark
**Primary hue:** ~348° (garnet crimson)
**Prompt layout:** Two-line box

---

## Atmospheric concept

Madder root — *Rubia tinctorum* — was the primary source of red dye in Europe for two thousand years. The color it produces is not the bright vermilion of later synthetic dyes; it is a deeper, cooler red with violet in it. A garnet, not a ruby. A crushed dye that the fabric absorbs.

The background is the color of the workshop at night — not black, but the deep warm-red dark of a space saturated with dye. The primary holds the garnet crimson. The accent is the brighter rose that appears when madder is over-mordanted.

---

## Tokens

| Token | Hex | Hue | Luminance | Contrast vs background |
|---|---|---|---|---|
| background | `#0E0608` | — | 0.003 | — |
| foreground | `#F0E0E8` | 337° | 0.778 | 147:1 ✓ |
| primary | `#E04060` | 348° | 0.202 | **4.8:1 ✓ AA** |
| accent | `#F07898` | 347° | 0.342 | **7.4:1 ✓ AAA** |
| muted | `#B08098` | 337° | 0.269 | **6.0:1 ✓ AAA** |
| error | `#E04848` | 0° | 0.197 | **4.7:1 ✓ AA** |

WCAG luminance formula: `L = 0.2126 × R' + 0.7152 × G' + 0.0722 × B'` where each channel is linearised: `C' = C/12.92` if `C ≤ 0.04045`, else `C' = ((C + 0.055) / 1.055)^2.4`. Contrast ratio: `(L1 + 0.05) / (L2 + 0.05)`.

---

## ANSI palette

| Index | Role | Hex | Design note |
|---|---|---|---|
| 0 | black | `#180810` | Near-black dye-dark |
| 1 | red | `#E04848` | Error — warm red |
| 2 | green | `#508058` | Muted sage — mordant green |
| 3 | yellow | `#C09868` | Warm amber — alum reference |
| 4 | blue | `#6868B0` | Cool slate-blue, contrast anchor |
| 5 | magenta | `#E04060` | Primary — garnet crimson |
| 6 | cyan | `#809080` | Muted gray-green |
| 7 | white | `#C08898` | Dusty pink — faded cloth |
| 8 | bright black | `#38182A` | Dim dark red |
| 9 | bright red | `#F06878` | Bright coral |
| 10 | bright green | `#70A878` | Bright sage (string color) |
| 11 | bright yellow | `#D8B888` | Bright tan-gold (number color) |
| 12 | bright blue | `#8898C8` | Bright periwinkle |
| 13 | bright magenta | `#F090C0` | Bright madder-rose (constant color) |
| 14 | bright cyan | `#90A888` | Bright muted sage |
| 15 | bright white | `#F8E8F0` | Near-white rose |

ANSI slots 10, 11, 13 are used by `syntax-map.js` for string, number, and constant colors respectively in editor targets.

The green slots (2, 10) are deliberately muted and sage-toned — they represent the woad and plant-based auxiliaries in the dyehouse, not the natural greens of the field.

---

## Prompt anatomy (two-line box)

```
╭─ ✶ 09:41  user  ~/work/gloam ─╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╼╮
╰─  main ❯
```

- **Fill character:** `╼` (half-weight horizontal — like the stroke of a ruling tool)
- **Time prefix:** `✶` (six-pointed star — the mordant crystal)
- **Success symbol:** `❯`
- **Vim symbol:** `❮`
- **Layout:** Two-line box — the frame of the workshop bench

---

## Install

```bash
npx github:marvinrichter/gloam madder starship
npx github:marvinrichter/gloam madder alacritty
npx github:marvinrichter/gloam madder kitty
npx github:marvinrichter/gloam madder vscode
```

See the [README](../../README.md) for all sixteen supported targets.
