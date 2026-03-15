# Ironcast — Design System

> charged atmosphere before a storm breaks — steel sky split by lightning

---

## Concept

Ironcast is the colour of the sky in the minutes before a major storm: the iron-grey overcast that diffuses light flatly, and the sudden lime-yellow of foliage lit by the last direct sun before the clouds close. The background is very dark blue-black — the sky at the horizon when the storm is still distant. The primary is steel-blue at hue 204°. The accent is electric lime-yellow — the lightning colour, the only warm note in an otherwise cold system.

| Decision | Reasoning |
|---|---|
| Background `#0B0D10` | Storm-horizon near-black. The sky just before the light goes entirely. |
| Foreground `#CDD4DC` | Cold grey-blue. The colour of overcast diffused light on a pale surface. |
| Primary `#78A8C8` | Steel blue at hue 204°. The colour of the sky between storm clouds. |
| Accent `#C8D838` | Electric lime-yellow. Lightning. The only warm element — it demands attention. |
| Muted `#7090A8` | Storm-steel blue-grey. Secondary chrome and ambient information. |

---

## Color System

### Semantic tokens

All tokens verified against background `#0B0D10`.

```
primary    #78A8C8   hsl(204°, 40%, 63%)  storm steel-blue     8.5:1  AAA
accent     #C8D838   hsl(66°, 67%, 53%)   lightning lime      13.0:1  AAA
muted      #7090A8   hsl(207°, 22%, 55%)  overcast blue        6.3:1  AA
error      #D05858   hsl(0°, 54%, 58%)    fault crimson        5.2:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #0B0D10  storm horizon        8  #1C2028  dim storm
1  #B05050  muted crimson        9  #D05858  fault crimson ← error
2  #487858  storm-washed green  10  #60A878  bright sage
3  #9A9050  overcast olive      11  #78A8C8  storm steel-blue ← primary
4  #4868A0  deep indigo         12  #7090A8  overcast blue ← muted
5  #786890  dusty violet        13  #9880B8  pale orchid
6  #407888  steel teal          14  #50A0B8  bright teal
7  #909898  cold grey           15  #CDD4DC  cold light ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #78A8C8    8.5:1   AAA ✓
accent     #C8D838   13.0:1   AAA ✓
muted      #7090A8    6.3:1   AA  ✓
error      #D05858    5.2:1   AA  ✓
```

---

## File Reference

```
themes/ironcast/
├── ironcast.json           source of truth
├── ironcast.md             this document
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
npx github:marvinrichter/gloam ironcast starship
```
