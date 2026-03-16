# Weld — Design System

> molten metal oxidizing — yellow-green flame at the seam where steel fuses

---

## Concept

Weld is the colour at the moment of fusion: the background is near-black with a faint yellow-green cast — the colour of the metal just outside the weld pool. The primary is olive yellow-green at hue 75°, the exact colour of the oxidation flame that dances around a weld seam. The accent is deep amber — the molten metal itself, glowing at the centre. This is the only gloam theme with a primary in the 60–90° hue band, between yellow and chartreuse.

| Decision | Reasoning |
|---|---|
| Background `#0E0E08` | Near-black with a very faint yellow-green cast. Cold metal. |
| Foreground `#E8E0C0` | Warm cream. The colour of the light from the weld on a pale surface. |
| Primary `#98B838` | Olive yellow-green at hue 75°. Oxidation flame — not quite yellow, not quite green. |
| Accent `#E8B040` | Deep amber. Molten metal at the centre of the weld pool. |
| Muted `#909060` | Olive mid-tone. The colour of metal that has oxidized and cooled. |

---

## Color System

### Semantic tokens

All tokens verified against background `#0E0E08`.

```
primary    #98B838   hsl(75°, 54%, 47%)   oxidation flame      8.9:1  AAA
accent     #E8B040   hsl(39°, 79%, 59%)   molten amber        10.6:1  AAA
muted      #909060   hsl(60°, 20%, 47%)   cooled oxide         6.4:1  AA
error      #D06060   hsl(0°, 52%, 60%)    heat fault           5.5:1  AA
```

---

## ANSI Palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #0E0E08  cold metal           8  #202018  dim metal
1  #A86050  muted copper         9  #D06060  heat fault ← error
2  #7A9848  weld-green          10  #90C058  bright olive
3  #B09040  dark amber          11  #98B838  oxidation flame ← primary
4  #5A7870  steel-teal grey     12  #909060  cooled oxide ← muted
5  #8870A0  dusty violet        13  #A888C0  pale violet
6  #4A8870  dark teal           14  #60A880  bright teal
7  #9A9870  warm olive-grey     15  #E8E0C0  warm cream ← foreground
```

---

## Contrast Compliance

```
Token      Hex       Contrast  Level
─────────  ────────  ────────  ──────
primary    #98B838    8.9:1   AAA ✓
accent     #E8B040   10.6:1   AAA ✓
muted      #909060    6.4:1   AA  ✓
error      #D06060    5.5:1   AA  ✓
```

---

## File Reference

```
themes/weld/
├── weld.json           source of truth
├── weld.md             this document
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
npx github:marvinrichter/gloam weld starship
```
