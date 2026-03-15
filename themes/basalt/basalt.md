# Basalt — Design System

> A terminal prompt and color theme for the edge where cooled lava meets ocean.

---

## Concept

Basalt is volcanic rock. It is what lava becomes when it cools — the most common rock on the surface of the earth, and the rock beneath every ocean floor. Where the Hawaiian lava flows reach the sea, the effect is specific: black volcanic rock, white sea foam, the extraordinary teal of Hawaiian water at the point where it deepens, and a strip of gold at the horizon where the sunset catches.

The transition is geological and immediate at the same time. The rock is millions of years old. The foam is seconds. The teal shifts between green and blue depending on the depth below it. The gold lasts twenty minutes before the sun drops.

| Decision | Reasoning |
|---|---|
| Background `#090A0B` | Black volcanic basalt. Not quite neutral — the slight blue undertone comes from the ocean reflected in the rock's glassy surface. |
| Foreground `#E0E4E8` | Sea foam white at the water's edge. Cool, not warm — it has come off cold deep water. |
| Primary `#40D8D8` | Deep Hawaiian cyan — water over basalt at 15–20m depth, where blue sky and black volcanic rock combine into a pure unmodulated cyan. The hue sits at exactly hsl 180° to establish clear visual territory distinct from Verdigris's teal-green (hsl 166°). |
| Accent `#E8B040` | Sunset gold on basalt. The last twenty minutes before the sun drops. Git status and the cursor hold the only warmth in the scene. |
| Muted `#7888A0` | Volcanic dust settled into ocean gray-blue — the color of the sky above the flow, where steam and sea-salt mix. |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against background `#090A0B`.

```
primary    #40D8D8   hsl(180°, 66%, 55%)   deep Hawaiian cyan 11.4:1  AAA
accent     #E8B040   hsl(38°,  81%, 58%)   sunset gold        10.1:1  AAA
muted      #7888A0   hsl(216°, 17%, 55%)   volcanic sea-gray   5.6:1  AA
error      #E05858   hsl(0°,   70%, 60%)   lava heat shimmer   5.4:1  AA
```

### Assignment rules

```
[ ~/path ][ branch ~2 +1 ]              [∎ 14:32]
     ↑         ↑      ↑   ↑           ↑  ↑
  primary     accent accent muted     muted muted
▸
↑
accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules use `primary` — they are navigation-tier, the water you are moving through. Command duration uses `muted dim` — it is the steam on the horizon, ambient and peripheral.

### Why only four tokens?

A lava flow meeting the ocean has exactly two materials in active contact. Four tokens produce exactly one visual hierarchy:

```
High attention:  accent  — git status, prompt character, cursor
Medium:          primary — where you are, what language you are in
Low:             muted   — what time it is, decorative chrome
Exception:       error   — the lava is still hot
```

---

## ANSI Palette

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#090A0B` | terminal black = background | background |
| ANSI 8 (bright black) | `#181A20` | comments, dim text | background + ocean blue |
| ANSI 10 (bright green) | `#40D8D8` | **= primary** | primary token |
| ANSI 12 (bright blue) | `#7888A0` | **= muted** | muted token |
| ANSI 13 (bright magenta) | `#607888` | rock face gray-blue | basalt surface color |
| ANSI 15 (bright white) | `#E0E4E8` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#E05858` | **= error** | error token |
| ANSI 14 (bright cyan) | `#58C0D8` | strings, links | deep ocean blue |

### Full palette

```
Normal                              Bright
──────────────────────────────────  ──────────────────────────────────────────
0  #090A0B  black basalt             8  #181A20  dim ocean-dark
1  #804848  dark red-rust            9  #E05858  lava heat shimmer ← error
2  #408870  dark teal-green         10  #40D8D8  deep Hawaiian cyan ← primary
3  #988040  dark volcanic gold      11  #C8B050  bright gold
4  #386890  dark deep blue          12  #7888A0  volcanic sea-gray ← muted
5  #7A4898  dark ocean violet       13  #607888  rock face gray-blue
6  #3890A0  dark ocean cyan         14  #58C0D8  deep ocean blue
7  #7888A0  ocean gray-blue         15  #E0E4E8  sea foam white ← foreground
```

### UI color slots

```
Background     #090A0B  black volcanic basalt
Foreground     #E0E4E8  sea foam white
Bold           #E0E4E8  same as foreground
Cursor         #E8B040  sunset gold — the accent, the warmth
Cursor text    #090A0B  background inside cursor block
Selection      #181A20  deep ocean highlight
Selected text  #E0E4E8  foreground on selection
Links          #40D8D8  deep Hawaiian cyan — primary token
```

---

## Prompt Anatomy

### Layout

```
[ ~/gloam ][ main ~2 +1 ]              [∎ 14:32]
▸
```

Single line. No box frame. The volcanic coastline is open — no enclosure, just the line of the horizon.

### Structural elements

```
╌   U+254C  BOX DRAWINGS LIGHT DOUBLE DASH HORIZONTAL  (fill — layered basalt strata)
∎   U+220E  END OF PROOF  (time prefix, duration prefix — the solid mark of geological time)
▸   U+25B8  SMALL RIGHT-POINTING TRIANGLE  (success cursor)
◂   U+25C2  SMALL LEFT-POINTING TRIANGLE  (vim normal mode)
```

`∎` (the end-of-proof mark, also used as a solid square in some mathematical notations) was chosen because basalt is the evidence — the proof — left behind after the eruption. It appears before time and slow durations: both are about what the process has left behind.

The fill character `╌` (BOX DRAWINGS LIGHT DOUBLE DASH HORIZONTAL) evokes the cross-section of layered lava flows — the interrupted horizontal lines of geological strata. Each layer a separate eruption, separated by time.

`▸` and `◂` are triangular, directional. Lava flows in one direction.

### Module order and rationale

```
[navigation] [git] [languages] [performance]     [∎ time]
[cursor]
```

The username is omitted — the basalt does not know who made it.

### Spacing

```toml
format = "[ $path ]($style)"
```

One character of breathing room on each side.

---

## Typography

Basalt is designed around **JetBrains Mono Nerd Font**.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular
Size:         13pt
Line spacing: 1.1
```

## Visual Hierarchy

```
BOLD     directory path          the rock — fixed, geological
REGULAR  git branch, languages   the water — present, moving
DIM      chrome, time, duration  the steam — ambient, peripheral
```

The `bold fg:primary` on directory is the only bold element in the prompt.

---

## Interaction States

### Success (exit 0)

```
▸
↑
fg:accent  (sunset gold — the flow has reached the ocean, the work is done)
```

### Error (exit ≠ 0)

```
▸
↑
fg:error  (lava heat shimmer — still hot, still dangerous)
```

### Vim normal mode

```
◂
↑
fg:primary  (Hawaiian teal — water moving backward, back along the coast)
```

`◂` is the inverse of `▸`. Backward motion, backward glyph.

### Slow command (> 2s)

```
[ ~/path ][ branch ]              [∎ 3.2s]  [∎ 14:32]
```

Duration styled `fg:muted dim`. Threshold is 2000ms.

---

## Contrast Compliance

All tokens verified against background `#090A0B` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.00300

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #40D8D8   0.552      11.4:1    AAA ✓
accent     #E8B040   0.487      10.1:1    AAA ✓
muted      #7888A0   0.246       5.6:1    AA  ✓
error      #E05858   0.235       5.4:1    AA  ✓
foreground #E0E4E8   0.782      15.7:1    AAA ✓
```

---

## File Reference

```
themes/basalt/
├── basalt.json            source of truth
├── basalt.md              this document
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
palette = "basalt"

[palettes.basalt]
primary = "#40D8D8"
accent  = "#E8B040"
muted   = "#7888A0"
error   = "#E05858"
```

---

## Install

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

### Starship

```bash
npx github:marvinrichter/gloam basalt starship
```

### iTerm2

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/basalt/iterm2.itermcolors`
3. `Color Presets ▾` → select `basalt`

### Alacritty

```bash
npx github:marvinrichter/gloam basalt alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam basalt kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam basalt wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam basalt ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam basalt windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam basalt vscode
```

### Neovim

```bash
npx github:marvinrichter/gloam basalt neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme basalt")
```

### IntelliJ / JetBrains IDEs

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/basalt/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam basalt zed
```

---

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string (before `$cmd_duration`)
2. Configure with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`

### Changing the base hue

The palette hue is 180° (deep Hawaiian cyan), 38° (sunset gold), 216° (volcanic sea-gray), 0° (lava shimmer). The primary sits at exactly hsl 180° — this is intentional and should be preserved to maintain at least 14° of hue separation from Verdigris's primary `#52C4A8` (hsl 166°). Both themes are dark themes with teal-range primaries and amber accents; the hue gap is the primary visual differentiator. Do not push primary below hsl 175° when adapting.

**Cross-collection note (Basalt / Verdigris):** These two themes share a structural family — teal-range primary, amber accent, very dark background. Before this revision, the primaries were only 8° apart in hue (Basalt 172° vs Verdigris 166°) with near-identical backgrounds, making them visually indistinguishable at peripheral distance. The primary has been moved to hsl 180° to establish a 14° gap. Visually: Verdigris reads as teal-green (patina surface), Basalt as deep cyan (ocean depth). If adapting Basalt, preserve this distinction from Verdigris.

### Adding a fifth token

Add it to `[palettes.basalt]` with a name and hex value. Verify contrast ≥ 4.5:1 against `#090A0B` before shipping.

---

## Design Notes

### On the `∎` timePrefix

`∎` (U+220E END OF PROOF, also used as a solid filled square) carries noticeably heavier visual weight than every other timePrefix in the gloam collection — most use open or outlined glyphs. This is intentional. Basalt is geological evidence: the proof, left behind after the eruption, that an event occurred. The end-of-proof mark is the typographic equivalent of QED — *the volcanic record is final*. The heavier weight reads as a timestamp that cannot be edited, only accumulated.
