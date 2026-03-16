# Phosphor — Design System

> A terminal prompt and editor color theme for the glow of a P1 monochrome CRT.

---

## Concept

Phosphor captures the P1 monochrome CRT display — the specific green of the first computer terminals, the slight bloom of characters on dark glass, the complete absence of any material reference. Not organic, not atmospheric: synthetic luminescence from inside the glass. The only non-green element is the alarm red, because nothing in the real terminal world matched red.

Every design decision maps to that display:

| Decision | Reasoning |
|---|---|
| Background `#040804` | Near-black with green tint — the CRT dark, the phosphor not fully off |
| Foreground `#C0E8B8` | Phosphor mid-green — default text, the steady glow of unlit characters |
| Primary `#00D848` | Phosphor green — the bright steady state of lit phosphor |
| Accent `#40FF80` | Bright phosphor highlight — the hottest point of a character stroke |
| Muted `#50A860` | Dark phosphor decay — characters fading back to rest state |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#040804`.

```
primary    #00D848   hsl(142°, 100%, 42%)  phosphor green    10.5:1  AAA
accent     #40FF80   hsl(144°, 100%, 62%)  bright phosphor   15.2:1  AAA
muted      #50A860   hsl(130°, 36%, 48%)   phosphor decay     6.8:1  AA
error      #FF4040   hsl(0°, 100%, 62%)    system alarm red   5.8:1  AA
```

### Assignment rules

```
  user  ~/path  branch status  ──────────────────────  ▸ time
▸
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.** The `▸` cursor matches the timePrefix — both are "cursor block" references from the CRT era.

---

## ANSI Palette

The Phosphor palette is nearly monochromatic — almost all ANSI colors derive from the phosphor green family. The only exception is the red alarm (ANSI 1/9) which has no natural phosphor equivalent.

### Full palette

```
Normal                            Bright
────────────────────────────────  ──────────────────────────────────
0  #040804  CRT dark              8  #182818  dim phosphor glow
1  #A83030  dim alarm red         9  #FF4040  alarm red ← error
2  #209040  dim phosphor          10 #00D848  phosphor green ← primary
3  #38A040  amber-green           11 #50E060  yellow-green phosphor
4  #208840  dark phosphor         12 #50A860  phosphor decay ← muted
5  #508040  olive phosphor        13 #60C060  lighter olive
6  #28C878  teal-green phosphor   14 #40FF80  bright phosphor ← accent
7  #80C090  pale medium phosphor  15 #C0E8B8  phosphor text ← foreground
```

### UI color slots

```
Background     #040804  CRT dark
Foreground     #C0E8B8  phosphor mid-green text
Bold           #C0E8B8  same as foreground
Cursor         #40FF80  bright phosphor — accent token
Cursor text    #040804  background inside cursor block
Selection      #102010  dark phosphor highlight
Selected text  #C0E8B8  foreground on selection
Links          #70F8A8  high-bright phosphor
```

---

## Prompt Anatomy

### Layout

```
  marvin  ~/gloam   main ~2  ────────────────────────  ▸ 14:32
▸
```

Single line. The `▸` character appears as both the time prefix and the cursor — a deliberate reference to the block cursor of early terminal displays. Both uses share the same glyph: you are always at a cursor.

### Structural elements

```
─   U+2500  BOX DRAWINGS LIGHT HORIZONTAL  (fill)
▸   U+25B8  SMALL RIGHT-POINTING TRIANGLE  (time prefix + cursor — CRT cursor block)
◂   U+25C2  SMALL LEFT-POINTING TRIANGLE  (vim normal)
```

---

## Contrast Compliance

All tokens verified against background `#040804` (L = 0.00208).

```
Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #00D848   0.49580    10.5:1    AAA ✓
accent     #40FF80   0.74169    15.2:1    AAA ✓
muted      #50A860   0.30555     6.8:1    AA  ✓
error      #FF4040   0.25297     5.8:1    AA  ✓
foreground #C0E8B8   0.57700    11.8:1    AAA ✓
```

---

## Install

```bash
npx github:marvinrichter/gloam phosphor starship
npx github:marvinrichter/gloam phosphor alacritty
npx github:marvinrichter/gloam phosphor kitty
npx github:marvinrichter/gloam phosphor vscode
npx github:marvinrichter/gloam phosphor neovim
```
