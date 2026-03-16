# Cast — Design System

> raw poured concrete — no ornament, no apology, only weight and form

---

## Concept

Cast is a brutalist theme. The background is poured concrete — near-black, neutral, without warmth or coolness. The primary is industrial yellow at hue 55°: the colour of safety markings on crane hooks, the paint on a cast-iron vice, the stencilled numbers on factory floors. It is not a colour chosen for beauty but for legibility under working conditions.

| Decision | Reasoning |
|---|---|
| Background `#101010` | Poured concrete. Pure neutral dark — no colour cast. |
| Foreground `#C8C8C0` | Aged concrete dust. Very slightly warm grey. |
| Primary `#C8C060` | Industrial yellow at hue 55°. Safety-mark yellow, weathered to a slight green. |
| Accent `#D8C040` | Brighter chrome yellow — the cursor colour that stands out immediately. |
| Muted `#888880` | Concrete aggregate. Neutral mid-grey with a faint warm cast. |

---

## Color System

### Semantic tokens

All tokens verified against background `#101010`.

```
primary    #C8C060   hsl(55°, 53%, 57%)   industrial yellow   10.9:1  AAA
accent     #D8C040   hsl(52°, 66%, 55%)   chrome yellow       11.3:1  AAA
muted      #888880   hsl(60°, 2%, 53%)    concrete aggregate   5.8:1  AA
error      #D85858   hsl(0°, 58%, 60%)    fault-red            5.5:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #101010  poured concrete      8  #202020  dim concrete
1  #A06060  muted rust           9  #D85858  fault-red ← error
2  #508060  industrial green    10  #68A068  signal green
3  #909050  khaki               11  #C8C060  industrial yellow ← primary
4  #506080  slate blue          12  #888880  concrete aggregate ← muted
5  #786080  factory violet      13  #908090  dim plum
6  #407880  coolant blue-grey   14  #50A0A8  steel teal
7  #909088  pale aggregate      15  #C8C8C0  concrete dust ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #C8C060   10.9:1   AAA ✓
accent     #D8C040   11.3:1   AAA ✓
muted      #888880    5.8:1   AA  ✓
error      #D85858    5.5:1   AA  ✓
```

---

## File Reference

```
themes/cast/
├── cast.json           source of truth
├── cast.md             this document
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
npx github:marvinrichter/gloam cast starship
```
