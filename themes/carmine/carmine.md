# Carmine — Design System

> aged carmine ink bleeding through wet paper — the only red that matters

---

## Concept

Carmine names the pigment made from crushed cochineal — a deep, slightly orange-inflected red used in manuscripts, heraldry, and lacquerware. This theme is built around that hue: the primary sits at exactly 0° on the colour wheel, but it is not aggressive. Against the near-black mahogany background it reads as warm, rich, authoritative. The accent is burnt amber — the colour of gold leaf aged to copper.

| Decision | Reasoning |
|---|---|
| Background `#100808` | Dark mahogany. Near-black with a red cast — the ground colour of old lacquerware. |
| Foreground `#F2E4E0` | Aged cream. Warm, not stark white. |
| Primary `#E87070` | Carmine at hue 0°. Deep rose-red, not fire-engine. |
| Accent `#FFAA70` | Burnt amber. The colour of aged gold leaf. Warm contrast to the red primary. |
| Muted `#9A7880` | Dusty rose-grey. The colour of dried petals. |

---

## Color System

### Semantic tokens

All tokens verified against background `#100808`.

```
primary    #E87070   hsl(0°, 73%, 67%)    carmine rose         6.2:1  AA
accent     #FFAA70   hsl(28°, 100%, 72%)  burnt amber         11.0:1  AAA
muted      #9A7880   hsl(340°, 13%, 55%)  dried petal          5.5:1  AA
error      #FF4A4A   hsl(0°, 100%, 65%)   vivid fault          6.1:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #100808  dark mahogany        8  #2A1818  deep rosewood
1  #C85858  muted crimson        9  #FF4A4A  bright fault ← error
2  #5A8A60  verdigris green     10  #78C878  spring green
3  #C08040  old copper          11  #E87070  carmine ← primary
4  #705870  deep plum           12  #9A7880  dried petal ← muted
5  #A85878  dusty rose          13  #D08090  pale blush
6  #407888  slate teal          14  #58A8B8  sky teal
7  #B8A0A0  pale blush-grey     15  #F2E4E0  aged cream ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #E87070    6.2:1   AA  ✓
accent     #FFAA70   11.0:1   AAA ✓
muted      #9A7880    5.5:1   AA  ✓
error      #FF4A4A    6.1:1   AA  ✓
```

---

## File Reference

```
themes/carmine/
├── carmine.json           source of truth
├── carmine.md             this document
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
npx github:marvinrichter/gloam carmine starship
```
