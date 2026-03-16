# Lapis — Design System

> A terminal prompt and editor color theme for the deep blue of ground lapis lazuli.

---

## Concept

Lapis captures ground lapis lazuli — the specific ultramarine blue used in illuminated manuscripts and Renaissance paintings, the pigment that once cost more than gold, the color of the Madonna's robe in every painting that could afford it. Not cobalt, not indigo, not periwinkle: the pure saturated mid-blue that sits exactly between sky and sea without belonging to either.

Every design decision maps to that pigment:

| Decision | Reasoning |
|---|---|
| Background `#060810` | Near-black with deep blue — the manuscript's vellum in shadow, before the paint |
| Foreground `#D0D8F0` | Pale parchment-blue — the illuminated page catching candlelight |
| Primary `#5078F0` | Ultramarine — the dominant pigment, pure and saturated |
| Accent `#6090FF` | Bright ultramarine highlight — where the light catches the surface |
| Muted `#6878A8` | Deep slate-blue — the chrome, the frame, the margin notes |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#060810`.

```
primary    #5078F0   hsl(226°, 83%, 63%)  ultramarine        5.0:1  AA
accent     #6090FF   hsl(222°, 100%, 70%) bright ultramarine 6.6:1  AA
muted      #6878A8   hsl(224°, 25%, 53%)  slate-blue chrome  4.6:1  AA
error      #E84040   hsl(0°, 77%, 58%)    vermilion          5.0:1  AA
```

The error color uses vermilion — the pigment used for rubrication (red headings) in illuminated manuscripts. The same manuscripts that used ultramarine for the blue.

### Assignment rules

```
╭  user  ~/path   branch status  ·····················  ✸ time
╰─❯
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

---

## ANSI Palette

### Full palette

```
Normal                            Bright
────────────────────────────────  ──────────────────────────────────
0  #060810  vellum-black          8  #151C38  dim indigo
1  #A83838  dark rubrication red  9  #E84040  vermilion ← error
2  #3080A0  cool teal-green       10 #48A8C8  bright teal
3  #4870C0  dim blue              11 #5078F0  ultramarine ← primary
4  #304898  deep blue             12 #6878A8  slate-blue ← muted
5  #6048A8  deep violet           13 #8868D0  bright violet
6  #3890B8  teal-blue             14 #60B8E0  bright teal-blue
7  #A0B0E0  pale lavender-blue    15 #D0D8F0  pale parchment ← foreground
```

### UI color slots

```
Background     #060810  vellum-black
Foreground     #D0D8F0  pale parchment-blue
Bold           #D0D8F0  same as foreground
Cursor         #6090FF  bright ultramarine — accent token
Cursor text    #060810  background inside cursor block
Selection      #101828  deep indigo highlight
Selected text  #D0D8F0  foreground on selection
Links          #90B0FF  bright blue — readable and distinct
```

---

## Prompt Anatomy

### Layout

```
╭  marvin  ~/gloam   main ~2  ·····················  ✸ 14:32
╰─❯
```

Two lines. The `✸` (eight-pointed star) evokes the illuminated margin stars used in medieval manuscripts — small decorative stars placed in margins to indicate important passages.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
·   U+00B7  MIDDLE DOT  (fill character)
✸   U+2738  HEAVY EIGHT POINTED RECTILINEAR BLACK STAR  (time prefix — illuminated margin star)
❯   U+276F  HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT
❮   U+276E  HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT  (vim normal)
```

---

## Contrast Compliance

All tokens verified against background `#060810` (L = 0.00250).

```
Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #5078F0   0.21430     5.0:1    AA  ✓
accent     #6090FF   0.29653     6.6:1    AA  ✓
muted      #6878A8   0.19203     4.6:1    AA  ✓
error      #E84040   0.21193     5.0:1    AA  ✓
foreground #D0D8F0   0.68700    13.7:1    AAA ✓
```

---

## Install

```bash
npx github:marvinrichter/gloam lapis starship
npx github:marvinrichter/gloam lapis alacritty
npx github:marvinrichter/gloam lapis kitty
npx github:marvinrichter/gloam lapis vscode
npx github:marvinrichter/gloam lapis neovim
```
