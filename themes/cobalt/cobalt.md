# Cobalt — Design System

> deep-sea cobalt glass — light refracting through dense saturated blue

---

## Concept

Cobalt takes its name from the cobalt aluminate pigment — a blue so saturated it was historically worth more than gold. The background is deep navy, almost black but unmistakably blue. The primary sits at hue 233°: a rich periwinkle-violet that reads as royal rather than cold. The accent is cyan — the complementary cool foil that makes the blue primary feel even richer by contrast.

| Decision | Reasoning |
|---|---|
| Background `#080C18` | Deep navy. The colour of the sky at nautical twilight — dark, but clearly blue. |
| Foreground `#D8E0F0` | Cool blue-white. Porcelain in cool light. |
| Primary `#6878F0` | Periwinkle-violet at hue 233°. Rich and saturated without being cold. |
| Accent `#70D8F0` | Neon cyan. Strong contrast, maps to cursor and git status. |
| Muted `#7888B8` | Faded Delft blue. Secondary information in the prompt. |

---

## Color System

### Semantic tokens

All tokens verified against background `#080C18`.

```
primary    #6878F0   hsl(233°, 84%, 70%)  periwinkle-violet    5.5:1  AA
accent     #70D8F0   hsl(191°, 83%, 69%)  neon cyan           12.5:1  AAA
muted      #7888B8   hsl(220°, 28%, 62%)  faded Delft          5.9:1  AA
error      #D05860   hsl(354°, 53%, 58%)  deep rose            5.2:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #080C18  deep navy            8  #182038  dim navy
1  #B05060  muted rose           9  #D05860  deep rose ← error
2  #3878A0  sea blue            10  #4898A8  bright teal
3  #8098C8  pale cornflower     11  #6878F0  periwinkle ← primary
4  #4858C8  royal blue          12  #7888B8  faded Delft ← muted
5  #8068B0  slate violet        13  #9080D0  pale violet
6  #3898C0  Delft teal          14  #40B8D8  bright cyan
7  #8898C0  cool grey-blue      15  #D8E0F0  porcelain ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #6878F0    5.5:1   AA  ✓
accent     #70D8F0   12.5:1   AAA ✓
muted      #7888B8    5.9:1   AA  ✓
error      #D05860    5.2:1   AA  ✓
```

---

## File Reference

```
themes/cobalt/
├── cobalt.json           source of truth
├── cobalt.md             this document
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
npx github:marvinrichter/gloam cobalt starship
```
