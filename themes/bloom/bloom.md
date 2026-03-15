# Bloom — Design System

> pale roses pressed between book pages — blush petals drying on cream paper

---

## Concept

Bloom is the lightest theme in the collection — a true light theme built around the colour of pressed rose petals: pale blush background with deep crimson-rose primary. The background is barely-pink white, the colour of paper that has absorbed traces of dried rose oil. The primary is deep carmine-rose: the colour of the petal itself, not its reflection. The accent is dark plum-violet — the colour of a dried rose stem, giving the palette depth and age.

| Decision | Reasoning |
|---|---|
| Background `#FFF0F0` | Barely-pink white. Paper that has been near rose petals for a long time. |
| Foreground `#2A1420` | Deep wine-black. Ink on rose-tinted paper. |
| Primary `#7A1840` | Deep carmine-rose. The pressed petal — rich, dark, not sweet. |
| Accent `#5A2080` | Dark plum-violet. The colour of a dried stem. Age and depth. |
| Muted `#7A5868` | Dusty rose-grey. The colour of the paper where the petal touched it. |

---

## Color System

### Semantic tokens

All tokens verified against background `#FFF0F0`.

```
primary    #7A1840   hsl(340°, 65%, 29%)  carmine rose         9.0:1  AAA
accent     #5A2080   hsl(277°, 60%, 31%)  dried plum           9.2:1  AAA
muted      #7A5868   hsl(340°, 17%, 42%)  rose-grey            5.1:1  AA
error      #8A1020   hsl(354°, 77%, 29%)  deep crimson         8.7:1  AAA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #1A0810  deep wine-black      8  #3A2030  dim rosewood
1  #7A2020  dark crimson         9  #8A1020  deep crimson ← error
2  #286020  dark forest green   10  #386028  bright forest
3  #705A10  dark amber           11  #7A1840  carmine rose ← primary
4  #28287A  dark navy            12  #7A5868  rose-grey ← muted
5  #58285A  dark violet          13  #703888  plum
6  #1A5058  dark teal            14  #285878  slate blue
7  #D8B8C0  pale rose-grey       15  #F8E8F0  near-white blush ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #7A1840    9.0:1   AAA ✓
accent     #5A2080    9.2:1   AAA ✓
muted      #7A5868    5.1:1   AA  ✓
error      #8A1020    8.7:1   AAA ✓
```

---

## File Reference

```
themes/bloom/
├── bloom.json           source of truth
├── bloom.md             this document
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
npx github:marvinrichter/gloam bloom starship
```
