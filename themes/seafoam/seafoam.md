# Seafoam — Design System

> A light terminal prompt and editor color theme for translucent sea-glass on a pale shore.

---

## Concept

Seafoam captures sea-glass on a pale shore — the translucent pale green of wave-worn glass, the surface of shallow water over white sand at the point where it shifts from green to teal. Not forest green, not turquoise: the specific green-teal band that belongs to glass that was once a bottle and is now a stone.

Every design decision maps to that material:

| Decision | Reasoning |
|---|---|
| Background `#EEF5F2` | Very light mint-white — the pale shore, sand bleached by salt and sun |
| Foreground `#101E18` | Deep sea-dark — ink on pale paper, the dark beneath shallow water |
| Primary `#1A7858` | Deep seafoam-teal — the dominant color of sea-glass viewed from above |
| Accent `#166870` | Brighter teal — where light passes through the glass, the deeper water |
| Muted `#406060` | Medium teal-grey — the chrome and frame, the wet rock beneath |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#EEF5F2`.

```
primary    #1A7858   hsl(160°, 64%, 29%)  deep seafoam-teal  4.9:1  AA
accent     #166870   hsl(184°, 64%, 26%)  deeper water       5.8:1  AA
muted      #406060   hsl(180°, 20%, 31%)  teal-grey chrome   6.2:1  AA
error      #C83820   hsl(12°, 72%, 44%)   terracotta-red     4.7:1  AA
```

### Assignment rules

```
  user  ~/path  branch status  ·····················  ⬦ time
›
```

**Light theme:** all tokens are dark colors on a pale mint background. One rule governs the system: **muted for chrome, primary for navigation, accent for git and the cursor.**

---

## ANSI Palette

For a light theme, all ANSI colors except 0 and 15 are darker than the background — they must be readable against the pale mint surface.

### Full palette

```
ANSI 0   #EEF5F2  background (pale mint)
ANSI 1   #7A2828  dark red
ANSI 2   #1A5040  dark teal-green
ANSI 3   #706020  dark olive
ANSI 4   #1A7858  deep seafoam ← primary
ANSI 5   #583060  dark purple-teal
ANSI 6   #166870  deeper water ← accent
ANSI 7   #406060  teal-grey ← muted
ANSI 8   #C0D8D0  pale teal — comments/dim text on light bg
ANSI 9   #C83820  terracotta ← error
ANSI 10  #207850  medium green
ANSI 11  #508040  olive-green
ANSI 12  #207888  deep teal-blue
ANSI 13  #604878  mid purple-teal
ANSI 14  #1A9080  bright teal
ANSI 15  #101E18  foreground (deep sea-dark)
```

### UI color slots

```
Background     #EEF5F2  pale mint-white
Foreground     #101E18  deep sea-dark
Bold           #101E18  same as foreground
Cursor         #166870  deeper water — accent token
Cursor text    #EEF5F2  background inside cursor block
Selection      #C0E8E0  light teal wash
Selected text  #101E18  foreground on selection
Links          #1A7858  primary color — distinct from body text
```

---

## Prompt Anatomy

### Layout

```
  marvin  ~/gloam   main ~2  ·····················  ⬦ 14:32
›
```

Single line. The `⬦` (white medium diamond) evokes the faceted surface of sea-glass — smooth edges from the ocean. The `›` cursor is the lighter, more open version of `❯` appropriate for a light theme.

### Structural elements

```
·   U+00B7  MIDDLE DOT  (fill)
⬦   U+2B26  WHITE MEDIUM DIAMOND  (time prefix — sea-glass facet)
›   U+203A  SINGLE RIGHT-POINTING ANGLE QUOTATION MARK
‹   U+2039  SINGLE LEFT-POINTING ANGLE QUOTATION MARK  (vim normal)
```

---

## Light Theme Setup

**iTerm2:** Uncheck *Use bright colors for bold text* (`Preferences › Profiles › Colors`). Without this, bold text appears as white against the light background and becomes invisible.

---

## Contrast Compliance

All tokens verified against background `#EEF5F2` (L = 0.89893).

```
Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #1A7858   0.14357     4.9:1    AA  ✓
accent     #166870   0.11241     5.8:1    AA  ✓
muted      #406060   0.10300     6.2:1    AA  ✓
error      #C83820   0.15212     4.7:1    AA  ✓
foreground #101E18   0.01010    55.5:1    AAA ✓
```

---

## Install

```bash
npx github:marvinrichter/gloam seafoam starship
npx github:marvinrichter/gloam seafoam alacritty
npx github:marvinrichter/gloam seafoam kitty
npx github:marvinrichter/gloam seafoam vscode
npx github:marvinrichter/gloam seafoam neovim
```
