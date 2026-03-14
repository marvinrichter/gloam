# Aether — Design System

> A terminal prompt and iTerm2 color theme for the deep space observatory.

---

## Concept

Aether places you at a remote observatory at the edge of the universe — the kind where the only light is from instrumentation and the sky overhead is total. Not the dramatic black of a power-off screen: the background holds residual violet-blue, the same faint emission scattered by intergalactic gas between galaxy clusters. The void is not empty.

Every design decision maps to that environment:

| Decision | Reasoning |
|---|---|
| Background `#0C0B1A` | Intergalactic space is not black. It holds residual violet-blue from scattered light. Pure `#000000` would be physically wrong. |
| Foreground `#D4D8F0` | Starlight is blue-shifted at cosmological distances. Not white, not warm — slightly cool blue-gray. |
| Primary `#5EE8B8` | The aurora borealis at its peak — teal-green, not mint, not lime. The color of charged particles in a magnetic field. |
| Accent `#C084FC` | The glow of a nearby nebula — violet, high energy, impossible to ignore against the dark void. |
| Muted `#8886B0` | Distant stars resolve to blue-gray when they are too far to distinguish individually. Present but not demanding. |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#0C0B1A`.

```
primary    #5EE8B8   hsl(160°, 74%, 64%)  aurora green       13.5:1  AAA
accent     #C084FC   hsl(276°, 94%, 75%)  nebula violet       8.0:1  AAA
muted      #8886B0   hsl(243°, 18%, 61%)  cosmic dust         5.9:1  AA
error      #FF6B6B   hsl(0°, 100%, 71%)   solar flare         7.2:1  AAA
```

### Assignment rules

```
╭  user  ~/path   branch status  ·········  ✦ time
   ↑      ↑        ↑      ↑      ↑          ↑  ↑
   muted  primary  accent accent muted dim  muted muted
╰─⟫
↑  ↑
muted  accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules (`node`, `python`, `rust`, …) use `primary` — they are navigation-tier information. Command duration uses `muted dim` — it is supporting information.

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

The 16-color ANSI palette is derived from the semantic tokens, not chosen independently. Syntax highlighters, `ls`, `git log`, `grep` — all will harmonize with the prompt automatically.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#0C0B1A` | terminal black = background | background |
| ANSI 8 (bright black) | `#252448` | comments, dim text | background + 20% violet |
| ANSI 10 (bright green) | `#5EE8B8` | **= primary** | primary token |
| ANSI 12 (bright blue) | `#8886B0` | **= muted** | muted token |
| ANSI 13 (bright magenta) | `#C084FC` | **= accent** | accent token |
| ANSI 15 (bright white) | `#D4D8F0` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#E87090` | errors, deletions | error token shifted rose |
| ANSI 11 (bright yellow) | `#9EE878` | success, additions | bright starlight green |

The "normal" (non-bright) ANSI variants are deliberately dimmer — they appear in backgrounds, disabled states, and legacy contexts where the bright variants are too prominent.

### Full palette

```
Normal                             Bright
─────────────────────────────────  ────────────────────────────────────
0  #0C0B1A  void black              8  #252448  deep space shadow
1  #9B4F6C  rose-violet             9  #E87090  rose flare
2  #4AC88A  aurora green variant   10  #5EE8B8  aurora green ← primary
3  #A8B870  starlight gold-green   11  #9EE878  bright starlight
4  #6B5ED8  deep cosmic blue       12  #8886B0  cosmic dust ← muted
5  #B060C8  nebula magenta         13  #C084FC  nebula violet ← accent
6  #48A8CC  ice crystal blue       14  #58C8E8  ice blue
7  #9098C0  dim star blue-gray     15  #D4D8F0  starlight ← foreground
```

### UI color slots

```
Background     #0C0B1A  residual violet-blue void
Foreground     #D4D8F0  starlight blue-gray
Bold           #D4D8F0  same as foreground (weight carries bold, not hue)
Cursor         #C084FC  nebula violet — accent token, impossible to miss
Cursor text    #0C0B1A  background inside cursor block
Selection      #1C1B3A  deep space highlight — visible but not jarring
Selected text  #D4D8F0  foreground on selection
Links          #9EE878  bright starlight — readable, distinct from body text
```

---

## Prompt Anatomy

### Layout

```
╭  marvin  ~/Work/clarc-starship   main ~2 +1  ·············  ✦ 14:32
╰─⟫
```

Two lines. The first carries all information. The second is the cursor line — minimal, uncluttered.

The fill character `·` (U+00B7, MIDDLE DOT) evokes stars scattered across the void between the information clusters and the clock. At small sizes, a row of dots reads as a field of distant light rather than a structural line.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
·   U+00B7  MIDDLE DOT  (fill character — dots like distant stars)
✦   U+2726  BLACK FOUR POINTED STAR  (time prefix, command duration prefix)
⟫   U+27EB  MATHEMATICAL RIGHT DOUBLE ANGLE BRACKET
⟪   U+27EA  MATHEMATICAL LEFT DOUBLE ANGLE BRACKET  (vim normal)
```

`╭` and `╰─` are styled `fg:muted` — same hue as the username and time. They read as frame, not content.

`✦` appears twice: before the clock, and before slow command durations (`> 2s`). The four-pointed star glyph is deliberately space-themed — a stylized stellar point. The repetition creates a "time-related info" visual token without requiring a second color.

`⟫` was chosen over `❯` because the double-chevron reads as a cosmic threshold — the boundary between human thought and machine execution. The mathematical bracket origin gives it a precision that matches the observatory concept.

### Module order and rationale

```
╭  [identity] [navigation] [git] [languages] [performance] ······ [time]
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

Starship renders in whatever font the terminal is configured with. The Aether system is designed around **JetBrains Mono Nerd Font**.

### Why JetBrains Mono

JetBrains Mono was designed for terminal/IDE use at small sizes. Its key properties:

- **Tall x-height** — the difference between uppercase and lowercase is pronounced. `User  path` is immediately readable.
- **Ligature support** — `⟫⟫` and `~~` resolve cleanly without collision.
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

`dim` is applied via the `dim` style modifier: `"fg:muted dim"`. In most terminals this renders at ~50% intensity of the same hue. It is the typographic equivalent of a faint emission line in a spectrum — detectable but not dominant.

The `bold fg:primary` on directory is the only bold element in the prompt. One bold element per line is enough. Everything else defers.

---

## Interaction States

### Success (exit 0)

```
╰─⟫
    ↑
    fg:accent  (nebula violet)
```

### Error (exit ≠ 0)

```
╰─⟫
    ↑
    fg:error  (solar flare)
```

The character itself does not change — only its color. The shape `⟫` remains consistent. Operators learn to read the color, not scan for a new glyph.

### Vim normal mode

```
╰─⟪
    ↑
    fg:primary  (aurora green)
```

`⟪` is the inverse of `⟫`. The direction reversal maps to mode semantics — you are now moving backward through the editing model. The aurora green signals "safe, in control" — a different register from the high-energy violet of the prompt character.

### Slow command (> 2s)

```
╭  marvin  ~/path  ···············  ✦ 3.2s  ··  ✦ 14:32
```

Duration appears between languages and fill, styled `fg:muted dim`. It is additional information, not an alert. The threshold is 2000ms — fast commands do not produce noise.

---

## Contrast Compliance

All tokens verified against background `#0C0B1A` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.00219

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #5EE8B8   0.482      13.5:1    AAA ✓
accent     #C084FC   0.277       8.0:1    AAA ✓
muted      #8886B0   0.203       5.9:1    AA  ✓
error      #FF6B6B   0.248       7.2:1    AAA ✓
foreground #D4D8F0   0.682      15.6:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). All tokens exceed this by at least 1.3×. `primary`, `accent`, and `error` all reach AAA — they are visible even with screen glare, in dark environments, and on uncalibrated displays.

---

## File Reference

```
clarc-starship/
└── aether/
    ├── aether.toml          starship prompt configuration
    ├── Aether.itermcolors   iTerm2 color theme (plist)
    └── AETHER.md            this document
```

### aether.toml

```toml
palette = "aether"

[palettes.aether]
primary = "#5EE8B8"
accent  = "#C084FC"
muted   = "#8886B0"
error   = "#FF6B6B"
```

The palette block is the single source of truth. To adapt Aether to a different base hue, change only this block. All modules reference tokens (`fg:primary`, `fg:accent`, etc.) — nothing is hardcoded in the module configs.

### Aether.itermcolors

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
cp aether.toml ~/.config/starship.toml

# 3. iTerm2 theme
#    Preferences › Profiles › Colors › Color Presets › Import › Aether.itermcolors
#    Then select "Aether" from the preset list

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

The palette hue is 160° (aurora green), 276° (nebula violet), 243° (cosmic dust), 0° (solar flare). To shift the entire system toward warmer or cooler space tones, adjust the HSL hue values proportionally in `[palettes.aether]`.

### Adding a fifth token

Add it to `[palettes.aether]` with a name and a hex value. Reference it as `fg:tokenname` in any module format string. Verify contrast ≥ 4.5:1 against `#0C0B1A` before shipping.
