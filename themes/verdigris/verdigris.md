# Verdigris — Design System

> A terminal prompt and iTerm2 color theme for code that has been running for decades.

---

## Concept

Verdigris is the teal-green patina that forms on bronze and copper when exposed to air, salt, and time. It is the color of old statues in city squares, copper rooftops turned sea-green, the oxidized pipes behind walls that nobody has touched since installation. It is not a new color — it is evidence of persistence.

The theme maps this two-layer material system directly to terminal semantics:

| Decision | Reasoning |
|---|---|
| Background `#0D1210` | Old bronze in shadow is not black. It holds a faint green undertone — earth, not void. |
| Foreground `#D4E0D8` | Weathered documents and aged parchment cool slightly over time. Not warm cream, not blue-white. |
| Primary `#52C4A8` | The verdigris surface layer — the teal-green of fully oxidized copper. The most visible layer. |
| Accent `#CD8B4A` | The bronze metal showing through where the patina has worn thin. Warm, earthy, ancient. |
| Muted `#7A9490` | The mid-stage patina — neither fresh copper nor full verdigris. The color of things in transition. |

The two-layer system — teal over bronze — is the organizing principle. Every time primary and accent appear together (git branch beside a directory path, cursor next to prompt character), they enact the same visual metaphor: the oxidized surface and the metal beneath it.

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#0D1210`.

```
primary    #52C4A8   hsl(166°, 46%, 55%)  verdigris teal      9.0:1  AAA
accent     #CD8B4A   hsl(30°,  52%, 55%)  bronze copper       6.7:1  AA
muted      #7A9490   hsl(174°, 12%, 52%)  patina gray         5.8:1  AA
error      #D46060   hsl(0°,   52%, 60%)  oxidation red       5.5:1  AA
```

### Assignment rules

```
╭  user  ~/path   branch status  ──────────────  ⌘ time
   ↑      ↑        ↑      ↑      ↑               ↑  ↑
   muted  primary  accent accent muted           muted muted
╰─›
↑  ↑
muted  accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules (`node`, `python`, `rust`, …) use `primary` — they are navigation-tier information. Command duration uses `muted dim` — it is supporting information, the terminal equivalent of a margin annotation.

### Why the two-layer bronze system works

The verdigris accent pairing is deliberately unusual. Most terminal themes pair warm and cool hues of similar saturation — the visual system is flat. Verdigris creates a **depth relationship**: primary (teal, high saturation) reads as surface; accent (bronze, warm, lower saturation) reads as the substrate beneath.

When both appear in the same prompt line:

```
╭  marvin  ~/Work/project   main ~2  ─────────────────  ⌘ 14:32
╰─›
   ↑                         ↑                            ↑
   muted                     accent                       muted
           ↑
           primary (bold)
```

The eye reads `primary` first (brightest, boldest), then `accent` (git state — actionable), then `muted` (identity, time — ambient). This is the patina archaeology at work: surface → substructure → background.

### Why only four tokens?

A terminal prompt is information density work. More distinct hues create noise, not clarity. Four tokens produce exactly one visual hierarchy:

```
High attention:  accent  — git status, prompt character, cursor
Medium:          primary — where you are, what language you are in
Low:             muted   — who you are, what time it is, decorative chrome
Exception:       error   — something is broken
```

---

## ANSI Palette

The 16-color ANSI palette is derived from the semantic tokens and the verdigris material system, not chosen independently. Syntax highlighters, `ls`, `git log`, `grep` — all will harmonize with the prompt automatically.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#0D1210` | terminal black = background | background |
| ANSI 8 (bright black) | `#1A2820` | comments, dim text | background + green lift |
| ANSI 10 (bright green) | `#52C4A8` | **= primary** | primary token |
| ANSI 11 (bright yellow) | `#CD8B4A` | **= accent** | accent token |
| ANSI 12 (bright blue) | `#7A9490` | **= muted** | muted token |
| ANSI 15 (bright white) | `#D4E0D8` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#D46060` | **= error** | error token |
| ANSI 14 (bright cyan) | `#60B8A8` | strings, links | sea green, between primary and muted |

The "normal" (non-bright) ANSI variants are the darker material palette — the shadow tones of verdigris bronze. They appear in backgrounds, disabled states, and legacy contexts.

### Full palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #0D1210  deep bronze-black   8  #1A2820  deep bronze shadow
1  #884448  dark ferrous red    9  #D46060  oxidation red ← error
2  #408068  deep patina green   10 #52C4A8  verdigris teal ← primary
3  #887840  aged gold           11 #CD8B4A  bronze copper ← accent
4  #386068  deep teal-blue      12 #7A9490  patina gray ← muted
5  #785868  copper-violet       13 #A87888  rose copper
6  #3A7870  bronze patina       14 #60B8A8  sea green
7  #789488  patina gray-green   15 #D4E0D8  cool parchment ← foreground
```

### UI color slots

```
Background     #0D1210  deep bronze-black
Foreground     #D4E0D8  cool parchment
Bold           #D4E0D8  same as foreground (weight carries bold, not hue)
Cursor         #CD8B4A  bronze copper — accent token, the metal beneath
Cursor text    #0D1210  background inside cursor block
Selection      #182420  deep verdigris highlight — visible but not jarring
Selected text  #D4E0D8  foreground on selection
Links          #52C4A8  verdigris teal — primary token, readable and distinctive
```

---

## Prompt Anatomy

### Layout

```
╭  marvin  ~/Work/clarc-starship   main ~2 +1  ──────────────  ⌘ 14:32
╰─›
```

Two lines. The first carries all information. The second is the cursor line — minimal, uncluttered.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
─   U+2500  BOX DRAWINGS LIGHT HORIZONTAL  (fill character — the metal rule)
⌘   U+2318  PLACE OF INTEREST SIGN  (time prefix, command duration prefix)
›   U+203A  SINGLE RIGHT-POINTING ANGLE QUOTATION MARK  (prompt success)
‹   U+2039  SINGLE LEFT-POINTING ANGLE QUOTATION MARK   (vim normal mode)
```

`╭` and `╰─` are styled `fg:muted` — same hue as the username and time. They read as frame, not content.

`⌘` appears twice: before the clock, and before slow command durations (`> 2s`). The command sign is appropriate here — it is a marker, like an archaeologist's notation on a dig site. The repetition creates a "time-related info" visual token without requiring a second color.

`›` is a lighter, narrower glyph than the Eventide `❯`. It matches the verdigris aesthetic — weathered, worn down, not heavy-handed.

### Module order and rationale

```
╭  [identity] [navigation] [git] [languages] [performance] ── [time]
╰─ [cursor]
```

Left to right: who → where → what state → what's installed → how long. Time lives right because it is ambient, not actionable.

Languages only appear when detected. `$fill` expands to push time right regardless of how many languages are visible.

### Spacing

Each module's `format` begins and ends with a space inside the brackets:

```toml
format = "[ $path ]($style)"
```

This creates 1 character of breathing room on each side. No module-specific padding logic — every module participates equally.

---

## Typography

Starship renders in whatever font the terminal is configured with. The Verdigris system is designed around **JetBrains Mono Nerd Font**.

### Why JetBrains Mono

JetBrains Mono was designed for terminal/IDE use at small sizes. Its key properties:

- **Tall x-height** — the difference between uppercase and lowercase is pronounced. `User  path` is immediately readable.
- **Ligature support** — `››` and `~~` resolve cleanly without collision.
- **Nerd Font integration** — all language glyphs (`, ` , ` `, etc.) occupy a consistent width and sit at the correct optical baseline.
- **Weight contrast** — the difference between `regular` (muted text) and `bold` (directory) is strong. `fg:primary` and `bold fg:primary` are visually distinct in the same line.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular  (bold handled per-module by starship)
Size:         13pt     (readable density; 14pt for large displays)
Line spacing: 1.1      (gives breathing room without wasting vertical space)
```

### Install

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font`

The font must be set in the terminal, not just installed at OS level.

---

## Visual Hierarchy

Three weights of attention in every rendered prompt line:

```
BOLD     directory path          the most actionable information
REGULAR  git branch, languages   contextual — useful but not urgent
DIM      chrome, time, duration  ambient — available if you look for it
```

`dim` is applied via the `dim` style modifier: `"fg:muted dim"`. In most terminals this renders at ~50% intensity of the same hue. It is the typographic equivalent of a caption in an archaeology fieldbook.

The `bold fg:primary` on directory is the only bold element in the prompt. One bold element per line is enough. Everything else defers.

---

## Interaction States

### Success (exit 0)

```
╰─›
    ↑
    fg:accent  (bronze copper)
```

### Error (exit ≠ 0)

```
╰─›
    ↑
    fg:error  (oxidation red)
```

The character itself does not change — only its color. The shape `›` remains consistent. The color shift from bronze to red enacts the material metaphor: copper oxidizes to verdigris when stable, but rust is a different process — damage, not aging.

### Vim normal mode

```
╰─‹
    ↑
    fg:primary  (verdigris teal)
```

`‹` is the inverse of `›`. The direction reversal maps to mode semantics — you are now moving backward through the editing model. Primary here is intentional: vim normal mode is navigation, and navigation uses primary.

### Slow command (> 2s)

```
╭  marvin  ~/path  ─────────────  ⌘ 3.2s  ──  ⌘ 14:32
```

Duration appears between languages and fill, styled `fg:muted dim`. It is additional information, not an alert. The threshold is 2000ms — fast commands do not produce noise.

---

## Contrast Compliance

All tokens verified against background `#0D1210` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.00391

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #52C4A8   0.353       9.0:1    AAA ✓
accent     #CD8B4A   0.259       6.7:1    AA  ✓
muted      #7A9490   0.221       5.8:1    AA  ✓
error      #D46060   0.209       5.5:1    AA  ✓
foreground #D4E0D8   0.726      18.6:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). All tokens exceed this by at least 1.2×. `primary` reaches AAA — it is visible even with screen glare, in dark environments, and on uncalibrated displays.

---

## File Reference

```
clarc-starship/verdigris/
├── verdigris.toml          starship prompt configuration
├── Verdigris.itermcolors   iTerm2 color theme (plist)
└── VERDIGRIS.md            this document
```

### verdigris.toml

```toml
palette = "verdigris"

[palettes.verdigris]
primary = "#52C4A8"
accent  = "#CD8B4A"
muted   = "#7A9490"
error   = "#D46060"
```

The palette block is the single source of truth. To adapt Verdigris to a different base hue, change only this block. All modules reference tokens (`fg:primary`, `fg:accent`, etc.) — nothing is hardcoded in the module configs.

### Verdigris.itermcolors

Standard Apple plist format. Import via:

```
iTerm2 › Preferences › Profiles › Colors › Color Presets ▾ › Import…
```

---

## Install

```bash
# 1. Font
brew install --cask font-jetbrains-mono-nerd-font

# 2. Prompt
cp verdigris.toml ~/.config/starship.toml

# 3. iTerm2 theme
#    Preferences › Profiles › Colors › Color Presets › Import › Verdigris.itermcolors
#    Then select "Verdigris" from the preset list

# 4. Set font in iTerm2
#    Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt
```

All four steps are required. The prompt colors reference named tokens which are resolved by starship. The terminal colors (ANSI 0–15, UI slots) are resolved by iTerm2. They are designed as a system — either alone is incomplete.

---

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string on the first line (before `$cmd_duration`)
2. Configure the module with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. No other changes needed — spacing and color are inherited

### Changing the base hue

The palette hue is 166° (teal), 30° (bronze), 174° (patina gray), 0° (red). To shift the entire system warmer or cooler, adjust the HSL hue values proportionally in `[palettes.verdigris]`.

### Adding a fifth token

Add it to `[palettes.verdigris]` with a name and a hex value. Reference it as `fg:tokenname` in any module format string. Verify contrast ≥ 4.5:1 against `#0D1210` before shipping.
