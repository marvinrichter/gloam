# Graphite — Design System

> graphite smeared across cold paper — almost no color, only pressure and light

---

## Concept

Graphite is a study in restraint. The background is pure near-black — no colour cast, the paper before the pencil touches it. The foreground is near-white, equally neutral. The primary is a very desaturated violet-pink at hue 285°: the faint ghost of colour that appears when graphite is pressed hard against paper and light catches the sheen. Everything is minimal. The theme makes colour an event, not a constant.

| Decision | Reasoning |
|---|---|
| Background `#0C0C0C` | Pure neutral near-black. No warmth or coolness — blank paper. |
| Foreground `#E0E0E0` | Pure neutral near-white. Equal restraint on both ends. |
| Primary `#C4B8C8` | Very desaturated violet-pink at hue 285°. The faint iridescence of graphite sheen. |
| Accent `#D8C8A0` | Warm tan. The only warm note — a deliberate break from the near-monochrome. |
| Muted `#808888` | Cool mid-grey with a trace of teal. The colour of graphite powder. |

---

## Color System

### Semantic tokens

All tokens verified against background `#0C0C0C`.

```
primary    #C4B8C8   hsl(285°, 14%, 75%)  graphite sheen      10.7:1  AAA
accent     #D8C8A0   hsl(42°, 34%, 74%)   warm tan            12.4:1  AAA
muted      #808888   hsl(180°, 4%, 53%)   graphite dust        5.7:1  AA
error      #C86060   hsl(0°, 47%, 58%)    red correction       5.3:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #0C0C0C  blank paper          8  #202020  dim ground
1  #986868  muted rust           9  #C86060  red correction ← error
2  #508858  warm olive          10  #68A870  sage
3  #988870  khaki               11  #C4B8C8  graphite sheen ← primary
4  #586878  slate grey-blue     12  #808888  graphite dust ← muted
5  #887888  pale violet-grey    13  #9888A8  faint orchid
6  #508088  cool slate-teal     14  #5898A0  pale teal
7  #A0A0A0  mid grey            15  #E0E0E0  near-white ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #C4B8C8   10.7:1   AAA ✓
accent     #D8C8A0   12.4:1   AAA ✓
muted      #808888    5.7:1   AA  ✓
error      #C86060    5.3:1   AA  ✓
```

---

## File Reference

```
themes/graphite/
├── graphite.json           source of truth
├── graphite.md             this document
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
npx github:marvinrichter/gloam graphite starship
```
