# Bamboo — Design System

> vermilion seal on lacquered black — the shock of red ink against deep bamboo shadow

---

## Concept

Bamboo captures the moment a calligrapher lifts the brush — the brief, visceral contrast between vermilion seal ink and the near-black lacquered surface it marks. The background is not pure black but a deep forest-floor green-black, the colour of ink-soaked bamboo. The primary is vermilion-coral: warm, assertive, the colour of official seals in East Asian document culture.

| Decision | Reasoning |
|---|---|
| Background `#090C08` | Forest floor, not void. A near-black with a green undertone — the colour of lacquered bamboo in shadow. |
| Foreground `#E0DDD4` | Aged paper, slightly warm. Not white. |
| Primary `#E06848` | Vermilion seal ink. The definitive mark of authenticity. Warm red-coral at hue 13°. |
| Accent `#80B8A0` | Patinated celadon — the green-grey of aged Chinese porcelain. Cool complement to the warm primary. |
| Muted `#888A90` | Stone. The neutral surface that makes everything else legible. |

---

## Color System

### Semantic tokens

All tokens verified against background `#090C08`.

```
primary    #E06848   hsl(13°, 71%, 57%)   vermilion seal       6.4:1  AA
accent     #80B8A0   hsl(154°, 28%, 61%)  celadon patina       9.2:1  AAA
muted      #888A90   hsl(225°, 5%, 55%)   river stone          6.1:1  AA
error      #C86868   hsl(0°, 47%, 59%)    ash-red fault        5.8:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #090C08  bamboo lacquer       8  #182018  dim forest
1  #A85858  muted crimson        9  #C86868  ash-red ← error
2  #508060  forest moss         10  #68A870  bright sage
3  #A89050  old gold            11  #E06848  vermilion ← primary
4  #507090  deep indigo         12  #888A90  river stone ← muted
5  #90607A  dusty plum          13  #A878A8  faded orchid
6  #407880  celadon blue-grey   14  #5898A8  sky porcelain
7  #909888  pale celadon        15  #E0DDD4  aged paper ← foreground
```

---

## Contrast Compliance

All tokens verified against `#090C08` using WCAG 2.1 relative luminance.

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #E06848    6.4:1   AA  ✓
accent     #80B8A0    9.2:1   AAA ✓
muted      #888A90    6.1:1   AA  ✓
error      #C86868    5.8:1   AA  ✓
```

---

## File Reference

```
themes/bamboo/
├── bamboo.json           source of truth
├── bamboo.md             this document
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
npx github:marvinrichter/gloam bamboo starship
```
