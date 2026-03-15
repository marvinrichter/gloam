# Ochre — Design System

> A terminal prompt and color theme for the first twenty minutes after dawn on a desert mesa.

---

## Concept

Ochre places you at the edge of a red rock mesa at the moment the sun clears the horizon — the stone face catching the first direct light, everything washed in iron-oxide red, the sky above still carrying the deep teal-cyan of pre-dawn blue. Not midday, not sunset: the specific transitional light of early morning in a dry landscape where the rock remembers the previous day's heat.

Every design decision maps to that moment:

| Decision | Reasoning |
|---|---|
| Background `#F2E4D0` | Warm clay — the color of red sandstone at first light, with a distinct reddish-orange cast that separates it from Solano's stone white and Saffron's golden cream. |
| Foreground `#220E08` | Iron-oxide dark — the darkest shadow in a rock face, intensely warm. |
| Primary `#722018` | Iron-oxide red-brown — the dominant color of the mesa face in first light. Deep, saturated, authoritative. |
| Accent `#1A6068` | Dawn sky teal-cyan — the specific hue of sky just before it becomes deep blue, pulled toward green by the atmospheric scattering of early morning. |
| Muted `#705040` | Red dust — the warm muted brown of iron-rich soil at the base of the mesa. |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against background `#F2E4D0`. Contrast is measured as **dark token against light background**.

```
primary    #722018   hsl(5°, 65%, 27%)    iron-oxide red       8.1:1  AAA
accent     #1A6068   hsl(185°, 60%, 25%)  dawn sky teal        5.5:1  AA
muted      #705040   hsl(23°, 27%, 35%)   red dust             5.3:1  AA
error      #7A1828   hsl(355°, 66%, 28%)  deep warning red     7.9:1  AAA
```

### Assignment rules

```
[ ~/path ][ branch ~2 +1 ]··················[◌ 14:32]
     ↑         ↑      ↑   ↑             ↑   ↑
  primary     accent accent muted dim   muted muted
›
↑
accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

### Why only four tokens?

```
High attention:  accent  — git status, prompt character, cursor (dawn teal)
Medium:          primary — where you are, what language you are in (iron-oxide)
Low:             muted   — what time it is, chrome (red dust)
Exception:       error   — danger (warning red)
```

In a light theme, hierarchy is darkness. `primary` at 8.1:1 is the deep iron-oxide red — the mesa itself, authoritative and warm. `accent` at 5.5:1 is the sky — lighter, cooler, contrasting the rock.

---

## ANSI Palette

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#140804` | terminal black = deepest iron-dark | warm near-black |
| ANSI 8 (bright black) | `#4A3020` | comments, dim text | dark warm slate |
| ANSI 11 (bright yellow) | `#722018` | **= primary** | primary token |
| ANSI 12 (bright blue) | `#705040` | **= muted** | muted token |
| ANSI 13 (bright magenta) | `#1A6068` | **= accent** | accent token |
| ANSI 15 (bright white) | `#F5EAD8` | near-background clay white | background lightened |
| ANSI 9 (bright red) | `#7A1828` | **= error** | error token |
| ANSI 10 (bright green) | `#2A6030` | success, additions | dark forest green |

### Full palette

```
Normal                              Bright
──────────────────────────────────  ──────────────────────────────────────────
0  #140804  deepest iron-dark        8  #4A3020  dark warm slate
1  #621818  dark crimson             9  #7A1828  deep warning red ← error
2  #1A4C20  dark forest green       10  #2A6030  forest green
3  #5A3A10  deep ochre-amber        11  #722018  iron-oxide red ← primary
4  #183060  deep teal-navy          12  #705040  red dust ← muted
5  #482050  dark plum-violet        13  #1A6068  dawn sky teal ← accent
6  #185058  deep teal               14  #2A7878  teal-cyan
7  #68503A  warm clay-gray          15  #F5EAD8  clay near-white
```

### UI color slots

```
Background     #F2E4D0  warm clay with reddish tint
Foreground     #220E08  iron-oxide dark
Bold           #140804  deepest iron — weight + dawn together
Cursor         #1A6068  dawn sky teal — the first cool color of morning
Cursor text    #F2E4D0  background inside cursor block
Selection      #D8C4A8  warm stone highlight
Selected text  #220E08  foreground on selection
Links          #1A6068  dawn teal — accent token
```

---

## Prompt Anatomy

### Layout

```
[ ~/gloam ][ main ~2 +1 ]··················[◌ 14:32]
›
```

Single line. No box frame — the open mesa horizon has no enclosure.

### Structural elements

```
·   U+00B7  MIDDLE DOT  (fill — sparse as desert sand, distant as stars not yet faded)
◌   U+25CC  DOTTED CIRCLE  (time prefix — dawn, the circle not yet full)
›   U+203A  SINGLE RIGHT-POINTING ANGLE QUOTATION MARK  (success cursor)
‹   U+2039  SINGLE LEFT-POINTING ANGLE QUOTATION MARK  (vim normal mode)
```

`·` (middle dot) is the sparest fill character in the collection — a single point at a distance, like the last star still visible at dawn. It recedes almost completely into the warm clay background.

`◌` (the dotted circle) is the sun at the moment of rising: the circle is complete but its light has not yet filled it. It appears before the clock and slow command durations — both are measurements of time at the edge of a new day.

### Module order and rationale

```
[navigation] [git] [languages] [performance] ··· [◌ time]
[cursor]
```

The username is omitted — the mesa does not name you.

---

## Light Theme Notes

### Screen environments

Ochre is designed for **warm-light conditions** — early morning, east-facing windows, warm-temperature displays. The reddish clay background is distinct from the other two warm light themes: cooler displays may shift it toward brown-beige, but the warm cast remains identifiable.

### Bold text

In iTerm2: disable "Use bright colors for bold text" (`Preferences › Profiles › Text`). The Bold Color slot (`#140804`) handles bold correctly when the option is off.

---

## Typography

Ochre is designed around **JetBrains Mono Nerd Font**.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular
Size:         13pt
Line spacing: 1.1
```

## Visual Hierarchy

```
BOLD     directory path          the rock face — where the light falls first
REGULAR  git branch, languages   the landscape — context, direction
DIM      chrome, time, duration  the dust — ambient, settling
```

---

## Interaction States

### Success (exit 0)

```
›
↑
fg:accent  (dawn sky teal — the sky is clear, morning begins)
```

### Error (exit ≠ 0)

```
›
↑
fg:error  (deep warning red — the mesa edge is closer than expected)
```

### Vim normal mode

```
‹
↑
fg:primary  (iron-oxide red — the rock face, solid, not moving forward)
```

### Slow command (> 2s)

```
[ ~/path ][ branch ] ·············· [◌ 3.2s]  [◌ 14:32]
```

Duration styled `fg:muted dim`. Threshold is 2000ms.

---

## Contrast Compliance

All tokens verified against background `#F2E4D0`.

```
Background luminance: 0.807

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #722018   0.056       8.1:1    AAA ✓
accent     #1A6068   0.107       5.5:1    AA  ✓
muted      #705040   0.111       5.3:1    AA  ✓
error      #7A1828   0.059       7.9:1    AAA ✓
fg         #220E08   0.011      14.2:1    AAA ✓
bold       #140804   0.003      17.5:1    AAA ✓
```

`primary` and `error` reach AAA. `accent` and `muted` pass AA. `muted` at 5.3:1 is intentionally receding — the red dust is not meant to demand attention.

---

## File Reference

```
themes/ochre/
├── ochre.json             source of truth
├── ochre.md               this document
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
palette = "ochre"

[palettes.ochre]
primary = "#722018"
accent  = "#1A6068"
muted   = "#705040"
error   = "#7A1828"
```

---

## Install

```bash
# Font — required for all targets
brew install --cask font-jetbrains-mono-nerd-font
```

### Starship

```bash
npx github:marvinrichter/gloam ochre starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/ochre/iterm2.itermcolors`
3. `Color Presets ▾` → select `ochre`

**Light theme:** Disable "Use bright colors for bold text" (`Preferences › Profiles › Text`).

### Alacritty

```bash
npx github:marvinrichter/gloam ochre alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam ochre kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam ochre wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam ochre ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam ochre windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam ochre vscode
```

### Neovim

```bash
npx github:marvinrichter/gloam ochre neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme ochre")
```

### IntelliJ / JetBrains IDEs

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/ochre/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam ochre zed
```

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string (before `$cmd_duration`)
2. Configure with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. Verify the color reads as darker than the background.

### Changing the base hue

The palette hue is 5° (iron-oxide), 185° (dawn teal), 23° (red dust), 355° (warning red). To shift toward a cooler, greener dawn variant, push the accent toward 195° and lighten the background toward `#EAE0D0`. To shift toward midday, increase the background brightness and push the primary toward 15° (terracotta territory — see Solano).

---

## Design Notes

### Primary / accent hue gap

Primary `#722018` (hsl 5°) and accent `#1A6068` (hsl 185°) are exactly 180° apart — a complementary pair on the color wheel. Iron-oxide red and dawn teal are opposite in hue, which maximizes their visual separation without forcing a bright high-chroma accent color. The result is a cooler accent than Solano (cobalt 213°) or Saffron (indigo 252°), completing the warm-light accent range: cobalt → indigo → teal.

### Cross-collection note (Ochre / Solano / Parchment)

Ochre primary `#722018` (hsl 5°) vs Parchment primary `#4A2E12` (hsl 30°): gap is 25°, meeting the ≥15° distinctness requirement. Ochre is distinctly redder than Parchment's warm brown. Ochre vs Solano primary `#782010` (hsl 9°): gap is 4° — these two are the closest primary pair in the collection, but they are distinguished by background (Ochre's warm clay vs Solano's stone white) and accent (Ochre's teal vs Solano's cobalt). If switching between these themes, verify by checking the accent color, not the primary.
