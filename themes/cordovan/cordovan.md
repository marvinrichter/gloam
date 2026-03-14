# Cordovan — Design System

> A terminal prompt and iTerm2 color theme for the cordovan leather workshop.

---

## Concept

Cordovan is a workshop at night. The smell of beeswax, fine leather, and brass polish. A single work lamp throws warm amber onto the bench. Everything else recedes into warm darkness.

Two materials tell the whole story: the tan-caramel of the leather itself, and the cold blue-steel of the buckles and clasps. These are not just colors — they are opposing physical substances. One is warm, organic, hand-shaped. The other is cold, precise, machine-made. Together they define a complete aesthetic.

Every design decision maps to that tension:

| Decision | Reasoning |
|---|---|
| Background `#120A06` | Cooling coal in darkness. Not black — it holds residual warmth. Pure `#000000` would be wrong. |
| Foreground `#EAE0D4` | The face of tanned leather under lamplight. Warmer than paper-white, never blue-white. |
| Primary `#C49A6A` | The cordovan tan of a freshly burnished strap. The most present color in the workshop. |
| Accent `#6B9AB8` | Cold blue steel of a buckle or clasp. The counterpoint — precision against craft. |
| Muted `#9A7D6A` | Leather in shadow, worn and dark. Present but not demanding attention. |

### Warm vs cold as design principle

Most terminal themes use a single temperature throughout. Cordovan is built on a deliberate temperature conflict: every warm element has a cold counterpart. The background is warm brown; the cursor is cold steel. Directory paths are tan-caramel; git status is steel blue. This tension keeps the prompt readable and alive — your eye always has an anchor in each temperature zone.

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#120A06`.

```
primary    #C49A6A   hsl(32°, 40%, 59%)   cordovan tan/caramel    7.7:1  AAA
accent     #6B9AB8   hsl(205°, 33%, 57%)  cold steel blue         6.5:1  AA
muted      #9A7D6A   hsl(22°, 18%, 51%)   worn leather shadow     5.2:1  AA
error      #D06060   hsl(0°, 52%, 60%)    — fail state            5.2:1  AA
```

### Assignment rules

```
╭  user  ~/path   branch status  ────────────────  ⊕ time
   ↑      ↑        ↑      ↑      ↑                 ↑  ↑
   muted  primary  accent accent muted             muted muted
╰─❯
↑  ↑
muted  accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules (`node`, `python`, `rust`, …) use `primary` — they are navigation-tier information. Command duration uses `muted dim` — it is supporting information, equivalent to a caption.

### Why only four tokens?

A terminal prompt is information density work. More distinct hues create noise, not clarity. Four tokens produce exactly one visual hierarchy:

```
High attention:  accent  — git status, prompt character, cursor
Medium:          primary — where you are, what language you are in
Low:             muted   — who you are, what time it is, decorative chrome
Exception:       error   — something is broken
```

The warm/cold split maps directly to this hierarchy. `accent` (cold steel) catches the eye with its temperature contrast against the warm background. `primary` (warm tan) is harmonious with the background — it is read, not spotted.

---

## ANSI Palette

The 16-color ANSI palette is derived from the semantic tokens, not chosen independently. Syntax highlighters, `ls`, `git log`, `grep` — all will harmonize with the prompt automatically. Every hue is grounded in either the leather family (warm browns, tans, olives, golds) or the hardware family (steel blues, teals, purples).

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#120A06` | terminal black = background | background |
| ANSI 8 (bright black) | `#281810` | comments, dim text | background + 20% warm |
| ANSI 11 (bright yellow) | `#C49A6A` | **= primary** | primary token |
| ANSI 12 (bright blue) | `#6B9AB8` | **= accent** | accent token |
| ANSI 15 (bright white) | `#EAE0D4` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#D06060` | **= error** | error token |
| ANSI 10 (bright green) | `#608858` | success, additions | sage — harmonizes with leather palette |
| ANSI 14 (bright cyan) | `#508898` | strings, links | patina teal — aged metal complement |

The "normal" (non-bright) ANSI variants are deliberately dimmer — they appear in backgrounds, disabled states, and legacy contexts where the bright variants are too prominent.

### Full palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────
0  #120A06  bg itself           8  #281810  dark shadow (comments)
1  #A83030  dark red            9  #D06060  error ← error token
2  #507840  olive green        10  #608858  sage green
3  #B08840  muted gold         11  #C49A6A  cordovan tan ← primary
4  #386898  steel blue         12  #6B9AB8  cold steel blue ← accent
5  #7A5080  dusky purple       13  #9880A8  aged purple
6  #3A7878  leather teal       14  #508898  patina teal
7  #887868  leather mid        15  #EAE0D4  tanned leather ← foreground
```

### UI color slots

```
Background     #120A06  very dark warm brown — cooling coal
Foreground     #EAE0D4  tanned leather face
Bold           #FAF0E4  slightly warmer than foreground (weight + warmth)
Cursor         #6B9AB8  cold steel blue — accent, temperature contrast
Cursor text    #120A06  background inside cursor block
Selection      #241408  dark warm highlight — visible but not jarring
Selected text  #EAE0D4  foreground on selection
Links          #6B9AB8  cold steel blue — steel links feel right here
```

---

## Prompt Anatomy

### Layout

```
╭  marvin  ~/gloam   main ~2 +1  ─────────────────  ⊕ 14:32
╰─❯
```

Two lines. The first carries all information. The second is the cursor line — minimal, uncluttered.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
─   U+2500  BOX DRAWINGS LIGHT HORIZONTAL  (fill character — stitching lines)
⊕   U+2295  CIRCLED PLUS  (time prefix, command duration prefix)
❯   U+276F  HEAVY RIGHT-POINTING ANGLE QUOTATION MARK ORNAMENT
❮   U+276E  HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT  (vim normal)
```

`╭` and `╰─` are styled `fg:muted` — same hue as the username and time. They read as frame, not content.

`⊕` appears twice: before the clock, and before slow command durations (`> 2s`). The circled-plus symbol evokes a dial or gauge — workshop instrumentation. The repetition is intentional — a shared glyph creates a "time-related info" visual token without requiring a second color.

The fill character `─` is the same glyph as the structural lines of the box frame. This choice is deliberate: the fill reads as stitching — thread between the left-side workshop information and the right-side clock.

### Module order and rationale

```
╭  [identity] [navigation] [git] [languages] [performance] ─── [time]
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

Starship renders in whatever font the terminal is configured with. The Cordovan system is designed around **JetBrains Mono Nerd Font**.

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

`dim` is applied via the `dim` style modifier: `"fg:muted dim"`. In most terminals this renders at ~50% intensity of the same hue. It is the typographic equivalent of a caption.

The `bold fg:primary` on directory is the only bold element in the prompt. One bold element per line is enough. Everything else defers.

---

## Interaction States

### Success (exit 0)

```
╰─❯
    ↑
    fg:accent  (cold steel blue)
```

### Error (exit ≠ 0)

```
╰─❯
    ↑
    fg:error  (error red)
```

The character itself does not change — only its color. The shape `❯` remains consistent. Operators learn to read the color, not scan for a new glyph.

### Vim normal mode

```
╰─❮
    ↑
    fg:primary  (cordovan tan)
```

`❮` is the inverse of `❯`. The direction reversal maps to mode semantics — you are now moving backward through the editing model. In normal mode the cursor shifts from cold steel to warm leather: you have left reactive-input mode and entered deliberate-navigation mode.

### Slow command (> 2s)

```
╭  marvin  ~/path  ─────────────────  ⊕ 3.2s  ──  ⊕ 14:32
```

Duration appears between languages and fill, styled `fg:muted dim`. It is additional information, not an alert. The threshold is 2000ms — fast commands do not produce noise.

---

## Contrast Compliance

All tokens verified against background `#120A06` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.0033

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #C49A6A   0.359       7.7:1    AAA ✓
accent     #6B9AB8   0.297       6.5:1    AA  ✓
muted      #9A7D6A   0.226       5.2:1    AA  ✓
error      #D06060   0.227       5.2:1    AA  ✓
foreground #EAE0D4   0.738      14.4:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). All tokens exceed this threshold. `primary` reaches AAA — it is visible even with screen glare, in dark environments, and on uncalibrated displays. The relatively lower contrast of `accent` compared to `primary` is intentional: the cold-blue cursor stands out through temperature contrast against the warm background, not through raw luminance alone.

---

## File Reference

```
themes/cordovan/
├── cordovan.json           source of truth
├── cordovan.md             this document
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
palette = "cordovan"

[palettes.cordovan]
primary = "#C49A6A"
accent  = "#6B9AB8"
muted   = "#9A7D6A"
error   = "#D06060"
```

The palette block is the single source of truth. To adapt Cordovan to a different base hue, change only this block. All modules reference tokens (`fg:primary`, `fg:accent`, etc.) — nothing is hardcoded in the module configs.

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
npx github:marvinrichter/gloam cordovan starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/cordovan/iterm2.itermcolors`
3. `Color Presets ▾` → select `cordovan`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.

### Alacritty

```bash
npx github:marvinrichter/gloam cordovan alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam cordovan kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam cordovan wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam cordovan ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam cordovan windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam cordovan vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam cordovan neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme cordovan")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/cordovan/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam cordovan zed
```

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string on the first line (before `$cmd_duration`)
2. Configure the module with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. No other changes needed — spacing and color are inherited

### Changing the base hue

The palette hue is 32° (tan), 205° (steel), 22° (leather shadow), 0° (red). To shift the entire system warmer or cooler, adjust the HSL hue values proportionally in `[palettes.cordovan]`. Note that the warm/cold tension is the defining characteristic — preserving the gap between primary hue and accent hue matters more than any individual value.

### Adding a fifth token

Add it to `[palettes.cordovan]` with a name and a hex value. Reference it as `fg:tokenname` in any module format string. Verify contrast ≥ 4.5:1 against `#120A06` before shipping.
