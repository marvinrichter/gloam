# Synthwave — Design System

> neon grids and chrome reflections in a rain-slicked midnight arcade

---

## Concept

Synthwave is the only theme in the gloam collection built around a fully synthetic colour world. No atmospheric reference, no material precedent — the palette is pure signal. The background is a deep violet-black, the colour of a CRT monitor at maximum brightness in a dark room. The primary is hot magenta at hue 321° — the exact colour of a neon tube sign. The accent is neon cyan, its direct complement. Together they produce the maximum possible chromatic vibration in a dark terminal.

| Decision | Reasoning |
|---|---|
| Background `#0D0818` | Deep violet-black. The space inside the monitor, not physical darkness. |
| Foreground `#F0E8FF` | Cool lavender-white. Light emitting from a screen, not reflected from paper. |
| Primary `#FF60C8` | Hot magenta at hue 321°. Full saturation — neon, uncompromising. |
| Accent `#40E8E0` | Neon cyan. The direct complement of the primary — maximum contrast. |
| Muted `#9070C8` | Deep purple. The ambient glow of the monitor bezel. |

---

## Color System

### Semantic tokens

All tokens verified against background `#0D0818`.

```
primary    #FF60C8   hsl(321°, 100%, 69%)  neon magenta         7.7:1  AAA
accent     #40E8E0   hsl(177°, 79%, 58%)   neon cyan           13.7:1  AAA
muted      #9070C8   hsl(265°, 38%, 60%)   monitor glow         5.4:1  AA
error      #FF4070   hsl(345°, 100%, 63%)  hot alarm            6.1:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #0D0818  void violet          8  #281848  dim purple
1  #C84060  muted crimson-pink   9  #FF4070  hot alarm ← error
2  #40C890  neon green          10  #50E890  bright neon green
3  #D080C0  neon pink-violet    11  #FF60C8  neon magenta ← primary
4  #6050D0  electric indigo     12  #9070C8  monitor glow ← muted
5  #C040C8  electric violet     13  #E060F0  bright violet
6  #40C0D8  electric teal       14  #40E8E0  neon cyan ← accent
7  #B0A0D0  cool lavender       15  #F0E8FF  screen white ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #FF60C8    7.7:1   AAA ✓
accent     #40E8E0   13.7:1   AAA ✓
muted      #9070C8    5.4:1   AA  ✓
error      #FF4070    6.1:1   AA  ✓
```

---

## File Reference

```
themes/synthwave/
├── synthwave.json           source of truth
├── synthwave.md             this document
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
npx github:marvinrichter/gloam synthwave starship
```
