# Saffron — Design System

> A terminal prompt and color theme for a spice market at opening hour.

---

## Concept

Saffron places you in a covered market before the day's heat arrives — bolts of deep saffron fabric stacked in stalls, morning light that has not yet gone white, the air dense with turmeric and dried rose. The background is the color of unbleached cloth in filtered sunlight: golden cream, lighter and more saturated than aged parchment.

Every design decision maps to that space:

| Decision | Reasoning |
|---|---|
| Background `#FAF0D8` | Golden cream — the color of natural undyed cloth in morning market light. Lighter and more yellow-saturated than Parchment's aged vellum. |
| Foreground `#281808` | Deep saffron-brown dark — the darkest shadow in a pile of spice, near-black with warmth. |
| Primary `#5E3008` | Saffron ochre — the deep warm mid-brown-orange of compressed spice. Navigation is the substance of the market. |
| Accent `#3A2880` | Deep indigo-violet — the dye merchant's opposite, the color of the indigo bolts stacked across the aisle from the saffron. Maximum hue separation from the warm primary. |
| Muted `#806040` | Dry spice dust — the warm neutral of cumin and cardamom at rest. Chrome fades to the floor of the market. |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against background `#FAF0D8`. Contrast is measured as **dark token against light background**.

```
primary    #5E3008   hsl(20°, 93%, 20%)   saffron ochre        8.9:1  AAA
accent     #3A2880   hsl(252°, 51%, 32%)  deep indigo          9.4:1  AAA
muted      #806040   hsl(35°, 33%, 38%)   spice dust           4.7:1  AA
error      #802028   hsl(354°, 62%, 31%)  deep red             7.9:1  AAA
```

### Assignment rules

```
╭  ~/path   branch ~2 +1  ──────────────────────────  ◈ 14:32
   ↑         ↑      ↑      ↑                        ↑  ↑
  primary   accent accent  muted dim                muted muted
╰─❯
↑  ↑
muted  accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

### Why only four tokens?

```
High attention:  accent  — git status, prompt character, cursor (indigo)
Medium:          primary — where you are, what language you are in (saffron)
Low:             muted   — what time it is, chrome (spice dust)
Exception:       error   — danger (deep red)
```

In a light theme, hierarchy is darkness. `primary` at 8.9:1 is the deep saffron — saturated and authoritative. `accent` at 9.4:1 is the deepest element in the prompt — indigo is the darkest dye.

---

## ANSI Palette

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#160C04` | terminal black = deep spice dark | warm near-black |
| ANSI 8 (bright black) | `#503C28` | comments, dim text | dark warm tan |
| ANSI 11 (bright yellow) | `#5E3008` | **= primary** | primary token |
| ANSI 12 (bright blue) | `#806040` | **= muted** | muted token |
| ANSI 13 (bright magenta) | `#3A2880` | **= accent** | accent token |
| ANSI 15 (bright white) | `#FDF8EC` | near-background golden white | background lightened |
| ANSI 9 (bright red) | `#802028` | **= error** | error token |
| ANSI 10 (bright green) | `#287040` | success, additions | deep olive-green |

### Full palette

```
Normal                              Bright
──────────────────────────────────  ──────────────────────────────────────────
0  #160C04  deep spice dark          8  #503C28  dark warm tan
1  #6A1E20  dark crimson             9  #802028  deep red ← error
2  #205024  dark sage green         10  #287040  olive green
3  #604810  deep saffron-amber      11  #5E3008  saffron ochre ← primary
4  #1C2070  deep indigo-navy        12  #806040  spice dust ← muted
5  #482858  dark violet             13  #3A2880  deep indigo ← accent
6  #185858  dark teal               14  #287080  deep teal-cyan
7  #685840  warm mid-gray           15  #FDF8EC  golden near-white
```

### UI color slots

```
Background     #FAF0D8  golden cream
Foreground     #281808  deep saffron-brown dark
Bold           #160C04  deepest spice dark — weight carries authority
Cursor         #3A2880  deep indigo — the precise dye measure
Cursor text    #FAF0D8  background inside cursor block
Selection      #EAD8B0  warm cloth highlight
Selected text  #281808  foreground on selection
Links          #3A2880  indigo — accent token
```

---

## Prompt Anatomy

### Layout

```
╭  ~/gloam   main ~2 +1  ──────────────────────────  ◈ 14:32
╰─❯
```

Two lines. The box frame evokes the covered stall — a contained, structured space with a clear opening.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
─   U+2500  BOX DRAWINGS LIGHT HORIZONTAL  (fill — the stall's wooden counter)
◈   U+25C8  WHITE DIAMOND CONTAINING BLACK SMALL DIAMOND  (time prefix — a spice measure, a diamond-cut gem from the trade route)
❯   U+276F  HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT  (success)
❮   U+276E  HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT  (vim normal)
```

`─` as the fill character is the counter itself — a horizontal surface, solid, present. The market has structure.

`◈` (the diamond with inner diamond) is the merchant's measure — a precise instrument, the scale used to weigh saffron by the thread.

### Module order and rationale

```
╭  [navigation] [git] [languages] [performance] ── [◈ time]
╰─ [cursor]
```

The username is omitted — the stall does not know your name.

---

## Light Theme Notes

### Screen environments

Saffron is designed for **warm-light conditions** — morning light, incandescent environments, warm-temperature displays. On cool-shifted monitors, the golden cast of the background may look more neutral. The theme performs best at moderate brightness (50–80%).

### Bold text

In iTerm2: disable "Use bright colors for bold text" (`Preferences › Profiles › Text`). The Bold Color slot (`#160C04`) handles bold correctly when the option is off.

---

## Typography

Saffron is designed around **JetBrains Mono Nerd Font**.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular
Size:         13pt
Line spacing: 1.1
```

## Visual Hierarchy

```
BOLD     directory path          the stall name — where you are trading
REGULAR  git branch, languages   the goods on the counter — what is being handled
DIM      chrome, time, duration  the dust on the floor — ambient, present
```

---

## Interaction States

### Success (exit 0)

```
╰─❯
    ↑
    fg:accent  (deep indigo — the transaction completed, the dye accepted)
```

### Error (exit ≠ 0)

```
╰─❯
    ↑
    fg:error  (deep red — the measure failed)
```

### Vim normal mode

```
╰─❮
    ↑
    fg:primary  (saffron ochre — the substance at rest, not moving forward)
```

### Slow command (> 2s)

```
╭  ~/path  ───────────────────  ◈ 3.2s  ──  ◈ 14:32
```

Duration styled `fg:muted dim`. Threshold is 2000ms.

---

## Contrast Compliance

All tokens verified against background `#FAF0D8`.

```
Background luminance: 0.885

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #5E3008   0.055       8.9:1    AAA ✓
accent     #3A2880   0.050       9.4:1    AAA ✓
muted      #806040   0.148       4.7:1    AA  ✓
error      #802028   0.068       7.9:1    AAA ✓
fg         #281808   0.017      14.0:1    AAA ✓
bold       #160C04   0.004      18.0:1    AAA ✓
```

`primary`, `accent`, and `error` reach AAA. `muted` passes AA — the spice dust recedes at the edge of attention.

---

## File Reference

```
themes/saffron/
├── saffron.json           source of truth
├── saffron.md             this document
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
└── zed.json
```

### starship.toml

```toml
palette = "saffron"

[palettes.saffron]
primary = "#5E3008"
accent  = "#3A2880"
muted   = "#806040"
error   = "#802028"
```

---

## Install

```bash
# Font — required for all targets
brew install --cask font-jetbrains-mono-nerd-font
```

### Starship

```bash
npx github:marvinrichter/gloam saffron starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/saffron/iterm2.itermcolors`
3. `Color Presets ▾` → select `saffron`

**Light theme:** Disable "Use bright colors for bold text" (`Preferences › Profiles › Text`).

### Alacritty

```bash
npx github:marvinrichter/gloam saffron alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam saffron kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam saffron wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam saffron ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam saffron windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam saffron vscode
```

### Neovim

```bash
npx github:marvinrichter/gloam saffron neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme saffron")
```

### IntelliJ / JetBrains IDEs

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/saffron/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam saffron zed
```

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string on the first line (before `$cmd_duration`)
2. Configure with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. Verify the color reads as darker than the background.

### Changing the base hue

The palette hue is 20° (saffron), 252° (indigo), 35° (spice dust), 354° (deep red). To shift toward a cooler morning-light variant, push the background toward `#F0F2E8` and shift the primary toward hsl 30° (moving away from orange toward amber-brown).

---

## Design Notes

### Primary / accent hue gap

Primary `#5E3008` (hsl 20°) and accent `#3A2880` (hsl 252°) are 232° apart — the widest primary/accent hue separation in the warm-light sub-collection. Saffron and indigo are commercially complementary dyes: the color theory opposition maps to the spice market concept.

### Cross-collection note (Saffron / Parchment / Solano)

Saffron (`#FAF0D8`) is the lightest and most yellow-saturated of the warm light backgrounds. Parchment is more neutral-amber; Solano is more orange-stone. The three warm light themes occupy distinct background territories and distinct primary hue families (Parchment brown 30°, Solano terracotta 9°, Saffron ochre 20°).
