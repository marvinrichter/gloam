# Solano — Design System

> A terminal prompt and color theme for a Mediterranean coastline at midday.

---

## Concept

Solano places you on a whitewashed terrace above the Adriatic at noon — the stone walls sun-bleached to warm off-white, roof tiles in deep burnt sienna, the sea below at its most saturated cobalt. Not the blue of morning or evening: the specific blue of the Mediterranean at the hour when the sun is directly overhead and there is no shade.

The name comes from the hot easterly wind of the Spanish and Italian coasts — dry, warm, carrying heat from the interior.

Every design decision maps to that moment:

| Decision | Reasoning |
|---|---|
| Background `#F5EDE0` | Sun-heated stone — not paper-white or cream, but warm off-white with a strong orange cast, the color of Istrian limestone at noon. |
| Foreground `#2A1C10` | Deep terracotta dark — the color of iron-rich soil in the shade of a doorway. |
| Primary `#782010` | Burnt terracotta — the deep warm red of traditional roof tiles. Navigation is the structure you move through. |
| Accent `#1A4A7A` | Adriatic cobalt — the deep, saturated blue of the open sea at the horizon. Git status and the cursor carry the water's authority. |
| Muted `#7A5C40` | Driftwood and weathered cedar — the warm neutral of old shutters. Chrome fades to the surface of things left in the sun. |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against background `#F5EDE0`. Contrast is measured as **dark token against light background**.

```
primary    #782010   hsl(9°, 71%, 28%)    burnt terracotta     8.1:1  AAA
accent     #1A4A7A   hsl(213°, 65%, 29%)  Adriatic cobalt      7.1:1  AAA
muted      #7A5C40   hsl(30°, 32%, 36%)   driftwood tan        4.9:1  AA
error      #8B1A2A   hsl(351°, 69%, 32%)  deep cardinal        7.6:1  AAA
```

### Assignment rules

```
[ ~/path ][ branch ~2 +1 ]∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿[☀ 14:32]
     ↑         ↑      ↑   ↑             ↑   ↑
  primary     accent accent muted dim   muted muted
›
↑
accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules use `primary` — they are navigation-tier, the warm walls you move through. Command duration uses `muted dim`.

### Why only four tokens?

```
High attention:  accent  — git status, prompt character, cursor (Adriatic blue)
Medium:          primary — where you are, what language you are in (terracotta)
Low:             muted   — what time it is, chrome (driftwood)
Exception:       error   — danger (cardinal)
```

In a light theme, hierarchy is darkness. `primary` at 8.1:1 is the deepest authoritative warm color. `accent` at 7.1:1 is the contrasting cool element — the sea against the land.

---

## ANSI Palette

### Light theme ANSI philosophy

Every ANSI color must be dark enough to read against the light background. ANSI 15 (bright white) becomes a near-background warm white rather than a bright foreground. The foreground `#2A1C10` is set via the terminal Foreground Color slot directly.

All 16 ANSI colors are dark enough to display legibly on `#F5EDE0`.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#180A04` | terminal black = deep warm dark | warm near-black |
| ANSI 8 (bright black) | `#4A3828` | comments, dim text | dark warm slate |
| ANSI 11 (bright yellow) | `#782010` | **= primary** | primary token |
| ANSI 12 (bright blue) | `#7A5C40` | **= muted** | muted token |
| ANSI 13 (bright magenta) | `#1A4A7A` | **= accent** | accent token |
| ANSI 15 (bright white) | `#F8F0E8` | near-background warm white | background lightened |
| ANSI 9 (bright red) | `#8B1A2A` | **= error** | error token |
| ANSI 10 (bright green) | `#2C7038` | success, additions | deep olive-green, palette-derived |

### Full palette

```
Normal                              Bright
──────────────────────────────────  ──────────────────────────────────────────
0  #180A04  deep warm dark           8  #4A3828  dark warm slate
1  #642020  muted crimson            9  #8B1A2A  cardinal red ← error
2  #1C5024  dark forest green       10  #2C7038  olive green
3  #5A3008  deep amber-brown        11  #782010  burnt terracotta ← primary
4  #183070  deep cobalt-navy        12  #7A5C40  driftwood tan ← muted
5  #482860  dark violet             13  #1A4A7A  Adriatic cobalt ← accent
6  #185060  deep teal               14  #2C7080  sea teal
7  #706050  warm mid-gray           15  #F8F0E8  warm near-white
```

### UI color slots

```
Background     #F5EDE0  sun-heated stone white
Foreground     #2A1C10  deep terracotta dark
Bold           #180A04  deepest warm dark — weight + authority
Cursor         #1A4A7A  Adriatic cobalt — the precise navigation point
Cursor text    #F5EDE0  background inside cursor block
Selection      #DDD0BC  warm stone highlight
Selected text  #2A1C10  foreground on selection
Links          #1A4A7A  cobalt — accent token, distinct from body text
```

---

## Prompt Anatomy

### Layout

```
[ ~/gloam ][ main ~2 +1 ]∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿[☀ 14:32]
›
```

Single line. No box frame — the open Mediterranean sky has no walls overhead.

### Structural elements

```
·   U+00B7  replaced by:
∿   U+223F  SINE WAVE  (fill — heat shimmer over hot stone)
☀   U+2600  BLACK SUN WITH RAYS  (time prefix — the noon sun overhead)
›   U+203A  SINGLE RIGHT-POINTING ANGLE QUOTATION MARK  (success cursor)
‹   U+2039  SINGLE LEFT-POINTING ANGLE QUOTATION MARK  (vim normal mode)
```

`∿` (the sine wave) evokes the heat shimmer visible over sun-heated surfaces at midday — a visual oscillation between the information clusters and the clock. At small sizes it reads as a wave or undulation.

`☀` is the noon sun. It appears before the clock and slow command durations: both are observations of time passing under the open sky.

### Module order and rationale

```
[navigation] [git] [languages] [performance] ∿∿∿ [☀ time]
[cursor]
```

The username is omitted — at the coast, the landscape does not name you.

### Spacing

```toml
format = "[ $path ]($style)"
```

One character of breathing room on each side.

---

## Light Theme Notes

### How this works with syntax highlighters

Solano is a warm-toned light theme. Most syntax highlighters assume a dark background:

- **ANSI 0 (black)** is deep warm `#180A04` — operators and punctuation appear near-black on warm white. Readable and warm.
- **ANSI 15 (bright white)** is `#F8F0E8` — near-background, not pure white. Fills are imperceptible against the background.
- **ANSI 7 (white)** is the warm mid-gray `#706050` — muted blue-gray on warm white. Readable and warm.

### Screen environments

Solano performs best in **warm-light conditions** — south-facing windows, incandescent or warm LED environments, displays with warm color temperature settings. On cool (blue-shifted) uncalibrated displays, the warm cast of the background may look more neutral than intended. The theme performs at all brightness levels but is strongest at 60–80%.

### Bold text

In iTerm2: disable "Use bright colors for bold text" (`Preferences › Profiles › Text`). Bold text must be darker, not lighter. The Bold Color slot (`#180A04`) handles this correctly when the option is off.

---

## Typography

Solano is designed around **JetBrains Mono Nerd Font**.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular
Size:         13pt
Line spacing: 1.1
```

## Visual Hierarchy

```
BOLD     directory path          the terrace wall — the structure you are inside
REGULAR  git branch, languages   the view — contextual, directional
DIM      chrome, time, duration  the heat haze — ambient, barely there
```

`dim` is applied via `"fg:muted dim"`. In a light theme, `dim` reduces the opacity of an already-receding token — the driftwood fades into warm stone.

---

## Interaction States

### Success (exit 0)

```
›
↑
fg:accent  (Adriatic cobalt — the horizon is clear water)
```

### Error (exit ≠ 0)

```
›
↑
fg:error  (cardinal red — the coast guard signal)
```

### Vim normal mode

```
‹
↑
fg:primary  (burnt terracotta — the solid wall, not moving forward)
```

### Slow command (> 2s)

```
[ ~/path ][ branch ] ∿∿∿∿∿∿∿∿∿∿∿∿∿∿ [☀ 3.2s]  [☀ 14:32]
```

Duration styled `fg:muted dim`. Threshold is 2000ms.

---

## Contrast Compliance

All tokens verified against background `#F5EDE0`. Contrast measured as dark token against light background.

```
Background luminance: 0.861

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #782010   0.063       8.1:1    AAA ✓
accent     #1A4A7A   0.079       7.1:1    AAA ✓
muted      #7A5C40   0.138       4.9:1    AA  ✓
error      #8B1A2A   0.069       7.6:1    AAA ✓
fg         #2A1C10   0.020      14.0:1    AAA ✓
bold       #180A04   0.005      17.5:1    AAA ✓
```

`primary`, `accent`, and `error` reach AAA — each must be unambiguous in bright Mediterranean sunlight. `muted` passes AA — it is the surface of things left in the sun, always slightly receding.

---

## File Reference

```
themes/solano/
├── solano.json            source of truth
├── solano.md              this document
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
palette = "solano"

[palettes.solano]
primary = "#782010"
accent  = "#1A4A7A"
muted   = "#7A5C40"
error   = "#8B1A2A"
```

---

## Install

```bash
# Font — required for all targets
brew install --cask font-jetbrains-mono-nerd-font
```

### Starship

```bash
npx github:marvinrichter/gloam solano starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/solano/iterm2.itermcolors`
3. `Color Presets ▾` → select `solano`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

**Light theme:** Disable "Use bright colors for bold text" (`Preferences › Profiles › Text`).

### Alacritty

```bash
npx github:marvinrichter/gloam solano alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam solano kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam solano wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam solano ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam solano windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam solano vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam solano neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme solano")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/solano/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam solano zed
```

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string (before `$cmd_duration`)
2. Configure with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. Verify the color reads as darker than the background — all tokens must be darker than the stone.

### Changing the base hue

The palette hue is 9° (terracotta), 213° (cobalt), 30° (driftwood), 351° (cardinal). To shift toward a cooler coastal variant — the stone at dusk rather than noon — push the background toward `#E8EEF0` and cool the primary toward hsl 20° brown.

---

## Design Notes

### Primary / accent hue gap

Primary `#782010` (hsl 9°) and accent `#1A4A7A` (hsl 213°) are 204° apart — one of the widest warm/cool splits in the gloam collection. This maximum separation is intentional: terracotta walls and deep sea must be immediately distinguishable. On warm-shifted or uncalibrated displays, the cobalt accent may read as dark blue rather than vibrant cobalt — verify on your hardware.

### Cross-collection note (Solano / Parchment / Daybook)

Solano (`#F5EDE0`) and Parchment (`#E8D6B4`) are both warm light themes but occupy different territory: Parchment is aged vellum with warm brown primary; Solano is sun-heated stone with terracotta primary and cobalt accent. The primary hues are 21° apart (Solano 9° vs Parchment 30°), placing them in perceptually distinct warm sub-families.
