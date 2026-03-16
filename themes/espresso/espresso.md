# Espresso — Design System

> A terminal prompt and editor color theme for the dark warmth of fresh espresso.

---

## Concept

Espresso captures the specific dark brown of a freshly pulled shot — the near-black of a crema-capped surface, the golden translucency of the pour before it settles, the contrast between the coffee and the cream. Not a generic brown theme: the exact moment when liquid and light interact in a small ceramic cup.

Every design decision maps to that material:

| Decision | Reasoning |
|---|---|
| Background `#0D0906` | Near-black with a strong warm brown cast — the surface of espresso in shadow, not pure black |
| Foreground `#F0E4D0` | Pale cream — the milk foam before it dissolves, warmer than paper |
| Primary `#C87030` | Crema amber-brown — the caramel layer on top of the shot, medium warm |
| Accent `#E89840` | Golden pour highlight — the bright ring where crema meets glass |
| Muted `#A07860` | Dark roast mid-brown — spent grounds, the supporting material |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#0D0906`.

```
primary    #C87030   hsl(28°, 60%, 48%)   crema amber       5.5:1  AA
accent     #E89840   hsl(36°, 77%, 57%)   golden highlight  8.5:1  AAA
muted      #A07860   hsl(22°, 26%, 50%)   spent grounds     5.1:1  AA
error      #DC4030   hsl(4°, 72%, 52%)    red-terracotta    4.6:1  AA
```

### Assignment rules

```
  user  ~/path  branch status  ················  ◔ time
  ↑      ↑       ↑      ↑     ↑                 ↑  ↑
  muted  primary accent accent muted             muted muted
❯
↑
accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

---

## ANSI Palette

The 16-color ANSI palette derives from the semantic tokens. Syntax highlighters, `ls`, `git log` — all harmonize with the prompt automatically.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#0D0906` | terminal black = background | background |
| ANSI 8 (bright black) | `#2A1E14` | comments, dim text | background + warm brown |
| ANSI 11 (bright yellow) | `#C87030` | **= primary** | primary token |
| ANSI 12 (bright blue) | `#A07860` | **= muted** | muted token |
| ANSI 15 (bright white) | `#F0E4D0` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#DC4030` | errors, deletions | error token |
| ANSI 10 (bright green) | `#70A850` | success, additions | harmonizing olive-green |
| ANSI 14 (bright cyan) | `#78A898` | strings, links | cool teal complement |

### Full palette

```
Normal                            Bright
────────────────────────────────  ──────────────────────────────────
0  #0D0906  espresso black        8  #2A1E14  dim warm brown
1  #A83028  muted terracotta      9  #DC4030  warm red ← error
2  #588040  muted olive           10 #70A850  olive green
3  #A06020  dark amber            11 #C87030  crema amber ← primary
4  #607890  muted blue-steel      12 #A07860  spent brown ← muted
5  #886050  warm rose-brown       13 #C09080  lighter dusty
6  #507870  dark teal             14 #78A898  sky teal
7  #C0A880  warm tan              15 #F0E4D0  pale cream ← foreground
```

### UI color slots

```
Background     #0D0906  espresso black
Foreground     #F0E4D0  pale cream
Bold           #F0E4D0  same as foreground
Cursor         #E89840  golden highlight — accent token
Cursor text    #0D0906  background inside cursor block
Selection      #2A1810  dark warm brown highlight
Selected text  #F0E4D0  foreground on selection
Links          #D8B890  warm tan — readable, distinct from body text
```

---

## Prompt Anatomy

### Layout

```
  marvin  ~/gloam   main ~2  ·····················  ◔ 14:32
❯
```

Single line. Username, path, git — time right-aligned on the same line. The cursor on a clean second line.

### Structural elements

```
◔   U+25D4  CIRCLE WITH UPPER RIGHT QUADRANT BLACK  (time prefix — coffee surface from above)
❯   U+276F  HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT
❮   U+276E  HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT  (vim normal)
·   U+00B7  MIDDLE DOT  (fill character)
```

---

## Contrast Compliance

All tokens verified against background `#0D0906` (L = 0.00294) using WCAG 2.1 relative luminance.

```
L = 0.2126 × R_lin + 0.7152 × G_lin + 0.0722 × B_lin
contrast = (L_token + 0.05) / (L_bg + 0.05)
```

```
Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #C87030   0.24081     5.5:1    AA  ✓
accent     #E89840   0.39982     8.5:1    AAA ✓
muted      #A07860   0.21751     5.1:1    AA  ✓
error      #DC4030   0.18883     4.6:1    AA  ✓
foreground #F0E4D0   0.83600    16.3:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA). All tokens exceed the threshold.

---

## Install

```bash
npx github:marvinrichter/gloam espresso starship
npx github:marvinrichter/gloam espresso alacritty
npx github:marvinrichter/gloam espresso kitty
npx github:marvinrichter/gloam espresso wezterm
npx github:marvinrichter/gloam espresso ghostty
npx github:marvinrichter/gloam espresso vscode
npx github:marvinrichter/gloam espresso neovim
npx github:marvinrichter/gloam espresso zed
npx github:marvinrichter/gloam espresso windows-terminal
```
