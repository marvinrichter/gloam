# Overcast — Design System

> A light terminal prompt and editor color theme for an overcast November morning.

---

## Concept

Overcast captures an overcast November morning — the specific diffuse silver-grey of total cloud cover, the light that has no direction, no shadow, no warmth, the colour of working undistracted. Not pale blue, not warm white: the absence-of-weather grey that removes all atmospheric drama and leaves only the work in front of you.

Every design decision maps to that state:

| Decision | Reasoning |
|---|---|
| Background `#F0F2F5` | Very light cool grey — total cloud cover, diffuse light, no shadows |
| Foreground `#181C28` | Deep blue-charcoal — the density of text against flat silver light |
| Primary `#4040C8` | Pure blue — the functional color that cuts through the grey |
| Accent `#3060C8` | Mid blue — lighter, for git and the cursor |
| Muted `#505870` | Blue-grey — the chrome, the frame, the structural elements |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#F0F2F5`.

```
primary    #4040C8   hsl(240°, 52%, 52%)  pure blue          6.7:1  AA
accent     #3060C8   hsl(222°, 62%, 49%)  indigo-blue        5.2:1  AA
muted      #505870   hsl(228°, 17%, 37%)  blue-grey chrome   6.3:1  AA
error      #C02030   hsl(354°, 71%, 46%)  warm red           5.4:1  AA
```

### Assignment rules

```
╭  user  ~/path   branch status  ──────────────────────  ◦ time
╰─❯
```

**Light theme:** all tokens are dark colors on a cool grey background. One rule governs the system: **muted for chrome, primary for navigation, accent for git and the cursor.** The `◦` (white bullet) evokes a diffuse point of light — the absence of a strong light source.

---

## ANSI Palette

For a light theme, all ANSI colors except 0 and 15 are darker than the background.

### Full palette

```
ANSI 0   #F0F2F5  background (light cool grey)
ANSI 1   #901828  dark red
ANSI 2   #1A5A30  dark green
ANSI 3   #705010  dark amber
ANSI 4   #4040C8  pure blue ← primary
ANSI 5   #583878  deep violet
ANSI 6   #3060C8  mid blue ← accent
ANSI 7   #505870  blue-grey ← muted
ANSI 8   #C8CDD8  pale blue-grey — comments/dim text on light bg
ANSI 9   #C02030  warm red ← error
ANSI 10  #287840  medium green
ANSI 11  #A06020  medium amber
ANSI 12  #4060B0  slightly brighter blue
ANSI 13  #7858A0  medium violet
ANSI 14  #405880  deeper muted-blue
ANSI 15  #181C28  foreground (deep blue-charcoal)
```

### UI color slots

```
Background     #F0F2F5  light cool grey
Foreground     #181C28  deep blue-charcoal
Bold           #181C28  same as foreground
Cursor         #3060C8  mid blue — accent token
Cursor text    #F0F2F5  background inside cursor block
Selection      #D0D8F0  light blue wash
Selected text  #181C28  foreground on selection
Links          #3060C8  accent color — distinct from muted chrome
```

---

## Prompt Anatomy

### Layout

```
╭  marvin  ~/gloam   main ~2  ──────────────────────────  ◦ 14:32
╰─❯
```

Two lines. The box structure gives form to a theme that otherwise has no atmospheric drama. The `◦` (white bullet) is a minimal diffuse point — no weight, no direction.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
─   U+2500  BOX DRAWINGS LIGHT HORIZONTAL  (fill)
◦   U+25E6  WHITE BULLET  (time prefix — diffuse light point)
❯   U+276F  HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT
❮   U+276E  HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT  (vim normal)
```

---

## Light Theme Setup

**iTerm2:** Uncheck *Use bright colors for bold text* (`Preferences › Profiles › Colors`). Without this, bold text appears as white against the light background and becomes invisible.

---

## Contrast Compliance

All tokens verified against background `#F0F2F5` (L = 0.88622).

```
Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #4040C8   0.08941     6.7:1    AA  ✓
accent     #3060C8   0.13164     5.2:1    AA  ✓
muted      #505870   0.09855     6.3:1    AA  ✓
error      #C02030   0.12453     5.4:1    AA  ✓
foreground #181C28   0.01510    39.4:1    AAA ✓
```

---

## Install

```bash
npx github:marvinrichter/gloam overcast starship
npx github:marvinrichter/gloam overcast alacritty
npx github:marvinrichter/gloam overcast kitty
npx github:marvinrichter/gloam overcast vscode
npx github:marvinrichter/gloam overcast neovim
```
