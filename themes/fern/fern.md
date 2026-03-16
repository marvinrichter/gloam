# Fern — Design System

> morning light through fern fronds — soft green filtering warm sun

---

## Concept

Fern is a light theme built around the muted natural green of woodland undergrowth in morning light. Not the bright green of summer foliage, but the cool sage-green of a fern frond in filtered light — desaturated, restful, unassertive. The background is a very pale sage-grey, the colour of the undersides of the fronds. The primary is a dark forest-green, the colour of old fern stems. The accent is dark amber — the colour of the morning sun seen through the fronds.

| Decision | Reasoning |
|---|---|
| Background `#EEF2EC` | Very pale sage-grey. The colour of stone in a fern-covered woodland. |
| Foreground `#1A2E1A` | Deep forest-green. Dark enough to be the definitive text colour. |
| Primary `#1A4A2A` | Dark forest-green. The colour of a fern stem, saturated and alive. |
| Accent `#604A10` | Dark amber. Morning light through the fronds — warm and directional. |
| Muted `#4A5E50` | Muted sage-green. The shadow-side of the leaf. |

---

## Color System

### Semantic tokens

All tokens verified against background `#EEF2EC`.

```
primary    #1A4A2A   hsl(142°, 47%, 20%)  fern stem            8.8:1  AAA
accent     #604A10   hsl(37°, 72%, 22%)   morning amber        7.2:1  AAA
muted      #4A5E50   hsl(145°, 12%, 33%)  shadow leaf          5.8:1  AA
error      #6A1818   hsl(0°, 60%, 25%)    deep crimson        10.3:1  AAA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #0E1A0E  deep forest          8  #30403A  dim woodland
1  #6A2020  dark crimson         9  #6A1818  deep crimson ← error
2  #2A5828  dark green          10  #3A6828  bright forest
3  #684A10  dark amber           11  #1A4A2A  fern stem ← primary
4  #284068  dark slate blue      12  #4A5E50  shadow leaf ← muted
5  #505270  dark violet-grey     13  #584878  dusty violet
6  #1A5048  dark forest teal    14  #287858  bright teal-green
7  #C8D4C0  pale sage-grey       15  #F0F4EE  near-white sage ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #1A4A2A    8.8:1   AAA ✓
accent     #604A10    7.2:1   AAA ✓
muted      #4A5E50    5.8:1   AA  ✓
error      #6A1818   10.3:1   AAA ✓
```

---

## File Reference

```
themes/fern/
├── fern.json           source of truth
├── fern.md             this document
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
npx github:marvinrichter/gloam fern starship
```
