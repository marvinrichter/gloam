# Noir — Design System

> a single incandescent bulb swinging in an empty room — everything else is shadow

---

## Concept

Noir is film aesthetics translated into terminal colour: deep near-black, a very restrained warm foreground, and a primary of pale incandescent gold — the colour of a single tungsten bulb in a dark room. Not yellow. Gold. The spectrum of light that exists at the boundary between illuminated and shadow. The muted token is pure neutral grey — no hue, no warmth, no coldness. Everything is stripped back to serve the contrast between light and dark.

| Decision | Reasoning |
|---|---|
| Background `#0A0A0A` | Pure near-black. No colour cast. Shadow is shadow. |
| Foreground `#E8E0D0` | Very slightly warm white. Paper under incandescent light. |
| Primary `#E8D080` | Pale incandescent gold at hue 46°. The colour of the bulb itself. |
| Accent `#E89048` | Amber-orange. The hot centre of the filament. |
| Muted `#909090` | Perfect neutral grey. No hue — pure shadow mid-tone. |

---

## Color System

### Semantic tokens

All tokens verified against background `#0A0A0A`.

```
primary    #E8D080   hsl(46°, 68%, 71%)   incandescent gold   13.4:1  AAA
accent     #E89048   hsl(30°, 77%, 60%)   filament amber       8.4:1  AAA
muted      #909090   hsl(0°, 0%, 56%)     neutral shadow       6.6:1  AA
error      #D05050   hsl(0°, 53%, 57%)    dark crimson         4.9:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #0A0A0A  pure shadow          8  #1A1A1A  dim shadow
1  #A85050  muted crimson        9  #D05050  dark crimson ← error
2  #506848  shadow green        10  #609850  sage
3  #A09050  dark gold           11  #E8D080  incandescent gold ← primary
4  #484858  dim slate           12  #909090  neutral shadow ← muted
5  #786068  dusty mauve         13  #A07880  faded rose
6  #487080  slate teal          14  #5898A8  cool teal
7  #A09888  warm grey           15  #E8E0D0  incandescent white ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #E8D080   13.4:1   AAA ✓
accent     #E89048    8.4:1   AAA ✓
muted      #909090    6.6:1   AA  ✓
error      #D05050    4.9:1   AA  ✓
```

---

## File Reference

```
themes/noir/
├── noir.json           source of truth
├── noir.md             this document
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
npx github:marvinrichter/gloam noir starship
```
