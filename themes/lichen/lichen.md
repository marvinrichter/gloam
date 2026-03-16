# Lichen — Design System

> A terminal prompt and editor color theme for the quiet mineral growth of crustose lichen.

---

## Concept

Lichen captures crustose lichen on a granite boulder — the specific grey-green of lichen growth, with mineral grey as the substrate, the quiet organic spread of something very slow and very old. Not a forest green or a spring green: the desaturated, stone-tinged grey-green that belongs to things measured in decades.

Every design decision maps to that material:

| Decision | Reasoning |
|---|---|
| Background `#0A0D0B` | Near-black with a deep green undertone — granite in shadow |
| Foreground `#D8E0D4` | Pale stone-grey-green — lichen crust in diffuse light |
| Primary `#759075` | Sage-green-grey primary — the dominant lichen surface color |
| Accent `#90B878` | Lighter lichen green — the growing edge, the newest growth |
| Muted `#708868` | Dark grey-green — the older, duller substrate lichen |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#0A0D0B`.

```
primary    #759075   hsl(120°, 10%, 51%)  sage-green-grey     5.6:1  AA
accent     #90B878   hsl(104°, 28%, 58%)  lighter lichen      8.7:1  AAA
muted      #708868   hsl(113°, 12%, 47%)  grey-green chrome   5.0:1  AA
error      #C07060   hsl(12°, 38%, 57%)   terracotta-red      5.3:1  AA
```

### Assignment rules

```
╭  user  ~/path   branch status  ·····················  ∴ time
╰─❯
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

---

## ANSI Palette

### Full palette

```
Normal                            Bright
────────────────────────────────  ──────────────────────────────────
0  #0A0D0B  granite-black         8  #1C2A20  dim mossy
1  #886058  warm red-brown        9  #C07060  terracotta ← error
2  #508050  muted green           10 #759075  sage ← primary
3  #888050  olive-gold            11 #A0A860  bright olive
4  #507878  muted teal            12 #708868  grey-green ← muted
5  #786868  dusty mauve           13 #A89080  lighter dust
6  #509888  deeper teal           14 #70C0A0  bright teal
7  #A8B8A4  cool grey-green       15 #D8E0D4  pale stone ← foreground
```

### UI color slots

```
Background     #0A0D0B  granite-black
Foreground     #D8E0D4  pale stone-grey-green
Bold           #D8E0D4  same as foreground
Cursor         #90B878  lighter lichen — accent token
Cursor text    #0A0D0B  background inside cursor block
Selection      #182820  dark mossy highlight
Selected text  #D8E0D4  foreground on selection
Links          #A8C890  bright sage-green
```

---

## Prompt Anatomy

### Layout

```
╭  marvin  ~/gloam   main ~2  ·····················  ∴ 14:32
╰─❯
```

Two lines. The box frame reads as stone — cool, structural. The `∴` (therefore) glyph evokes the three-dot mineral notation used in geology.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
·   U+00B7  MIDDLE DOT  (fill character)
∴   U+2234  THEREFORE  (time prefix — three-point mineral notation)
❯   U+276F  HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT
❮   U+276E  HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT  (vim normal)
```

---

## Contrast Compliance

All tokens verified against background `#0A0D0B` (L = 0.00377).

```
Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #759075   0.22120     5.6:1    AA  ✓
accent     #90B878   0.41566     8.7:1    AAA ✓
muted      #708868   0.22053     5.0:1    AA  ✓
error      #C07060   0.23639     5.3:1    AA  ✓
foreground #D8E0D4   0.70800    13.2:1    AAA ✓
```

---

## Install

```bash
npx github:marvinrichter/gloam lichen starship
npx github:marvinrichter/gloam lichen alacritty
npx github:marvinrichter/gloam lichen kitty
npx github:marvinrichter/gloam lichen vscode
npx github:marvinrichter/gloam lichen neovim
```
