# Wisteria

> Wisteria draped over a pergola in May — the pale lavender, the warm light through papery petals. The exact purple between violet and pink that exists for three weeks and then darkens.

**Type:** Light
**Primary hue:** ~256° (deep violet)
**Prompt layout:** Single-line

---

## Atmospheric concept

Wisteria is the purple that doesn't resolve. Not blue-violet, not red-violet — the precise middle hue that looks different in morning light than in noon. A pale lavender ground, primary in deep iris-violet, accent in plum.

The theme is built for reading: high contrast, low saturation, nothing competing for attention. The purple is present but not aggressive. It recedes the moment you stop looking at it.

---

## Tokens

| Token | Hex | Hue | Luminance | Contrast vs background |
|---|---|---|---|---|
| background | `#F4F0F8` | — | 0.896 | — |
| foreground | `#2A1A40` | 262° | 0.019 | 27.1:1 ✓ |
| primary | `#4828A0` | 256° | 0.044 | **13.0:1 ✓ AAA** |
| accent | `#782870` | 302° | 0.040 | **14.0:1 ✓ AAA** |
| muted | `#4A3868` | 258° | 0.033 | **18.1:1 ✓ AAA** |
| error | `#882020` | 0° | 0.064 | **8.4:1 ✓ AAA** |

WCAG luminance formula: `L = 0.2126 × R' + 0.7152 × G' + 0.0722 × B'` where each channel is linearised: `C' = C/12.92` if `C ≤ 0.04045`, else `C' = ((C + 0.055) / 1.055)^2.4`. Contrast ratio: `(L1 + 0.05) / (L2 + 0.05)`.

---

## ANSI palette

| Index | Role | Hex | Design note |
|---|---|---|---|
| 0 | black | `#F4F0F8` | Background — pale lavender |
| 1 | red | `#882020` | Error — deep crimson |
| 2 | green | `#1A5028` | Forest green, neutral contrast |
| 3 | yellow | `#705010` | Dark amber, warm reference |
| 4 | blue | `#2A3888` | Deep indigo-blue |
| 5 | magenta | `#4828A0` | Primary — iris violet |
| 6 | cyan | `#286080` | Slate-teal |
| 7 | white | `#4A3868` | Muted — dark purple-gray |
| 8 | bright black | `#C8B8D8` | Pale lavender mid-tone |
| 9 | bright red | `#C04848` | Warm red |
| 10 | bright green | `#287840` | Bright forest green (string color) |
| 11 | bright yellow | `#906820` | Amber (number color) |
| 12 | bright blue | `#3850B8` | Bright blue |
| 13 | bright magenta | `#6838C0` | Bright violet (constant color) |
| 14 | bright cyan | `#30809A` | Bright teal |
| 15 | bright white | `#2A1A40` | Foreground — deep violet-navy |

ANSI slots 10, 11, 13 are used by `syntax-map.js` for string, number, and constant colors respectively in editor targets.

---

## Prompt anatomy (single-line)

```
✿ 09:41  ~/work/gloam  main ············· ›
```

- **Fill character:** `·` (low middle dot — quiet, unobtrusive)
- **Time prefix:** `✿` (flower — the wisteria bloom in character form)
- **Success symbol:** `›`
- **Vim symbol:** `‹`
- **Layout:** Single-line — no ornamentation, just the information

---

## Install

```bash
npx github:marvinrichter/gloam wisteria starship
npx github:marvinrichter/gloam wisteria alacritty
npx github:marvinrichter/gloam wisteria kitty
npx github:marvinrichter/gloam wisteria vscode
```

See the [README](../../README.md) for all sixteen supported targets.
