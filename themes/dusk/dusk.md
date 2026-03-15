# Dusk — Design System

> civil twilight — the exact moment the sky becomes indeterminate between day and night

---

## Concept

Dusk is a mid-tone dark theme built around the blue-violet hour — not the deep indigo of full night (that is Eventide), but the slate-lavender moment when the sky still holds the memory of colour. The background is a medium-dark indigo-grey, noticeably lighter than most gloam dark themes. The primary is dusty lavender-purple at hue 296°, the exact colour of the sky at this transition. The accent is warm amber — the last orange-gold light on the horizon, complementary to the lavender sky.

| Decision | Reasoning |
|---|---|
| Background `#282834` | Medium-dark slate. Not as dark as most dark themes — this is twilight, not midnight. |
| Foreground `#C8C4BC` | Warm grey-cream. Aged paper seen in dim light. |
| Primary `#C490C8` | Dusty lavender-purple at hue 296°. The sky colour in the blue-violet hour. |
| Accent `#E8A860` | Warm amber. The last orange-gold light on the horizon. |
| Muted `#9098A8` | Blue-grey. The colour of slate rooftops at dusk. |

---

## Color System

### Semantic tokens

All tokens verified against background `#282834`.

```
primary    #C490C8   hsl(296°, 37%, 67%)  dusk lavender        5.6:1  AA
accent     #E8A860   hsl(36°, 76%, 65%)   horizon amber        7.1:1  AAA
muted      #9098A8   hsl(220°, 13%, 62%)  slate rooftop        5.0:1  AA
error      #DC7878   hsl(0°, 56%, 66%)    fading crimson       4.9:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #282834  slate dusk           8  #3A3A48  dim slate
1  #A87070  muted rose           9  #DC7878  fading crimson ← error
2  #608870  sage green          10  #70B878  bright sage
3  #A89868  warm tan            11  #C490C8  dusk lavender ← primary
4  #6880A8  cool cobalt         12  #9098A8  slate roof ← muted
5  #9068A0  deep violet         13  #A880C0  pale orchid
6  #488898  cool teal           14  #60A8C0  bright teal
7  #A0A0A0  mid grey            15  #C8C4BC  warm grey-cream ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #C490C8    5.6:1   AA  ✓
accent     #E8A860    7.1:1   AAA ✓
muted      #9098A8    5.0:1   AA  ✓
error      #DC7878    4.9:1   AA  ✓
```

---

## File Reference

```
themes/dusk/
├── dusk.json           source of truth
├── dusk.md             this document
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
npx github:marvinrichter/gloam dusk starship
```
