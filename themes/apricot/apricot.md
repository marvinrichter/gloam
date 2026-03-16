# Apricot — Design System

> A light terminal prompt and editor color theme for first light through an apricot grove.

---

## Concept

Apricot captures first light through an apricot grove — the specific warm golden-peach of morning sun through fruit-laden branches, a warmth that exists for exactly twenty minutes before it becomes ordinary daylight. Not generic peach, not orange, not gold: the particular color of morning light as it passes through fruit, warming everything it touches.

Every design decision maps to that moment:

| Decision | Reasoning |
|---|---|
| Background `#FDF6ED` | Warm cream-peach — the pale morning sky just before full sunrise |
| Foreground `#200E06` | Deep apricot-dark — the dark of bark and deep shadow in the grove |
| Primary `#7A5810` | Golden amber-apricot — the skin of the fruit lit from behind by morning sun |
| Accent `#904018` | Warm amber-brown — the deeper shadow side of the fruit, the branch color |
| Muted `#806050` | Warm brown-grey — bark, shadow, the texture of the grove floor |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#FDF6ED`.

```
primary    #7A5810   hsl(41°, 77%, 27%)   golden amber-apricot  6.1:1  AA
accent     #904018   hsl(20°, 73%, 32%)   warm amber-brown      6.7:1  AA
muted      #806050   hsl(26°, 22%, 40%)   warm brown-grey       5.3:1  AA
error      #B01818   hsl(0°, 74%, 39%)    deep red              6.5:1  AA
```

### Assignment rules

```
  user  ~/path  branch status  ·····················  ◯ time
›
```

**Light theme:** all tokens are dark colors on a warm cream-peach background. One rule governs the system: **muted for chrome, primary for navigation, accent for git and the cursor.** The `◯` (large circle) evokes the outline of fruit, a simple silhouette against the morning sky.

---

## ANSI Palette

For a light theme, all ANSI colors except 0 and 15 are darker than the background.

### Full palette

```
ANSI 0   #FDF6ED  background (warm cream-peach)
ANSI 1   #781808  dark deep-red
ANSI 2   #386030  dark warm green
ANSI 3   #804010  dark warm amber
ANSI 4   #7A5810  golden amber ← primary
ANSI 5   #7A3838  dark rose-red
ANSI 6   #904018  warm amber-brown ← accent
ANSI 7   #806050  brown-grey ← muted
ANSI 8   #EDD8B8  pale warm beige — comments/dim text on light bg
ANSI 9   #B01818  deep red ← error
ANSI 10  #487840  medium warm green
ANSI 11  #A86030  warm amber-orange
ANSI 12  #A86038  slightly brighter warm brown
ANSI 13  #A05060  medium rose
ANSI 14  #507880  cool teal complement
ANSI 15  #200E06  foreground (deep apricot-dark)
```

### UI color slots

```
Background     #FDF6ED  warm cream-peach
Foreground     #200E06  deep apricot-dark
Bold           #200E06  same as foreground
Cursor         #904018  warm amber — accent token
Cursor text    #FDF6ED  background inside cursor block
Selection      #F0D8B8  warm peach wash
Selected text  #200E06  foreground on selection
Links          #A04820  primary — distinct from muted body text
```

---

## Prompt Anatomy

### Layout

```
  marvin  ~/gloam   main ~2  ·····················  ◯ 14:32
›
```

Single line. The `◯` (large circle) is a simple fruit outline — the shape of an apricot at dawn.

### Structural elements

```
·   U+00B7  MIDDLE DOT  (fill)
◯   U+25EF  LARGE CIRCLE  (time prefix — dawn fruit silhouette)
›   U+203A  SINGLE RIGHT-POINTING ANGLE QUOTATION MARK
‹   U+2039  SINGLE LEFT-POINTING ANGLE QUOTATION MARK  (vim normal)
```

---

## Light Theme Setup

**iTerm2:** Uncheck *Use bright colors for bold text* (`Preferences › Profiles › Colors`). Without this, bold text appears as white against the light background and becomes invisible.

---

## Contrast Compliance

All tokens verified against background `#FDF6ED` (L = 0.92909).

```
Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #7A5810   0.11170     6.1:1    AA  ✓
accent     #904018   0.09662     6.7:1    AA  ✓
muted      #806050   0.13534     5.3:1    AA  ✓
error      #B01818   0.09949     6.5:1    AA  ✓
foreground #200E06   0.01009    63.0:1    AAA ✓
```

---

## Install

```bash
npx github:marvinrichter/gloam apricot starship
npx github:marvinrichter/gloam apricot alacritty
npx github:marvinrichter/gloam apricot kitty
npx github:marvinrichter/gloam apricot vscode
npx github:marvinrichter/gloam apricot neovim
```
