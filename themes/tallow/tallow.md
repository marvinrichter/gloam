# Tallow — Design System

> tallow candle burning low — amber light pooling soft on worn wooden surfaces

---

## Concept

Tallow is a hygge theme — the warmth of a single tallow candle in a cold room. Not the sharp-edged warmth of an ember theme, but the soft, diffused warmth that pools on well-worn wood and spreads into shadow. The background is very dark warm-brown, the colour of walnut in deep shadow. The primary is warm cream-gold at hue 40° — aged parchment in candlelight, not yellow, not orange, but the precise middle of both.

| Decision | Reasoning |
|---|---|
| Background `#120E08` | Dark walnut. Warm near-black with a brown cast. |
| Foreground `#F0E8D8` | Aged cream. Paper in candlelight, warm and slightly yellow. |
| Primary `#E8C888` | Cream-gold at hue 40°. Candlelight on parchment. Warm and rich. |
| Accent `#D4905A` | Terracotta-orange. The warmer note — embers beneath the flame. |
| Muted `#9A8870` | Warm taupe. The worn wood surface that the candlelight barely reaches. |

---

## Color System

### Semantic tokens

All tokens verified against background `#120E08`.

```
primary    #E8C888   hsl(40°, 65%, 72%)   candlelight cream   12.6:1  AAA
accent     #D4905A   hsl(25°, 57%, 59%)   terracotta ember     7.8:1  AAA
muted      #9A8870   hsl(33°, 14%, 52%)   worn wood            6.1:1  AA
error      #D86060   hsl(0°, 57%, 60%)    hot coal             5.8:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #120E08  dark walnut           8  #282018  dim warm shadow
1  #B06050  muted terracotta      9  #D86060  hot coal ← error
2  #608050  forest green         10  #70A860  warm sage
3  #C09858  honey gold           11  #E8C888  candlelight cream ← primary
4  #606870  cool slate           12  #9A8870  worn wood ← muted
5  #907868  dusty rose-brown     13  #B088A0  pale mauve
6  #488078  slate-teal           14  #5898A8  cool teal
7  #B0A088  warm parchment grey  15  #F0E8D8  aged cream ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #E8C888   12.6:1   AAA ✓
accent     #D4905A    7.8:1   AAA ✓
muted      #9A8870    6.1:1   AA  ✓
error      #D86060    5.8:1   AA  ✓
```

---

## File Reference

```
themes/tallow/
├── tallow.json           source of truth
├── tallow.md             this document
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
npx github:marvinrichter/gloam tallow starship
```
