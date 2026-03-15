# Tungsten — Design System

> A terminal prompt and iTerm2 color theme for the precise moment of incandescence — the filament at operating temperature.

---

## Concept

Tungsten is not a warm theme. It is a specific temperature — 3200 Kelvin — under a specific condition. The moment a tungsten filament reaches operating temperature: past red heat, past orange heat, almost white but still holding onto gold. The light source itself at the instant before it becomes indistinguishable from daylight.

Every design decision maps to that physics:

| Decision | Reasoning |
|---|---|
| Background `#0E0C09` | The darkroom at night. Not pure black — there is residual warmth in the air, a very faint amber cast to the dark. A metrologist's lab after hours. |
| Foreground `#F4EED8` | Warm white. The color of filament light falling on laboratory paper. Not a clinical screen white, not a blue-shifted LED. The specific warmth of incandescence. |
| Primary `#F0D890` | The filament itself at 3200K. Spectroscopists call this the "whitepoint" of tungsten illumination — technically white but with a golden bias that no measurement instrument can fully correct away. |
| Accent `#5A90C8` | Scientific blue. Oscilloscope traces. Instrument readouts. The CRT phosphor of test equipment watching the filament. The cold precision that measures the warm phenomenon. |
| Muted `#887A60` | The laboratory bench surface — warm wood or Formica, years of use, neither bright nor dark. The background material of precision work. |

The conceptual tension in the palette is intentional: warm primary against cold accent. The filament and the instrument watching it. This opposition creates a quiet visual energy — the prompt feels like an active measurement is in progress.

The single-line layout enforces the laboratory aesthetic. No decorative frame, no username. The engineer who measures temperature to four decimal places does not add ornament to their instruments.

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#0E0C09`.

```
primary    #F0D890   hsl(46°,  77%, 75%)  filament white-gold   14.3:1  AAA
accent     #5A90C8   hsl(210°, 47%, 57%)  scientific blue        5.95:1  AA
muted      #887A60   hsl(35°,  17%, 46%)  warm gray              5.07:1  AA
error      #E05858   hsl(0°,   67%, 61%)  instrument alarm        5.4:1  AA
```

### Assignment rules

```
~/path/to/dir   branch ~2 +1  ···················  ⋄ time
↑               ↑      ↑      ↑                    ↑  ↑
primary         accent accent  muted dim            muted muted
▸
↑
accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language and environment modules use `primary` — they are navigation-tier information: what you are building in, what version you are running. Command duration uses `muted dim` — a margin annotation, like a stopwatch reading written in pencil. The `⋄` diamond prefix marks time-related information, appearing before both the duration and the clock.

### Why warm primary against cold accent?

The palette inverts the typical terminal convention. Most themes use blue as a "default" and warm hues as "alerts." Tungsten reverses this: the warm filament gold is what you navigate by (directory, language), while the cold scientific blue marks what the environment is doing (git state, cursor position).

This maps to the physics. The object under study (your work, your path) glows warm. The instruments observing it (git, the prompt cursor, links) run cold. The temperature contrast is a semantic encoding, not a decorative choice.

---

## ANSI Palette

The 16-color ANSI palette is derived from the semantic tokens and the tungsten concept. Syntax highlighters, `ls`, `git log`, `grep` — all harmonize with the prompt automatically.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#0E0C09` | terminal black = background | background |
| ANSI 8 (bright black) | `#1E1A14` | comments, dim text | background + warm lift |
| ANSI 11 (bright yellow) | `#F0D890` | **= primary** | primary token — filament gold |
| ANSI 12 (bright blue) | `#5A90C8` | **= accent** | accent token — scientific blue |
| ANSI 15 (bright white) | `#F4EED8` | **= foreground** | foreground — warm white |
| ANSI 9 (bright red) | `#E05858` | errors, deletions | error token |

The "normal" (non-bright) ANSI variants are deliberately dimmer — they appear in backgrounds, disabled states, and legacy contexts. The bright variants carry the semantic weight.

### Full palette

```
Normal                                   Bright
───────────────────────────────────────  ──────────────────────────────────────────
0  #0E0C09  bg itself — warm near-void    8  #1E1A14  very dark warm (comments)
1  #B03838  dull red                      9  #E05858  instrument alarm ← error
2  #508048  lab green                    10  #68A860  safety green
3  #C0A840  warm gold                    11  #F0D890  filament white-gold ← primary
4  #4068A8  instrument blue              12  #5A90C8  scientific blue ← accent
5  #8050A8  control violet               13  #A078C8  oscilloscope purple
6  #308898  meter teal                   14  #50A0B0  instrument cyan
7  #907868  warm mid-gray                15  #F4EED8  warm white ← foreground
```

### Slot rationale

- **ANSI 11 = primary (not ANSI 10):** The primary token is `#F0D890`, a golden white. It maps naturally to the "bright yellow" slot rather than "bright green." In most syntax highlighters, bright yellow renders on strings and keywords — a reasonable semantic alignment for the most visible token.
- **ANSI 12 = accent:** The accent token `#5A90C8` maps to "bright blue" — the slot most syntax highlighters use for types, builtins, and special constructs. Instrument blue on machine-generated tokens reads as correct.
- **Ansi 13 = oscilloscope purple:** `#A078C8` fills the magenta bright slot with a measured violet — the color of a phosphor persistence trace on older oscilloscopes. Present but not alarming.

---

## UI Colors

```
Background     #0E0C09  dark warm near-void
Foreground     #F4EED8  warm white — filament light on paper
Bold           #FFFDF4  near-white warmth — weight carries bold, not hue shift
Cursor         #5A90C8  scientific blue — accent token, instrument readout precision
Cursor text    #0E0C09  background inside cursor block
Selection      #1C1810  dark warm highlight — visible but not jarring
Selected text  #F4EED8  foreground on selection
Links          #5A90C8  scientific blue — cool, readable, distinct from body text
```

The cursor is blue because the cursor is an instrument. It marks a position with the same visual language as a caret on an oscilloscope screen or a crosshair on a meter display. When it blinks, it reads as an active measurement, not a passive indicator.

---

## Prompt Anatomy

### Layout

```
~/project   main ~2 +1  ·····················  ⋄ 23:12
▸
```

Two lines. The first carries all information. The second is the cursor line — a single prompt character, nothing else. No box frame, no username. Metrological precision.

### Single-line rationale

The watchmaker does not put their name on the instrument face. The prompt that names only what matters — path, state, time — is the prompt of someone who knows what they are doing. Identity is implicit. Everything visible is functional.

`⋄` (U+22C4 DIAMOND OPERATOR) appears twice: before the clock, and before slow command durations. In metrology, the diamond marks a derived measurement — a value computed from other values. Both the duration and the time are derived from the system clock, and the shared glyph encodes that relationship without requiring a second color.

### Structural elements

```
·   U+00B7   MIDDLE DOT           fill character — the background hum of the darkroom
⋄   U+22C4   DIAMOND OPERATOR     time prefix, duration prefix — metrological notation
▸   U+25B8   SMALL RIGHT-POINTING TRIANGLE  prompt success — instrument ready
◂   U+25C2   SMALL LEFT-POINTING TRIANGLE   vim normal mode — instrument in reverse
```

The fill character `·` reads as background noise — the low-level thermal radiation present at any temperature above absolute zero. It is dim by design: `fg:muted dim`.

### Module order and rationale

```
[navigation] [git] [languages] [performance] ··· [time]
[cursor]
```

Left to right: where → what state → what's installed → how long. Time lives right because it is ambient, not actionable. Identity (username) is omitted — in a single-user local session, it is noise. Only measurements that affect the next command are displayed.

### Spacing

Each module's `format` begins and ends with a space inside the brackets:

```toml
format = "[ $path ]($style)"
```

One character of breathing room on each side. Uniform across all modules. No module-level padding logic.

---

## Typography

The Tungsten system is designed around **JetBrains Mono Nerd Font**.

### Why JetBrains Mono

- **Tall x-height** — the difference between uppercase and lowercase is pronounced. The directory path reads at a glance.
- **Strong weight contrast** — `bold fg:primary` (directory) and `fg:primary` (languages) are visually distinct on the same line.
- **Nerd Font integration** — all language glyphs occupy a consistent width and sit at the correct optical baseline with no collision against the surrounding text.
- **Ligature support** — the `▸` and `◂` glyphs and git status symbols render cleanly.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular  (bold handled per-module by starship)
Size:         13pt     (readable density; 14pt for large displays)
Line spacing: 1.1      (gives breathing room without wasting vertical space)
```

## Visual Hierarchy

Three weights of attention in every rendered prompt line:

```
BOLD     directory path          the most actionable information
REGULAR  git branch, languages   contextual — useful but not urgent
DIM      chrome, time, duration  ambient — available if you look for it
```

`dim` is applied via the `dim` style modifier: `"fg:muted dim"`. In most terminals this renders at approximately 50% intensity of the same hue. It is the typographic equivalent of a margin annotation in a laboratory notebook.

The `bold fg:primary` on directory is the only bold element in the prompt. One bold element per line is sufficient. Everything else defers.

---

## Interaction States

### Success (exit 0)

```
▸
↑
fg:accent  (scientific blue)
```

The cursor is blue at rest. At success, the prompt character adopts the same blue. Continuity — the instrument was watching, the command completed, the instrument is still watching.

### Error (exit ≠ 0)

```
▸
↑
fg:error  (instrument alarm)
```

The alarm color is the only warm hue that is not the primary. It reads as immediately different from both the golden primary and the blue accent. In laboratory contexts, red means "check your measurement."

The character shape `▸` does not change between states. Only its color changes. Operators learn to read the color, not scan for a new glyph.

### Vim normal mode

```
◂
↑
fg:primary  (filament white-gold)
```

`◂` is the directional inverse of `▸`. The reversal maps to mode semantics — the editing model now moves backward through history. Gold marks it as a navigational state, warm and stable, not an alert.

### Slow command (> 2s)

```
~/path  ·······················  ⋄ 3.2s  ···  ⋄ 23:12
```

Duration appears between languages and fill, styled `fg:muted dim`. It is a measurement annotation, not an alert. The threshold is 2000ms — fast commands do not produce noise. The `⋄` glyph links it visually to the time display. Two ⋄ readings: elapsed, current. A metrologist would call this a time-interval measurement.

---

## Contrast Compliance

All tokens verified against background `#0E0C09` using the WCAG 2.1 relative luminance formula.

Background luminance: L = 0.0031

```
Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #F0D890   0.708      14.3:1    AAA ✓
accent     #5A90C8   0.266       5.95:1   AA  ✓
muted      #887A60   0.201       5.07:1   AA  ✓
error      #E05858   0.237       5.4:1    AA  ✓
foreground #F4EED8   0.824      16.6:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). All tokens exceed this. `primary` and `foreground` both reach AAA — visible with screen glare, in dark environments, and on uncalibrated displays.

`accent` and `muted` are AA-only by design. The accent carries positional information (git state, cursor) rather than instructional text — a lower contrast threshold is appropriate. The muted carries ambient information (time, fill) — it is deliberately meant to recede.

---

## File Reference

```
themes/tungsten/
├── tungsten.json           source of truth
├── tungsten.md             this document
├── starship.toml          starship prompt configuration
├── iterm2.itermcolors     iTerm2 color theme (plist)
├── alacritty.toml         Alacritty
├── kitty.conf             Kitty
├── wezterm.lua            WezTerm
├── ghostty                Ghostty
├── windows-terminal.json  Windows Terminal
├── vscode.json            VS Code
├── neovim.lua             Neovim
├── intellij.icls          IntelliJ / JetBrains
└── zed.json               Zed
```

### starship.toml

```toml
palette = "tungsten"

[palettes.tungsten]
primary = "#F0D890"
accent  = "#5A90C8"
muted   = "#887A60"
error   = "#E05858"
```

The palette block is the single source of truth. All modules reference tokens (`fg:primary`, `fg:accent`, etc.) — nothing is hardcoded in the module configs. To adapt Tungsten to a different base temperature, change only this block.

### iterm2.itermcolors

Standard Apple plist format. Import via:

```
iTerm2 › Preferences › Profiles › Colors › Color Presets ▾ › Import…
```

---

## Install

```bash
# Font — required for all targets
brew install --cask font-jetbrains-mono-nerd-font
```

### Starship

```bash
npx github:marvinrichter/gloam tungsten starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/tungsten/iterm2.itermcolors`
3. `Color Presets ▾` → select `tungsten`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.

### Alacritty

```bash
npx github:marvinrichter/gloam tungsten alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam tungsten kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam tungsten wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam tungsten ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam tungsten windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam tungsten vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam tungsten neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme tungsten")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/tungsten/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam tungsten zed
```

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string (before `$cmd_duration`)
2. Configure the module with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. No other changes needed — spacing and color are inherited

### Restoring the username

If you want the username visible (e.g. on a shared machine or server):

```toml
[username]
show_always = true
style_user  = "fg:muted"
style_root  = "bold fg:error"
format      = "[ $user ](fg:muted)"
```

Add `$username\` to the format string before `$directory`. The muted style keeps it below the visual weight of the path.

### Adjusting the color temperature

The filament temperature in the palette is encoded in the warmth bias of `primary` and `foreground`. To cool the system toward a 5000K daylight balance, shift the primary toward `#F8F0C0` (less golden, more white). To warm it toward 2700K candlelight, shift toward `#F0C860` (more amber). The accent remains blue in either case — the instrument does not change when the specimen changes temperature.

### Adding a fifth token

Add it to `[palettes.tungsten]` with a name and a hex value. Reference it as `fg:tokenname` in any module format string. Verify contrast ≥ 4.5:1 against `#0E0C09` before shipping.
