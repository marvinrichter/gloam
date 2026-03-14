# Gloam — Brand Guidelines

> **Gloam** /ɡloʊm/ — archaic English for twilight; the atmospheric threshold between day and night.

Every theme in Gloam captures a specific moment or material quality: the watch fire at 3am, a Norwegian fjord at dusk, aged manuscript vellum. The brand names the act of capturing those moments — still, precise, poetic.

---

## 1. Name & Wordmark

**Name:** Gloam
**Tagline:** *Twelve atmospheres. Each one complete.*

### Wordmark

Set in **Fraunces** (optical variable axis, `opsz` 144, `wght` 300). Lowercase only. No icon required at small sizes — the wordmark is the logo.

```
gloam
```

Letter-spacing: `−0.02em`. The optical serif at large sizes gives the word weight without loudness.

**Logo variants:**
- **Wordmark** — `gloam` in Fraunces Light, primary-500 on dark, primary-700 on light
- **Mark** — a thin horizontal rule (`─────`) below the wordmark in muted amber, recalling the fill character used across themes
- **Favicon** — `g` in Fraunces at `opsz` 144, on neutral-950 background

### Prohibited uses
1. Do not set the wordmark in all-caps
2. Do not set in any typeface other than Fraunces
3. Do not add a drop shadow or glow effect
4. Do not place on a busy or textured background without an overlay
5. Do not use primary-500 amber on a white background for the wordmark (contrast fails — use primary-700)

---

## 2. Color

### Design principle

The palette is built around dusk amber — the last warm light before the sky goes cold. It sits in tension with the cool neutral scale without resolving it. One warm note in a dark field.

### Primary — Dusk Amber

```css
:root {
  --color-primary-50:  hsl(30, 42%, 96%);   /* #FAF3EC */
  --color-primary-100: hsl(30, 40%, 92%);   /* #F5EAE0 */
  --color-primary-200: hsl(29, 44%, 82%);   /* #EAD0B8 */
  --color-primary-300: hsl(30, 44%, 68%);   /* #D9B088 */
  --color-primary-400: hsl(30, 48%, 60%);   /* #D09A68 */
  --color-primary-500: hsl(30, 50%, 53%);   /* #C4894A — brand color */
  --color-primary-600: hsl(29, 52%, 44%);   /* #A97038 */
  --color-primary-700: hsl(28, 54%, 35%);   /* #8B5A28 — text on light bg */
  --color-primary-800: hsl(27, 56%, 24%);   /* #5E3A18 */
  --color-primary-900: hsl(26, 58%, 16%);   /* #3E250F */
  --color-primary-950: hsl(25, 60%,  9%);   /* #231407 */
}
```

**Contrast summary:**

| Token | On neutral-950 | On white |
|---|---|---|
| primary-300 | 11.2:1 ✓ AAA | 2.1:1 ✗ |
| primary-400 | 8.4:1 ✓ AAA | 2.6:1 ✗ |
| primary-500 | 6.1:1 ✓ AA | 3.2:1 ✗ |
| primary-600 | 4.9:1 ✓ AA | 4.1:1 ✗ |
| primary-700 | — | 7.2:1 ✓ AAA |

**Rule:** Use primary-500 on dark backgrounds. Use primary-700 on light backgrounds. Never use primary-300 through primary-500 as text on light.

### Neutral — Warm Gray

Derived from primary hue (30°) at low saturation. Warmer than pure gray, cooler than the primary.

```css
:root {
  --color-neutral-50:  hsl(30,  8%, 97%);   /* #F8F6F4 */
  --color-neutral-100: hsl(30,  7%, 93%);   /* #EEECEA */
  --color-neutral-200: hsl(30,  6%, 86%);   /* #DDD9D6 */
  --color-neutral-300: hsl(30,  5%, 74%);   /* #BDB9B6 */
  --color-neutral-400: hsl(30,  5%, 60%);   /* #9A9693 */
  --color-neutral-500: hsl(30,  5%, 46%);   /* #787470 */
  --color-neutral-600: hsl(30,  6%, 34%);   /* #585350 */
  --color-neutral-700: hsl(30,  7%, 24%);   /* #3E3A37 */
  --color-neutral-800: hsl(30,  7%, 16%);   /* #2A2724 */
  --color-neutral-900: hsl(30,  8%, 10%);   /* #1A1816 */
  --color-neutral-950: hsl(30,  8%,  6%);   /* #0F0E0C */
}
```

### Semantic colors

Adjusted to harmonize with the warm primary — standard greens and reds pulled toward amber.

```css
:root {
  --color-success: hsl(148, 38%, 42%);   /* #3E9463 — forest green */
  --color-warning: hsl( 38, 72%, 52%);   /* #DBA030 — harvest gold */
  --color-error:   hsl(  4, 58%, 52%);   /* #CC3B2E — ember red */
  --color-info:    hsl(205, 44%, 48%);   /* #4589B0 — cold sky */
}
```

### Dark mode

The brand primarily lives on dark backgrounds (terminal context). On GitHub Pages, default to dark with a light option.

```css
[data-theme="dark"] {
  --color-surface:          var(--color-neutral-950);
  --color-surface-raised:   var(--color-neutral-900);
  --color-surface-overlay:  var(--color-neutral-800);
  --color-text-primary:     var(--color-neutral-100);
  --color-text-secondary:   var(--color-neutral-400);
  --color-text-brand:       var(--color-primary-400);
  --color-border:           var(--color-neutral-800);
}

[data-theme="light"] {
  --color-surface:          var(--color-neutral-50);
  --color-surface-raised:   var(--color-neutral-100);
  --color-surface-overlay:  var(--color-neutral-200);
  --color-text-primary:     var(--color-neutral-900);
  --color-text-secondary:   var(--color-neutral-500);
  --color-text-brand:       var(--color-primary-700);
  --color-border:           var(--color-neutral-200);
}
```

---

## 3. Typography

### Typefaces

**Display — Fraunces**
Variable optical serif. Use for headlines, the wordmark, pull quotes.
`'Fraunces', Georgia, 'Times New Roman', serif`
Google Fonts: https://fonts.google.com/specimen/Fraunces
Variable axes: `opsz` (optical size), `wght` (weight), `SOFT`, `WONK`

Recommended settings:
- Headlines: `opsz` 144, `wght` 300 — large and light, maximum optical quality
- Subheadings: `opsz` 72, `wght` 400
- Pull quotes / tagline: `opsz` 144, `wght` 300, `font-style: italic`

**Body — DM Sans**
Clean humanist sans. Use for all body copy, UI labels, navigation.
`'DM Sans', system-ui, -apple-system, sans-serif`
Google Fonts: https://fonts.google.com/specimen/DM+Sans

### Type scale

```css
:root {
  --font-display: 'Fraunces', Georgia, serif;
  --font-body:    'DM Sans', system-ui, sans-serif;

  --text-xs:   0.75rem;    /* 12px — captions, labels */
  --text-sm:   0.875rem;   /* 14px — secondary body */
  --text-base: 1rem;       /* 16px — primary body */
  --text-lg:   1.125rem;   /* 18px — lead paragraph */
  --text-xl:   1.25rem;    /* 20px — small heading */
  --text-2xl:  1.5rem;     /* 24px — section heading */
  --text-3xl:  1.875rem;   /* 30px — page heading */
  --text-4xl:  2.25rem;    /* 36px — hero sub */
  --text-5xl:  3rem;       /* 48px — hero / display */
  --text-6xl:  3.75rem;    /* 60px — wordmark scale */

  --leading-tight:   1.1;
  --leading-snug:    1.25;
  --leading-normal:  1.5;
  --leading-relaxed: 1.625;

  --tracking-tight:  -0.02em;
  --tracking-normal:  0em;
  --tracking-wide:    0.04em;   /* uppercase labels only */
}
```

### Usage rules

| Element | Font | Size | Weight | Leading | Tracking |
|---|---|---|---|---|---|
| Wordmark | Fraunces | `text-6xl` | 300 | tight | −0.02em |
| Hero headline | Fraunces | `text-5xl` | 300 | tight | −0.02em |
| Section heading | Fraunces | `text-3xl` | 400 | snug | −0.01em |
| Sub-heading | DM Sans | `text-xl` | 500 | snug | 0 |
| Body | DM Sans | `text-base` | 400 | normal | 0 |
| Caption / label | DM Sans | `text-sm` | 400 | normal | 0 |
| Code / terminal | Theme font (JetBrains Mono NF) | `text-sm` | 400 | normal | 0 |

---

## 4. Voice & Tone

### Personality

**still · precise · poetic**

- **Still** — no urgency, no hype, no call-to-action desperation. The work speaks.
- **Precise** — every color choice is defended, every token named. Specificity is a value.
- **Poetic** — atmospheric references are taken seriously. "The watch fire at 3am" is a design brief, not decoration.

### Tonality

| Axis | Score | Note |
|---|---|---|
| Formal ↔ Casual | 2/5 | Slightly formal — never stiff, never chatty |
| Serious ↔ Playful | 2/5 | Serious about craft — not joyless |
| Technical ↔ Accessible | 3/5 | Names systems precisely but doesn't require expertise |

### Do

- Name the specific atmospheric moment (`the moment between day and night`)
- Use short, declarative sentences with confident rhythm
- Let numbers carry weight (`WCAG AA. All twelve.`)
- Use the themes' own language as evidence (`warm gold navigation, twilight lavender chrome`)
- Leave things slightly unsaid — trust the reader

### Don't

- Say "beautiful", "stunning", "gorgeous", "clean" — show don't tell
- Use exclamation marks
- Say "easy to install" or "just copy the file"
- Qualify everything (`sort of`, `kind of`, `basically`)
- Write marketing superlatives (`the best`, `the most complete`, `perfect`)

### Copy examples

**Tagline:**
> Twelve atmospheres. Each one complete.

**Theme description (Eventide):**
> The moment between day and night. Deep indigo sky, warm gold navigation, twilight lavender chrome.

**Feature description:**
> One JSON file. Eleven formats. Every terminal, every editor — all in the same directory as the source.

**Contrast claim:**
> Every token in every theme clears 4.5:1 against its background. Not as a selling point — as a baseline.

**README opening:**
> Twelve terminal and editor theme design systems. Each built from a single atmospheric concept.

---

## 5. Mood Board Direction

### Environment / Setting
A study or workshop at the threshold of dusk — the moment when ambient light and artificial light reach equilibrium. Neither fully day nor fully night. A desk lamp is on, the window still shows color. The space is used but ordered.

### Color Feeling
Warm ambers and oranges in tension with cool indigos and slate blues. Neither wins — they coexist at the edge of each other's territory. Backgrounds are near-black but warm, not cold. Highlights are restrained to one note at a time.

### Texture / Material
Laid paper with visible grain. Worn linen. Darkened oak. Hammered copper. Materials that have been used and have absorbed that use. Nothing pristine. Nothing glossy. Matte surfaces that absorb light rather than reflect it.

### Aesthetic Focus
No people. The workspace as subject — the terminal, the tools, the configured environment. An aesthetic that belongs to whoever inhabits it, not to a photographer's model. Evidence of work, not performance of it.

### Typography / UI Feel
Typography that doesn't perform its weight — optical serifs at large sizes that feel light despite their presence. Body copy with breathing room. Generous line height. No visual clutter. Interface elements that recede until needed. Monospaced output treated with the same care as display type.

---

## 6. Application

### GitHub README

- H1: `gloam` (or the Fraunces wordmark as an SVG in the README header)
- Opening line: one sentence, no bullets, no emoji
- Theme sections: atmospheric description before token table — never the reverse
- Install commands: minimal prose, one sentence of context before the code block
- No badges unless they convey essential information (license, tests passing)

### GitHub Pages

- Default to dark theme (`neutral-950` background)
- One primary-500 amber accent per section — never more
- Theme previews: the terminal prompt ASCII art from the README, large, Fraunces label beneath
- Navigation: wordmark left, minimal link list right — no hamburger, no mega-menu
- Footer: tagline in Fraunces italic, small

### Color theme files (README badges / headers)

Do not place Gloam brand colors inside the theme files themselves — they have their own palettes. The brand is the container, not the content.
