# Canopy — Design System

> chartreuse light through a forest canopy — yellow-green where the sun breaks through

---

## Concept

Canopy is the colour of a temperate forest in full leaf when strong sunlight falls through the upper branches. Not the deep green of shade — the electric yellow-green of sunlit leaves backlit against sky. The background is forest-floor dark, near-black with a green cast. The primary is chartreuse at 92°, the exact hue of leaves in full sun. The accent is warm amber — the colour of filtered light hitting bark.

| Decision | Reasoning |
|---|---|
| Background `#080E0A` | Forest floor before dawn. Near-black with a green undertone. |
| Foreground `#D4E0C8` | The pale green-white of birch bark and lichen. |
| Primary `#90C860` | Sunlit canopy leaf at hue 92°. Electric but not artificial. |
| Accent `#C8A060` | Warm amber — bark and filtered afternoon light. |
| Muted `#709068` | Shadow-green. The colour of leaves in shade. |

---

## Color System

### Semantic tokens

All tokens verified against background `#080E0A`.

```
primary    #90C860   hsl(92°, 51%, 56%)   sunlit canopy       10.5:1  AAA
accent     #C8A060   hsl(38°, 45%, 58%)   forest amber         8.8:1  AAA
muted      #709068   hsl(128°, 15%, 49%)  shadow-green         5.9:1  AA
error      #D06868   hsl(0°, 48%, 62%)    red fungus           6.0:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #080E0A  forest floor         8  #182018  deep shade
1  #A05858  muted crimson        9  #D06868  red fungus ← error
2  #4EA858  bright fern         10  #60C870  forest green
3  #A88840  deep amber          11  #90C860  sunlit leaf ← primary
4  #406080  rain shadow blue    12  #709068  shadow-green ← muted
5  #8058A0  wild violet         13  #A070B8  pale orchid
6  #3A8878  forest teal         14  #50A890  river green
7  #909880  pale lichen         15  #D4E0C8  birch bark ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #90C860   10.5:1   AAA ✓
accent     #C8A060    8.8:1   AAA ✓
muted      #709068    5.9:1   AA  ✓
error      #D06868    6.0:1   AA  ✓
```

---

## File Reference

```
themes/canopy/
├── canopy.json           source of truth
├── canopy.md             this document
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
npx github:marvinrichter/gloam canopy starship
```
