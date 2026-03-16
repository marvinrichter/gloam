# Stark — Design System

> maximum clarity — pure contrast for those who need every pixel to count

---

## Concept

Stark is the high-contrast light theme for operators who need signal over style. Pure white background. Pure black foreground. No warmth, no softness, no atmosphere. The primary is deep navy at hue 226° — the definitive "official" blue, the colour of technical documentation, maritime charts, and engineering drawings. It is not a colour that asks for attention; it earns it through clarity.

| Decision | Reasoning |
|---|---|
| Background `#FFFFFF` | Pure white. No deviation. Maximum available contrast. |
| Foreground `#000000` | Pure black. The typographic baseline. |
| Primary `#001A8C` | Deep navy at hue 226°. Technical, authoritative, readable. |
| Accent `#8C3000` | Burnt sienna. The print-era "second colour" — maps, annotations, emphasis. |
| Muted `#3A3A3A` | Dark grey. Secondary text at high contrast without full black. |

---

## Color System

### Semantic tokens

All tokens verified against background `#FFFFFF`.

```
primary    #001A8C   hsl(226°, 100%, 28%)  deep navy          14.0:1  AAA
accent     #8C3000   hsl(20°, 100%, 28%)   burnt sienna        8.2:1  AAA
muted      #3A3A3A   hsl(0°, 0%, 23%)      dark grey          10.9:1  AAA
error      #8C0000   hsl(0°, 100%, 28%)    deep crimson        9.8:1  AAA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #000000  pure black           8  #444444  dark grey
1  #880000  dark red             9  #8C0000  deep crimson ← error
2  #005500  dark green          10  #007700  bright green
3  #885500  dark amber          11  #001A8C  deep navy ← primary
4  #000088  dark blue           12  #3A3A3A  dark grey ← muted
5  #880088  dark magenta        13  #9900AA  bright magenta
6  #008888  dark teal           14  #0077AA  bright teal
7  #888888  mid grey            15  #FFFFFF  pure white ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #001A8C   14.0:1   AAA ✓
accent     #8C3000    8.2:1   AAA ✓
muted      #3A3A3A   10.9:1   AAA ✓
error      #8C0000    9.8:1   AAA ✓
```

---

## File Reference

```
themes/stark/
├── stark.json           source of truth
├── stark.md             this document
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
npx github:marvinrichter/gloam stark starship
```
