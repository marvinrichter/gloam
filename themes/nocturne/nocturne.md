# Nocturne — Design System

> A terminal prompt and color theme for a Chopin nocturne played in a candlelit room.

---

## Concept

A nocturne is a musical composition evoking the night. Chopin's nocturnes — twenty-one of them, written between 1827 and 1846 — are for piano alone. They ask for a single instrument, a single room, a single listener. The dynamic markings are almost always piano or pianissimo. You have to lean in to hear them.

The scene is a specific interior: late evening, candles on the piano, a window showing the blue of deep night, red velvet curtain drawn across one side. The piano keys are ivory and ebony. The candlelight turns the ivory warm — not white, not yellow, but the exact cream of an instrument played for decades in low light. The curtain is blood-red, not crimson, not scarlet: the specific color of aged velvet that has absorbed years of candlesmoke.

| Decision | Reasoning |
|---|---|
| Background `#100A0C` | Candlelit dark. Not pure black — a deeper warmth than the cold void, a trace of claret in the room-dark where the candle flame barely reaches. Warmer than `#0C0A0C` to separate clearly from Eventide's cooler dark. |
| Foreground `#EEE8E0` | Ivory piano keys in candlelight. Warmer than white, cooler than cream. |
| Primary `#E0D0A8` | The candlelight on the ivory — the warmth that accumulates over centuries of candles. Where you are in the filesystem holds the weight of the main text. |
| Accent `#D05A6A` | Aged blood-red velvet. Git status and the cursor carry the only saturated color in the room. |
| Muted `#848080` | Candlesmoke gray — the haze between the candle and the ceiling, softening the shadows. Near-neutral (hue 0°, 2% saturation) so it reads as structural chrome only, not a fourth expressive color. |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against background `#100A0C`.

```
primary    #E0D0A8   hsl(43°,  48%, 77%)   candlelight ivory    12.8:1  AAA
accent     #D05A6A   hsl(352°, 56%, 58%)   blood-red velvet      5.0:1  AA
muted      #848080   hsl(0°,    2%, 51%)   candlesmoke gray      5.0:1  AA
error      #E04848   hsl(0°,   71%, 57%)   hot candleflame       4.9:1  AA
```

### Assignment rules

```
╭  marvin  ~/path   branch ~2 +1  ──────────  ○ 14:32
   ↑        ↑        ↑      ↑     ↑          ↑  ↑
   muted    primary  accent accent muted     muted muted
╰─❯
↑  ↑
muted  accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules use `primary` — they are navigation-tier information, the main text in the candlelight. Command duration uses `muted dim` — a note in the margin, smoke between you and the ceiling.

### Why only four tokens?

A nocturne is a study in restraint. Everything not essential is removed. Four tokens produce exactly one visual hierarchy:

```
High attention:  accent  — git status, prompt character, cursor
Medium:          primary — where you are, what language you are in
Low:             muted   — who you are, what time it is
Exception:       error   — the candle gutters
```

---

## ANSI Palette

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#100A0C` | terminal black = background | background |
| ANSI 8 (bright black) | `#201820` | comments, dim text | background + slight warmth |
| ANSI 11 (bright yellow) | `#E0D0A8` | **= primary** | primary token |
| ANSI 12 (bright blue) | `#9880A0` | **= muted (brighter)** | muted-adjacent, rose-purple |
| ANSI 13 (bright magenta) | `#D05A6A` | **= accent** | accent token |
| ANSI 15 (bright white) | `#EEE8E0` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#E04848` | **= error** | error token |
| ANSI 10 (bright green) | `#60B870` | strings, additions | candlelit green |

The "normal" ANSI variants are deliberately dimmer.

### Full palette

```
Normal                              Bright
──────────────────────────────────  ──────────────────────────────────────────
0  #100A0C  candlelit dark          8  #201820  dim warm shadow
1  #883040  dark wine-red           9  #E04848  hot candleflame ← error
2  #406840  dark candle-shadow     10  #60B870  candlelit green
3  #B09040  dark gold              11  #E0D0A8  candlelight ivory ← primary
4  #484880  dark midnight blue     12  #9880A0  rose-purple (muted-adjacent)
5  #784878  dark dusty rose        13  #D05A6A  blood-red velvet ← accent
6  #387878  dark teal              14  #50A8A8  cool teal
7  #848080  candlesmoke gray       15  #EEE8E0  ivory ← foreground
```

### UI color slots

```
Background     #100A0C  candlelit dark
Foreground     #EEE8E0  warm ivory
Bold           #F8F4EC  even warmer ivory (the candle catches on bold strokes)
Cursor         #D05A6A  blood-red velvet — the ink nib, the bow on the string
Cursor text    #100A0C  background inside cursor block
Selection      #201820  warm dark shadow highlight
Selected text  #EEE8E0  foreground on selection
Links          #E0D0A8  primary — candlelight, readable and warm
```

---

## Prompt Anatomy

### Layout

```
╭  marvin  ~/gloam   main ~2 +1  ──────────────  ○ 14:32
╰─❯
```

Two lines. The first carries all information. The second is the cursor line — the player's hands, ready.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
─   U+2500  BOX DRAWINGS LIGHT HORIZONTAL  (fill — the sustained pedal note)
○   U+25CB  WHITE CIRCLE  (time prefix, duration prefix — a whole note, a measure of rest)
❯   U+276F  HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT  (success cursor)
❮   U+276E  HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT  (vim normal)
```

`○` (the open circle) is the whole note — the longest value in standard notation, held across the full measure. It appears before both the time and slow command durations. Both are about duration: how long until midnight, how long the command ran.

The fill character `─` is the sustained pedal note — the harmonic resonance that connects phrase to phrase.

### Module order and rationale

```
╭  [identity] [navigation] [git] [languages] [performance] ── [○ time]
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

Nocturne is designed around **JetBrains Mono Nerd Font**.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular
Size:         13pt
Line spacing: 1.1
```

## Visual Hierarchy

```
BOLD     directory path          the main text — the melody
REGULAR  git branch, languages   the accompaniment
DIM      chrome, time, duration  the sustain pedal — present but not voiced
```

`dim` is applied via `"fg:muted dim"`. The candlesmoke at half intensity becomes barely visible — a haze, not a color.

The `bold fg:primary` on directory is the only bold element in the prompt. One melodic voice.

---

## Interaction States

### Success (exit 0)

```
╰─❯
    ↑
    fg:accent  (blood-red velvet — the bow drawn across the string)
```

### Error (exit ≠ 0)

```
╰─❯
    ↑
    fg:error  (hot candleflame — the flame unsteady)
```

The character does not change — only its color. The shape `❯` remains consistent.

### Vim normal mode

```
╰─❮
    ↑
    fg:primary  (candlelight ivory — stillness, no forward motion)
```

`❮` is the inverse of `❯`. Backward glyph, backward motion.

### Slow command (> 2s)

```
╭  marvin  ~/path  ────────────  ○ 3.2s  ──  ○ 14:32
```

Duration appears between languages and fill, styled `fg:muted dim`. Threshold is 2000ms.

---

## Contrast Compliance

All tokens verified against background `#100A0C` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.00393

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #E0D0A8   0.638      12.8:1    AAA ✓
accent     #D05A6A   0.217       5.0:1    AA  ✓
muted      #848080   0.219       5.0:1    AA  ✓
error      #E04848   0.210       4.9:1    AA  ✓
foreground #EEE8E0   0.847      16.5:1    AAA ✓
```

`primary` at AAA — the main text of the nocturne must be fully legible in low light.

---

## File Reference

```
themes/nocturne/
├── nocturne.json          source of truth
├── nocturne.md            this document
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
palette = "nocturne"

[palettes.nocturne]
primary = "#E0D0A8"
accent  = "#D05A6A"
muted   = "#848080"
error   = "#E04848"
```

---

## Install

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

### Starship

```bash
npx github:marvinrichter/gloam nocturne starship
```

### iTerm2

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/nocturne/iterm2.itermcolors`
3. `Color Presets ▾` → select `nocturne`

### Alacritty

```bash
npx github:marvinrichter/gloam nocturne alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam nocturne kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam nocturne wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam nocturne ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam nocturne windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam nocturne vscode
```

### Neovim

```bash
npx github:marvinrichter/gloam nocturne neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme nocturne")
```

### IntelliJ / JetBrains IDEs

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/nocturne/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam nocturne zed
```

---

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string (before `$cmd_duration`)
2. Configure with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`

### Changing the base hue

The palette hue is 43° (candlelight ivory), 352° (blood-red velvet), 320° (candlesmoke), 0° (hot flame). To shift the room from candlelight to firelight — warmer, more amber — push the primary hue toward 35° and deepen the background slightly toward `#100C08`.

### Adding a fifth token

Add it to `[palettes.nocturne]` with a name and hex value. Verify contrast ≥ 4.5:1 against `#100A0C` before shipping.

---

## Design Notes

### Accent / error proximity on warm displays

Accent `#D05A6A` (hsl 352°, L=0.217) and error `#E04848` (hsl 0°, L=0.210) are only 8° apart in hue with near-equal luminances (Δ=0.007). On calibrated displays, the pink-red vs orange-red distinction is clear. On warm-shifted or uncalibrated displays, and for deuteranomalous users (~6% of males), this distinction may collapse — both tokens read as undifferentiated red.

The design choice is intentional: the nocturne palette is deliberately restrained, and a fully separated error hue would introduce a third expressive color into a two-color (ivory + red) scene. However, users operating on uncalibrated displays or with deuteranomaly should be aware that prompt state (success/failure) relies on this fine color distinction. The `❯` cursor shape does not change between states — color is the only signal.

Mitigation: if you depend on error-state discrimination in low-light conditions or on warm displays, consider the Fjord, Sable, or Umbra themes, which have larger luminance gaps between accent and error tokens.

### Cross-collection note (Nocturne / Fjord)

Nocturne and Fjord are structurally similar: both use two-line-box layout with `─` fill and `❯` cursor, and both have amber/warm accents. The key distinctions: Nocturne's background is warm claret-dark (`#100A0C`) while Fjord's is cool blue-dark; Nocturne's primary is candlelight ivory, Fjord's is cool blue-gray. Nocturne uses a round `○` timePrefix (whole note), Fjord uses `◈` (compass rose). See also fjord.md.
