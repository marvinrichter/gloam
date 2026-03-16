# Rosewater — Design System

> petals steeping in cold water — rose oil rising to the surface at dusk

---

## Concept

Rosewater is the colour of a rose distillation: the near-black of the still, the deep rose-pink of the oil collected on cold water, the pale lilac of the steam. The background is a near-black with a faint wine-violet cast — the colour of the inside of a copper still at night. The primary is deep rose-pink at hue 334°: warm, saturated, feminine in the archaic sense — made of pigment, not LED. The accent is soft lilac — the complement that keeps the pink from reading as aggressive.

| Decision | Reasoning |
|---|---|
| Background `#100A0F` | Near-black with a faint wine cast. The inside of a copper distillation still. |
| Foreground `#F0E0E8` | Very pale blush. Warm white with a rose undertone. |
| Primary `#E868A0` | Deep rose-pink at hue 334°. Saturated, warm — rose oil on water. |
| Accent `#C8A0D8` | Soft lilac. Steam from the still. Complements the rose without competing. |
| Muted `#9A7890` | Dusty mauve. Dried petals. The quiet mid-tone. |

---

## Color System

### Semantic tokens

All tokens verified against background `#100A0F`.

```
primary    #E868A0   hsl(334°, 70%, 66%)  rose oil             6.9:1  AA
accent     #C8A0D8   hsl(286°, 38%, 73%)  lilac steam          9.6:1  AAA
muted      #9A7890   hsl(320°, 12%, 55%)  dried petal          5.5:1  AA
error      #E05A5A   hsl(0°, 67%, 61%)    hot copper           5.8:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #100A0F  copper still          8  #2A1828  dim rose-black
1  #C86070  muted rose-red        9  #E05A5A  hot copper ← error
2  #5A9068  still-room sage      10  #70B880  bright sage
3  #C09068  warm amber           11  #E868A0  rose oil ← primary
4  #6858A0  deep violet          12  #9A7890  dried petal ← muted
5  #B06090  deep rose-violet     13  #D080C8  bright orchid
6  #508098  slate teal           14  #60A8C0  cool teal
7  #B09898  pale blush-grey      15  #F0E0E8  pale blush ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #E868A0    6.9:1   AA  ✓
accent     #C8A0D8    9.6:1   AAA ✓
muted      #9A7890    5.5:1   AA  ✓
error      #E05A5A    5.8:1   AA  ✓
```

---

## File Reference

```
themes/rosewater/
├── rosewater.json           source of truth
├── rosewater.md             this document
├── starship.toml
├── iterm2.itermcolors
├── alacritty.toml
├── kitty.conf
├── wezterm.lua
├── ghostty
├── windows-terminal.json
├── vscode.json
├── neovim.lua
├── intellij.icls
├── zed.json
├── helix.toml
├── tmux.conf
├── terminal.terminal
├── oh-my-posh.omp.json
└── sublime-text.sublime-color-scheme
```

## Install

```bash
npx github:marvinrichter/gloam rosewater starship
```
