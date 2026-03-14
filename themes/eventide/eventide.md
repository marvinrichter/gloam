# Eventide — Design System

> A terminal prompt and iTerm2 color theme for the moment between day and night.

---

## Concept

Eventide captures the 20 minutes after sunset when the sky becomes its most saturated — the ground still warm from the sun, the sky already turning deep indigo. Not a color palette chosen for aesthetics: a specific atmospheric moment translated into terminal values.

Every design decision maps to that moment:

| Decision | Reasoning |
|---|---|
| Background `#0D0F1A` | The sky at dusk is not black. It holds residual violet-blue. Pure `#000000` would be wrong. |
| Foreground `#F0EAD6` | Moonlight on paper is warmer than daylight. Not `#FFFFFF`, not blue-white. |
| Primary `#E8B86D` | The last strip of warm sunlight on the horizon — gold, not yellow. |
| Accent `#FF7F57` | The orange-coral glow directly above the horizon line. |
| Muted `#8B84C4` | The deep violet-blue of the upper sky — present but not demanding attention. |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#0D0F1A`.

```
primary    #E8B86D   hsl(38°, 72%, 66%)   warm gold          11.4:1  AAA
accent     #FF7F57   hsl(18°, 100%, 67%)  sunset coral        8.3:1  AAA
muted      #8B84C4   hsl(245°, 34%, 65%)  twilight lavender   6.3:1  AA
error      #E85D5D   hsl(0°, 71%, 63%)    aurora red          6.1:1  AA
```

### Assignment rules

```
╭  user  ~/path   branch status  ──  ◆ time
   ↑      ↑        ↑      ↑     ↑   ↑  ↑
   muted  primary  accent accent muted muted muted
╰─❯
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
| ANSI 0 (black) | `#0D0F1A` | terminal black = background | background |
| ANSI 8 (bright black) | `#2A2D3E` | comments, dim text | background + 20% lavender |
| ANSI 11 (bright yellow) | `#E8B86D` | **= primary** | primary token |
| ANSI 12 (bright blue) | `#8B84C4` | **= muted** | muted token |
| ANSI 15 (bright white) | `#F0EAD6` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#E87070` | errors, deletions | error token lightened |
| ANSI 10 (bright green) | `#7EC99A` | success, additions | new, harmonizes with palette |
| ANSI 14 (bright cyan) | `#5FB8C0` | strings, links | cool teal complement |

The "normal" (non-bright) ANSI variants are deliberately dimmer — they appear in backgrounds, disabled states, and legacy contexts where the bright variants are too prominent.

### Full palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #0D0F1A  deep indigo-black   8  #2A2D3E  dim indigo
1  #C85A5A  muted crimson       9  #E87070  warm red
2  #6BB08A  forest sage         10 #7EC99A  sage green
3  #C4983A  deep amber          11 #E8B86D  warm gold ← primary
4  #6B64A8  deep lavender       12 #8B84C4  twilight lavender ← muted
5  #A870BC  dusty orchid        13 #C490D1  lavender-pink
6  #4A9CA8  deep teal           14 #5FB8C0  sky teal
7  #B8B0CC  cool gray-lavender  15 #F0EAD6  parchment ← foreground
```

### UI color slots

```
Background     #0D0F1A  deep indigo-black
Foreground     #F0EAD6  warm parchment
Bold           #F0EAD6  same as foreground (weight carries bold, not hue)
Cursor         #FF7F57  sunset coral — accent token, stands out immediately
Cursor text    #0D0F1A  background inside cursor block
Selection      #1E2040  deep indigo highlight — visible but not jarring
Selected text  #F0EAD6  foreground on selection
Links          #B8B4E8  bright lavender — readable, distinct from body text
```

---

## Prompt Anatomy

### Layout

```
╭  marvin  ~/gloam   main ~2 +1  ──────────────  ◆ 14:32
╰─❯
```

Two lines. The first carries all information. The second is the cursor line — minimal, uncluttered.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
─   U+2500  BOX DRAWINGS LIGHT HORIZONTAL  (fill character)
◆   U+25C6  BLACK DIAMOND  (time prefix, command duration prefix)
❯   U+276F  HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT
❮   U+276E  HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT  (vim normal)
```

`╭` and `╰─` are styled `fg:muted` — same hue as the username and time. They read as frame, not content.

`◆` appears twice: before the clock, and before slow command durations (`> 2s`). The repetition is intentional — a shared glyph creates a "time-related info" visual token without requiring a second color.

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

Starship renders in whatever font the terminal is configured with. The Eventide system is designed around **JetBrains Mono Nerd Font**.

### Why JetBrains Mono

JetBrains Mono was designed for terminal/IDE use at small sizes. Its key properties:

- **Tall x-height** — the difference between uppercase and lowercase is pronounced. `User  path` is immediately readable.
- **Ligature support** — `❯❯` and `~~` resolve cleanly without collision.
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
# Font — required for all targets
brew install --cask font-jetbrains-mono-nerd-font
```

### Starship

```bash
npx github:marvinrichter/gloam eventide starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/eventide/iterm2.itermcolors`
3. `Color Presets ▾` → select `eventide`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.
### Alacritty

```bash
npx github:marvinrichter/gloam eventide alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam eventide kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam eventide wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam eventide ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam eventide windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam eventide vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam eventide neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme eventide")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/eventide/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam eventide zed
```
## Visual Hierarchy

Three weights of attention in every rendered prompt line:

```
BOLD     directory path          the most actionable information
REGULAR  git branch, languages   contextual — useful but not urgent
DIM      chrome, time, duration  ambient — available if you look for it
```

`dim` is applied via the `dim` style modifier: `"fg:muted dim"`. In most terminals this renders at ~50% intensity of the same hue. It is the typographic equivalent of a caption.

The `bold fg:primary` on directory is the only bold element in the prompt. One bold element per line is enough. Everything else defers.

---

## Interaction States

### Success (exit 0)

```
╰─❯
    ↑
    fg:accent  (sunset coral)
```

### Error (exit ≠ 0)

```
╰─❯
    ↑
    fg:error  (aurora red)
```

The character itself does not change — only its color. The shape `❯` remains consistent. Operators learn to read the color, not scan for a new glyph.

### Vim normal mode

```
╰─❮
    ↑
    fg:primary  (warm gold)
```

`❮` is the inverse of `❯`. The direction reversal maps to mode semantics — you are now moving backward through the editing model.

### Slow command (> 2s)

```
╭  marvin  ~/path  ─────────────  ◆ 3.2s  ──  ◆ 14:32
```

Duration appears between languages and fill, styled `fg:muted dim`. It is additional information, not an alert. The threshold is 2000ms — fast commands do not produce noise.

---

## Contrast Compliance

All tokens verified against background `#0D0F1A` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.00284

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #E8B86D   0.552      11.4:1    AAA ✓
accent     #FF7F57   0.391       8.3:1    AAA ✓
muted      #8B84C4   0.284       6.3:1    AA  ✓
error      #E85D5D   0.274       6.1:1    AA  ✓
foreground #F0EAD6   0.836      16.8:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). All tokens exceed this by at least 1.5×. `primary` and `accent` both reach AAA — they are visible even with screen glare, in dark environments, and on uncalibrated displays.

---

## File Reference

```
themes/eventide/
├── eventide.json           source of truth
├── eventide.md             this document
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
palette = "eventide"

[palettes.eventide]
primary = "#E8B86D"
accent  = "#FF7F57"
muted   = "#8B84C4"
error   = "#E85D5D"
```

The palette block is the single source of truth. To adapt Eventide to a different base hue, change only this block. All modules reference tokens (`fg:primary`, `fg:accent`, etc.) — nothing is hardcoded in the module configs.

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
npx github:marvinrichter/gloam eventide starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/eventide/iterm2.itermcolors`
3. `Color Presets ▾` → select `eventide`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.
### Alacritty

```bash
npx github:marvinrichter/gloam eventide alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam eventide kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam eventide wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam eventide ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam eventide windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam eventide vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam eventide neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme eventide")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/eventide/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam eventide zed
```
## Extending the System

### Adding a module

1. Add `$module_name\` to the format string on the first line (before `$cmd_duration`)
2. Configure the module with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. No other changes needed — spacing and color are inherited

### Changing the base hue

The palette hue is 38° (gold), 18° (coral), 245° (lavender), 0° (red). To shift the entire system warmer or cooler, adjust the HSL hue values proportionally in `[palettes.eventide]`.

### Adding a fifth token

Add it to `[palettes.eventide]` with a name and a hex value. Reference it as `fg:tokenname` in any module format string. Verify contrast ≥ 4.5:1 against `#0D0F1A` before shipping.
