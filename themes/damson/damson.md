# Damson

> The small oval plum that stains your fingers before you can put it down. *Prunus institia* — not quite blue, not quite red, a color that exists between other colors without resolving into either. The skin and the jam and the depth of the jar.

**Type:** Dark
**Primary hue:** ~308° (violet-magenta)
**Prompt layout:** Two-line box

---

## Atmospheric concept

Damson is a specific color as well as a fruit — one of those English names that compresses a sensory memory into a single word. The damson plum is too sharp to eat raw. It is made into jam, into gin, into sloe-adjacent things. The color is what you get when violet refuses to become red and red refuses to become violet: a dense, saturated blue-magenta.

This palette takes the damson seriously. The background is a near-black with the faintest violet cast — the shadow in the jar, not the plum itself. The primary is the skin color at peak ripeness. The accent is the moment just before, brighter, cooler. The muted token is the haze of bloom on the fruit — the powdery grey-violet coating that comes off on your thumb.

---

## Tokens

| Token | Hex | Hue | Luminance | Contrast vs background |
|---|---|---|---|---|
| background | `#090610` | — | 0.002 | — |
| foreground | `#E8D8F8` | 268° | 0.801 | 152:1 ✓ |
| primary | `#D428BC` | 308° | 0.191 | **4.6:1 ✓ AA** |
| accent | `#FF60D8` | 315° | 0.346 | **7.6:1 ✓ AAA** |
| muted | `#887898` | 279° | 0.209 | **5.0:1 ✓ AA** |
| error | `#C86060` | 0° | 0.214 | **5.1:1 ✓ AA** |

WCAG luminance formula: `L = 0.2126 × R' + 0.7152 × G' + 0.0722 × B'` where each channel is linearised: `C' = C/12.92` if `C ≤ 0.04045`, else `C' = ((C + 0.055) / 1.055)^2.4`. Contrast ratio: `(L1 + 0.05) / (L2 + 0.05)`.

Luminance calculations (background `#090610`, L = 0.0022):

- **primary `#D428BC`:** R=0.831→R'=0.658, G=0.157→G'=0.021, B=0.737→B'=0.502 → L=0.191 → ratio (0.241)/(0.052)=**4.6:1**
- **accent `#FF60D8`:** R=1.000→R'=1.000, G=0.376→G'=0.117, B=0.847→B'=0.687 → L=0.346 → ratio (0.396)/(0.052)=**7.6:1**
- **muted `#887898`:** R=0.533→R'=0.245, G=0.471→G'=0.188, B=0.596→B'=0.314 → L=0.209 → ratio (0.259)/(0.052)=**5.0:1**
- **error `#C86060`:** R=0.784→R'=0.576, G=0.376→G'=0.117, B=0.376→B'=0.117 → L=0.214 → ratio (0.264)/(0.052)=**5.1:1**

---

## ANSI palette

| Index | Role | Hex | Design note |
|---|---|---|---|
| 0 | black | `#130B18` | Near-black, violet undertone |
| 1 | red | `#601828` | Dark crimson |
| 2 | green | `#285030` | Dark forest green |
| 3 | yellow | `#604018` | Dark amber |
| 4 | blue | `#202860` | Dark indigo |
| 5 | magenta | `#602060` | Dark violet — shadow of primary |
| 6 | cyan | `#204848` | Dark teal |
| 7 | white | `#A898B8` | Muted lavender-grey |
| 8 | bright black | `#382848` | Raised dark violet |
| 9 | bright red | `#E06070` | Bright coral |
| 10 | bright green | `#68C880` | Bright sage (string color) |
| 11 | bright yellow | `#C8A050` | Bright amber (number color) |
| 12 | bright blue | `#6878D0` | Bright periwinkle |
| 13 | bright magenta | `#C840B0` | Bright violet — constant color |
| 14 | bright cyan | `#70B8D8` | Bright sky |
| 15 | bright white | `#F0E8FF` | Near-white lavender |

ANSI slots 10, 11, 13 are used by `syntax-map.js` for string, number, and constant colors respectively in editor targets.

The amber in slots 3 and 11 is the only warm color in the palette — the memory of the plum's golden flesh beneath the dark skin. It exists to prevent the palette from collapsing entirely into its own hue.

---

## Prompt anatomy (two-line box)

```
╭─ ✦ 09:41  ~/work/gloam ∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙╮
╰─  main ❯
```

- **Fill character:** `∙` (middle dot — the bloom on the skin)
- **Time prefix:** `✦` (four-pointed star — precise moment, not approximate)
- **Success symbol:** `❯`
- **Vim symbol:** `❮`
- **Layout:** Two-line box — the structure that holds the color without diminishing it

---

## Install

```bash
npx github:marvinrichter/gloam damson starship
npx github:marvinrichter/gloam damson alacritty
npx github:marvinrichter/gloam damson kitty
npx github:marvinrichter/gloam damson vscode
```

See the [README](../../README.md) for all sixteen supported targets.
