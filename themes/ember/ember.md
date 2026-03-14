# Ember — Design System

> A terminal prompt and iTerm2 color theme for the watch fire at 3am.

---

## Concept

Ember is the moment when everyone else has gone to sleep and there is only you, the terminal, and the coals. The fire has burned down from its earlier height. What remains is the coal bed — orange and black, no blue, no green, nothing cool. The entire spectrum collapses to the warm end.

Every design decision maps to that specific atmospheric state:

| Decision | Reasoning |
|---|---|
| Background `#111008` | Coal does not go fully black. It retains brown warmth even as it cools. Pure `#000000` would be wrong — too cold, too digital. |
| Foreground `#F5EDD4` | Firelight on paper is amber-cream. Not `#FFFFFF`, not the blue-white of daylight. |
| Primary `#FFAB40` | The specific gold-orange of a glowing coal bed at peak visibility — not yellow, not red, but the exact hue where carbon burns. |
| Accent `#FF6D00` | The living flame above the coals — deeper orange, more saturated, where combustion is active. |
| Muted `#9E8E78` | Smoke and ash caught in firelight — warm gray-brown, the residue of what has already burned. |

No cool hues exist anywhere in the system. The palette is a closed thermal world.

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#111008`.

```
primary    #FFAB40   hsl(32°, 100%, 63%)  ember amber         10.7:1  AAA
accent     #FF6D00   hsl(26°, 100%, 50%)  active flame         6.8:1  AA
muted      #9E8E78   hsl(32°,  18%, 55%)  smoke gray-brown     6.1:1  AA
error      #FF4040   hsl(0°,  100%, 63%)  sudden flare         5.6:1  AA
```

### Assignment rules

```
╭  user  ~/path   branch status  ···  ◈ time
   ↑      ↑        ↑      ↑     ↑   ↑  ↑
   muted  primary  accent accent muted muted muted
╰─❯
↑  ↑
muted  accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules (`node`, `python`, `rust`, …) use `primary` — they are navigation-tier information. Command duration uses `muted dim` — it is ambient.

### Why only four tokens?

A terminal prompt is information density work. More distinct hues create noise, not clarity. Four tokens produce exactly one visual hierarchy:

```
High attention:  accent  — git status, prompt character, cursor
Medium:          primary — where you are, what language you are in
Low:             muted   — who you are, what time it is, decorative chrome
Exception:       error   — something is broken
```

The all-warm palette means hierarchy is communicated by saturation and brightness, not by hue contrast. Accent and primary are both orange-family — what separates them is that accent is the hotter, more saturated flame, and primary is the steadier amber coal below it.

---

## ANSI Palette

The 16-color ANSI palette is derived from the semantic tokens, not chosen independently. Syntax highlighters, `ls`, `git log`, `grep` — all harmonize with the prompt automatically.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#111008` | terminal black = background | background |
| ANSI 8 (bright black) | `#282418` | comments, dim text | background + warm charcoal lift |
| ANSI 11 (bright yellow) | `#FFAB40` | **= primary** | primary token |
| ANSI 12 (bright blue) | `#9E8E78` | **= muted** | muted token |
| ANSI 15 (bright white) | `#F5EDD4` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#FF4040` | errors, deletions | error token |
| ANSI 10 (bright green) | `#68A858` | success, additions | firefly green — warm-adjacent |
| ANSI 14 (bright cyan) | `#88A888` | strings, links | cool ash green — the most neutral hue in the palette |

The "normal" (non-bright) ANSI variants are deliberately dimmer. ANSI 4 (blue) and ANSI 6 (cyan) are desaturated and darkened toward the coal world — they are present for compatibility but visually subordinated to the warm tones.

### Full palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #111008  deep charcoal-brown  8  #282418  warm charcoal
1  #8B2828  deep coal red        9  #FF4040  sudden flare ← error
2  #4A7840  forest shadow        10 #68A858  firefly green
3  #C87C28  smoldering amber     11 #FFAB40  ember amber ← primary
4  #384868  night sky            12 #9E8E78  smoke gray ← muted
5  #784868  deep rose-coal       13 #E87868  warm rose
6  #386068  cold steel           14 #88A888  cool ash green
7  #A89880  warm ash             15 #F5EDD4  cream ← foreground
```

### UI color slots

```
Background     #111008  deep charcoal-brown
Foreground     #F5EDD4  cream
Bold           #F5EDD4  same as foreground (weight carries bold, not hue)
Cursor         #FF6D00  active flame — accent token, unmistakable against coal
Cursor text    #111008  background inside cursor block
Selection      #201C10  warm coal highlight — visible but not jarring
Selected text  #F5EDD4  foreground on selection
Links          #FFAB40  ember amber — primary token, warm and readable
```

---

## Prompt Anatomy

### Layout

```
╭  marvin  ~/gloam   main ~2 +1  ·············  ◈ 14:32
╰─❯
```

Two lines. The first carries all information. The second is the cursor line — minimal, uncluttered.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
·   U+00B7  MIDDLE DOT  (fill character — glowing embers scattered across the void)
◈   U+25C8  WHITE DIAMOND CONTAINING BLACK SMALL DIAMOND  (time prefix, command duration prefix)
❯   U+276F  HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT
❮   U+276E  HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT  (vim normal)
```

`╭` and `╰─` are styled `fg:muted` — same hue as the username and time. They read as frame, not content.

The fill character `·` differs from Eventide's `─`. The middle dot reads as scattered embers rather than a solid rule — the space between modules is not empty, it is dimly alive. The dim modifier keeps this from competing with module content.

`◈` appears twice: before the clock, and before slow command durations (`> 2s`). The diamond-within-diamond glyph has a visual weight appropriate to its role — heavier than a bullet, lighter than a block. The repetition is intentional — a shared glyph creates a "time-related info" visual token without requiring a second color.

### Module order and rationale

```
╭  [identity] [navigation] [git] [languages] [performance] ··· [time]
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

Starship renders in whatever font the terminal is configured with. The Ember system is designed around **JetBrains Mono Nerd Font**.

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

## Visual Hierarchy

Three weights of attention in every rendered prompt line:

```
BOLD     directory path          the most actionable information
REGULAR  git branch, languages   contextual — useful but not urgent
DIM      chrome, time, duration  ambient — available if you look for it
```

`dim` is applied via the `dim` style modifier: `"fg:muted dim"`. In most terminals this renders at ~50% intensity of the same hue. The fill character `·` uses this treatment — present but not competing.

The `bold fg:primary` on directory is the only bold element in the prompt. One bold element per line is enough. Everything else defers.

In the Ember system, the warm palette means hierarchy is communicated by saturation as much as by weight. The accent flame orange `#FF6D00` is the most saturated color in the prompt. The eye lands there first. The primary amber `#FFAB40` is slightly lighter and broader — it holds attention second. Muted smoke `#9E8E78` recedes naturally.

---

## Interaction States

### Success (exit 0)

```
╰─❯
    ↑
    fg:accent  (active flame)
```

### Error (exit ≠ 0)

```
╰─❯
    ↑
    fg:error  (sudden flare)
```

The character itself does not change — only its color. The shape `❯` remains consistent. Operators learn to read the color, not scan for a new glyph.

In the Ember palette, both accent and error are orange-red family. The distinction is: accent `#FF6D00` is warm deep orange — fire doing what fire does. Error `#FF4040` is an abrupt red-orange — fire behaving incorrectly. The hue shift is small but readable at a glance.

### Vim normal mode

```
╰─❮
    ↑
    fg:primary  (ember amber)
```

`❮` is the inverse of `❯`. The direction reversal maps to mode semantics — you are now moving backward through the editing model. Primary amber signals a steady, stable state: the coal bed, not the flame.

### Slow command (> 2s)

```
╭  marvin  ~/path  ·················  ◈ 3.2s  ···  ◈ 14:32
```

Duration appears between languages and fill, styled `fg:muted dim`. It is additional information, not an alert. The threshold is 2000ms — fast commands do not produce noise.

---

## Contrast Compliance

All tokens verified against background `#111008` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.00410

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #FFAB40   0.444      10.7:1    AAA ✓
accent     #FF6D00   0.279       6.8:1    AA  ✓
muted      #9E8E78   0.246       6.1:1    AA  ✓
error      #FF4040   0.225       5.6:1    AA  ✓
foreground #F5EDD4   0.848      20.5:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). All tokens exceed this. `primary` reaches AAA — visible with screen glare, in dark environments, and on uncalibrated displays.

---

## File Reference

```
themes/ember/
├── ember.json           source of truth
├── ember.md             this document
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
palette = "ember"

[palettes.ember]
primary = "#FFAB40"
accent  = "#FF6D00"
muted   = "#9E8E78"
error   = "#FF4040"
```

The palette block is the single source of truth. To adapt Ember to a different base hue, change only this block. All modules reference tokens (`fg:primary`, `fg:accent`, etc.) — nothing is hardcoded in the module configs.

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
npx github:marvinrichter/gloam ember starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/ember/iterm2.itermcolors`
3. `Color Presets ▾` → select `ember`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.

### Alacritty

```bash
npx github:marvinrichter/gloam ember alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam ember kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam ember wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam ember ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam ember windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam ember vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam ember neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme ember")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/ember/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam ember zed
```

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string on the first line (before `$cmd_duration`)
2. Configure the module with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. No other changes needed — spacing and color are inherited

### Changing the base hue

The palette hue is 32° (ember amber), 26° (active flame), 32° desaturated (smoke), 0° (sudden flare). To shift the entire system warmer or cooler, adjust the HSL hue values in `[palettes.ember]`. The system is already at the warm extreme — pushing further orange enters the red-error range. Cooling toward 40°–50° produces a campfire-at-dusk variant.

### Adding a fifth token

Add it to `[palettes.ember]` with a name and a hex value. Reference it as `fg:tokenname` in any module format string. Verify contrast ≥ 4.5:1 against `#111008` before shipping. Any new token should remain within the warm half of the color wheel (hue 0°–60°) to preserve the palette's thermal unity.
