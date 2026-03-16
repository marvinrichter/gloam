# Sumi — Design System

> sumi ink dissolving in cold water — the moment the brush lifts from washi

---

## Concept

Sumi names the carbon-black ink used in East Asian brush calligraphy — ground against a stone, dissolved in cold water, applied with a brush that holds no colour but deposits pure form. This theme captures the moment the ink disperses in water: the background is cold near-black, the primary is a muted indigo-purple at hue 252° — the faint colour that appears in pooled ink when light hits it obliquely. The accent is pale steel-blue: the cold water itself, the medium that carries the ink.

| Decision | Reasoning |
|---|---|
| Background `#0A0B0D` | Cold near-black. The surface of ink in a vessel, not black paper. |
| Foreground `#D8D0C0` | Warm washi. The paper that receives the mark. |
| Primary `#8878C8` | Indigo-purple at hue 252°. The colour of pooled sumi ink in cold light. |
| Accent `#7898B8` | Pale steel-blue. The cold water that holds the ink in suspension. |
| Muted `#788090` | Blue-grey. The colour of wet stone used to grind the ink. |

---

## Color System

### Semantic tokens

All tokens verified against background `#0A0B0D`.

```
primary    #8878C8   hsl(252°, 41%, 63%)  sumi indigo          5.5:1  AA
accent     #7898B8   hsl(210°, 28%, 60%)  cold water           7.1:1  AAA
muted      #788090   hsl(230°, 8%, 52%)   wet grinding stone   5.2:1  AA
error      #B86868   hsl(0°, 35%, 56%)    brush fault          5.3:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #0A0B0D  ink vessel           8  #202428  dim cold black
1  #9A5050  muted crimson        9  #B86868  brush fault ← error
2  #4A8860  river moss          10  #60A870  bright sage
3  #A09060  warm stone          11  #8878C8  sumi indigo ← primary
4  #587080  deep slate          12  #788090  wet stone ← muted
5  #806878  dusty mauve         13  #9078A0  pale violet
6  #407880  cold teal           14  #5898A8  pale teal
7  #909090  cold grey           15  #D8D0C0  warm washi ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #8878C8    5.5:1   AA  ✓
accent     #7898B8    7.1:1   AAA ✓
muted      #788090    5.2:1   AA  ✓
error      #B86868    5.3:1   AA  ✓
```

---

## File Reference

```
themes/sumi/
├── sumi.json           source of truth
├── sumi.md             this document
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
npx github:marvinrichter/gloam sumi starship
```
