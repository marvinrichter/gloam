# Nacreous — Design System

> A terminal prompt and color theme for the rarest sky phenomenon on earth.

---

## Concept

Nacreous clouds form 15–25 km above the polar surface, in the lower stratosphere, at temperatures below −78°C. They appear only in winter, only above 60°N, and only in the hour before sunrise or after sunset when the sun sits just below the horizon and illuminates the clouds from below while the ground is still dark. The colors — iridescent teal-green shifting to pink, layered like oil on cold water — are caused by ice crystals diffracting light, each wavelength bent at a slightly different angle.

They are sometimes called mother-of-pearl clouds. The name is exact: the same physical process that makes nacre iridescent also makes nacreous clouds iridescent. Ice crystals in the stratosphere, ordered into thin sheets by laminar flow, diffract visible light across the full spectrum simultaneously.

| Decision | Reasoning |
|---|---|
| Background `#0B0C10` | The polar night just before the display appears. Not pure black — a trace of blue from the ice-reflected sky. |
| Foreground `#E4E8F0` | The pale neutral sky between the colored bands. Clear, cold, precise. |
| Primary `#78D8C8` | The dominant iridescent teal-green of the clouds at maximum display intensity. The direction you are navigating holds that luminous certainty. |
| Accent `#E890C8` | The complementary nacreous pink-rose, the shift at the cloud edges. Git status and cursor hold the color at the edge of the spectrum. |
| Muted `#8888A8` | Ice fog between the observer and the display — the haze that softens the geometry while still transmitting the light. |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against background `#0B0C10`.

```
primary    #78D8C8   hsl(174°, 53%, 66%)   nacreous teal-green  11.7:1  AAA
accent     #E890C8   hsl(315°, 66%, 73%)   nacreous pink         8.6:1  AAA
muted      #8888A8   hsl(240°, 11%, 60%)   ice fog               5.7:1  AA
error      #E06868   hsl(  0°, 63%, 64%)   warning red           5.9:1  AA
```

### Assignment rules

```
╭  marvin  ~/path   branch ~2 +1  ················  ✧ 14:32
   ↑        ↑        ↑      ↑      ↑               ↑  ↑
   muted    primary  accent accent  muted          muted muted
╰─⟫
↑  ↑
muted  accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules use `primary` — they are navigation-tier information, the teal layer you are moving through. Command duration uses `muted dim` — the ice fog, ambient and softening.

### Why only four tokens?

A nacreous display has exactly three spectral zones: the dominant teal-green, the complementary pink at the edges, and the neutral gray-blue sky between. Four tokens map to that structure with one exception state:

```
High attention:  accent  — git status, prompt character, cursor (nacreous pink)
Medium:          primary — where you are, what language (iridescent teal)
Low:             muted   — who you are, what time it is (ice fog)
Exception:       error   — the instrument reading is outside the observed range
```

---

## ANSI Palette

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#0B0C10` | terminal black = background | background |
| ANSI 8 (bright black) | `#181C28` | comments, dim text | background + blue lift |
| ANSI 10 (bright green) | `#78D8C8` | **= primary** | primary token |
| ANSI 12 (bright blue) | `#8888A8` | **= muted** | muted token |
| ANSI 13 (bright magenta) | `#E890C8` | **= accent** | accent token |
| ANSI 15 (bright white) | `#E4E8F0` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#E06868` | **= error** | error token |
| ANSI 14 (bright cyan) | `#68C8E0` | strings, links | cold polar cyan |

### Full palette

```
Normal                              Bright
──────────────────────────────────  ──────────────────────────────────────────
0  #0B0C10  polar night              8  #181C28  ice-dark near-black
1  #805868  dark polar rose          9  #E06868  warning red ← error
2  #408880  dark teal                10  #78D8C8  nacreous teal-green ← primary
3  #8898A8  icy muted slate          11  #B0C890  pale spring-green
4  #385880  dark polar blue         12  #8888A8  ice fog ← muted
5  #705888  dark stratospheric      13  #E890C8  nacreous pink ← accent
6  #387890  dark polar cyan         14  #68C8E0  cold polar cyan
7  #8888A8  ice fog gray-blue        15  #E4E8F0  pale sky ← foreground
```

### UI color slots

```
Background     #0B0C10  polar night
Foreground     #E4E8F0  pale neutral sky
Bold           #E4E8F0  same as foreground
Cursor         #E890C8  nacreous pink — accent
Cursor text    #0B0C10  background inside cursor block
Selection      #181C28  deep polar dark highlight
Selected text  #E4E8F0  foreground on selection
Links          #78D8C8  nacreous teal — primary token
```

---

## Prompt Anatomy

### Layout

```
╭  marvin  ~/gloam   main ~2 +1  ················  ✧ 14:32
╰─⟫
```

Two lines. The first carries all information. The second is the cursor line — the precise instrument reading.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
⁞   U+205E  VERTICAL FOUR DOTS  (fill — diffraction pattern bands)
✧   U+2727  WHITE FOUR POINTED STAR  (time prefix — a crystallographic point)
⟫   U+27EB  MATHEMATICAL RIGHT DOUBLE ANGLE BRACKET  (success cursor)
⟪   U+27EA  MATHEMATICAL LEFT DOUBLE ANGLE BRACKET  (vim normal mode)
```

`✧` (the four-pointed star) represents a diffraction spike — the geometric artifact produced by crystalline structures in strong light. It appears before time and slow command durations: both are observations of a phenomenon at a precise moment.

The fill character `⁞` (four vertical dots) evokes the ordered banding of a diffraction pattern — the interference fringes that nacreous ice clouds produce in polarized light. It reads as structural rhythm between content and time, without introducing a new visual token.

`⟫` and `⟪` are double angle brackets — the geometry of diffraction, a layered fold in the light's path. The symmetry maps to mode semantics (forward/backward).

### Module order and rationale

```
╭  [identity] [navigation] [git] [languages] [performance] ·· [✧ time]
╰─ [cursor]
```

Left to right: who → where → what state → what's installed → how long.

### Spacing

```toml
format = "[ $path ]($style)"
```

One character of breathing room on each side.

---

## Typography

Nacreous is designed around **JetBrains Mono Nerd Font**.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular
Size:         13pt
Line spacing: 1.1
```

## Visual Hierarchy

```
BOLD     directory path          the dominant teal band
REGULAR  git branch, languages   the complementary layers
DIM      chrome, time, duration  the ice fog between
```

`dim` is applied via `"fg:muted dim"`. The ice fog at half intensity becomes nearly invisible — the haze dissolves.

The `bold fg:primary` on directory is the only bold element in the prompt.

---

## Interaction States

### Success (exit 0)

```
╰─⟫
    ↑
    fg:accent  (nacreous pink — the spectrum has resolved correctly)
```

### Error (exit ≠ 0)

```
╰─⟫
    ↑
    fg:error  (warning red — the instrument reading is outside range)
```

### Vim normal mode

```
╰─⟪
    ↑
    fg:primary  (nacreous teal — the display is stable, not moving)
```

`⟪` is the inverse of `⟫`. Backward motion, backward glyph.

### Slow command (> 2s)

```
╭  marvin  ~/path  ⁞⁞⁞⁞⁞⁞⁞⁞⁞⁞⁞⁞⁞⁞  ✧ 3.2s  ⁞⁞  ✧ 14:32
```

Duration appears between languages and fill, styled `fg:muted dim`. Threshold is 2000ms.

---

## Contrast Compliance

All tokens verified against background `#0B0C10` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.00351

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #78D8C8   0.578      11.7:1    AAA ✓
accent     #E890C8   0.419       8.6:1    AAA ✓
muted      #8888A8   0.278       5.7:1    AA  ✓
error      #E06868   0.288       5.9:1    AA  ✓
foreground #E4E8F0   0.782      15.8:1    AAA ✓
```

`primary` and `accent` both reach AAA — the iridescent teal and pink must be unambiguous against the polar dark.

---

## File Reference

```
themes/nacreous/
├── nacreous.json          source of truth
├── nacreous.md            this document
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
palette = "nacreous"

[palettes.nacreous]
primary = "#78D8C8"
accent  = "#E890C8"
muted   = "#8888A8"
error   = "#E06868"
```

---

## Install

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

### Starship

```bash
npx github:marvinrichter/gloam nacreous starship
```

### iTerm2

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/nacreous/iterm2.itermcolors`
3. `Color Presets ▾` → select `nacreous`

### Alacritty

```bash
npx github:marvinrichter/gloam nacreous alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam nacreous kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam nacreous wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam nacreous ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam nacreous windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam nacreous vscode
```

### Neovim

```bash
npx github:marvinrichter/gloam nacreous neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme nacreous")
```

### IntelliJ / JetBrains IDEs

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/nacreous/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam nacreous zed
```

---

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string (before `$cmd_duration`)
2. Configure with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`

### Changing the base hue

The palette hue is 174° (teal-green), 315° (nacreous pink), 240° (ice fog), 0° (warning red). To shift toward the blue-violet end of the nacreous spectrum — the rarest display phase — push primary toward 190° and accent toward 280°.

### Adding a fifth token

Add it to `[palettes.nacreous]` with a name and hex value. Verify contrast ≥ 4.5:1 against `#0B0C10` before shipping.

---

## Design Notes

### ANSI 11 (bright yellow) chartreuse trade-off

ANSI 11 `#B0C890` (hsl 88°, 36%, 68%) is positioned in the chartreuse-yellow range rather than a standard yellow. Pure yellow was avoided because it would import solar warmth into a palette built entirely around polar ice, diffraction light, and cold stratospheric colors. `#B0C890` reads as pale spring-green under terminal syntax highlighting — it harmonizes with the nacreous teal primary (hsl 174°) and the ice-blue muted token while fulfilling the syntactic role (bright yellow = constants, numbers) that terminal conventions expect. Users who rely on a warmer yellow for `diff --stat` output or git color-words may prefer a more conventional ANSI 3/11 pair; the nacreous system accepts this trade-off in favor of palette coherence.
