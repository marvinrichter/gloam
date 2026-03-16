# Kiln — Design System

> A terminal prompt and editor color theme for the heat of fired stoneware.

---

## Concept

Kiln captures a stoneware piece seconds after it leaves the kiln — the specific orange of fired clay still radiating heat, the contrast between the glowing exterior and the cooler unglazed underside. Not a generic orange theme: the narrow coral-terracotta band between red and amber that only exists at firing temperature.

Every design decision maps to that material moment:

| Decision | Reasoning |
|---|---|
| Background `#100908` | Near-black with faint terracotta warmth — the interior of the kiln before firing ends |
| Foreground `#F2E0D0` | Pale clay-white — unglazed stoneware surface in cool light |
| Primary `#E05830` | Fired coral-orange — the dominant surface color seconds out of the kiln |
| Accent `#F08040` | Heat-bright terracotta — the hottest point, the edge where orange saturates |
| Muted `#A87060` | Unglazed clay mid-tone — the cooler, substrate face |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#100908`.

```
primary    #E05830   hsl(16°, 75%, 53%)   fired coral-orange  5.3:1  AA
accent     #F08040   hsl(22°, 84%, 60%)   heat-bright terra   7.4:1  AAA
muted      #A87060   hsl(20°, 27%, 52%)   unglazed clay       4.8:1  AA
error      #DC4030   hsl(4°, 72%, 52%)    deeper kiln-red     4.5:1  AA
```

### Assignment rules

```
╭  user  ~/path   branch status  ──────────────────  ⊡ time
╰─❯
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

---

## ANSI Palette

### Full palette

```
Normal                            Bright
────────────────────────────────  ──────────────────────────────────
0  #100908  kiln-black            8  #281410  dim terracotta
1  #A03028  muted deep-red        9  #DC4030  kiln-red ← error
2  #508050  muted green           10 #72A860  bright olive
3  #C04820  dark coral            11 #E05830  fired orange ← primary
4  #6880A0  muted blue-grey       12 #A87060  clay mid-tone ← muted
5  #906060  dusty rose            13 #C08080  lighter dusty
6  #507870  dark teal-grey        14 #709088  teal complement
7  #C8B0A0  warm cream-grey       15 #F2E0D0  pale clay-white ← foreground
```

### UI color slots

```
Background     #100908  kiln-black
Foreground     #F2E0D0  pale clay-white
Bold           #F2E0D0  same as foreground
Cursor         #F08040  heat-bright — accent token
Cursor text    #100908  background inside cursor block
Selection      #281410  dark terracotta highlight
Selected text  #F2E0D0  foreground on selection
Links          #F0B080  warm orange-tan
```

---

## Prompt Anatomy

### Layout

```
╭  marvin  ~/gloam   main ~2  ──────────────────────  ⊡ 14:32
╰─❯
```

Two lines. The first carries all information. The second is the cursor line.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
─   U+2500  BOX DRAWINGS LIGHT HORIZONTAL  (fill character)
⊡   U+22A1  SQUARED DOT OPERATOR  (time prefix — kiln slot viewed from the front)
❯   U+276F  HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT
❮   U+276E  HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT  (vim normal)
```

---

## Contrast Compliance

All tokens verified against background `#100908` (L = 0.00323).

```
Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #E05830   0.23040     5.3:1    AA  ✓
accent     #F08040   0.34334     7.4:1    AAA ✓
muted      #A87060   0.22098     4.8:1    AA  ✓
error      #DC4030   0.18883     4.5:1    AA  ✓
foreground #F2E0D0   0.80900    14.9:1    AAA ✓
```

---

## Install

```bash
npx github:marvinrichter/gloam kiln starship
npx github:marvinrichter/gloam kiln alacritty
npx github:marvinrichter/gloam kiln kitty
npx github:marvinrichter/gloam kiln vscode
npx github:marvinrichter/gloam kiln neovim
```
