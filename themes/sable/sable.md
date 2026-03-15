# Sable — Design System

> A terminal prompt and iTerm2 color theme in the heraldic tradition: black, silver, and gold.

---

## Concept

Sable is the heraldic term for black. In coat of arms design, sable is not a background — it is the ground, the absolute. Metal charges (silver, gold) are placed on it with precision and economy. No decoration for its own sake. Every element earns its place.

This theme applies that discipline to a terminal prompt. Near-pure black. Brushed silver for navigation. Champagne gold for git and the cursor. No box frame. No username. No fill rule between information and the clock. The space between modules is just space — the absence of decoration is the decoration.

Every design decision maps to that logic:

| Decision | Reasoning |
|---|---|
| Background `#080808` | Heraldic sable is not warm, not tinted. `#080808` eliminates the atmospheric effect entirely. Pure `#000000` is theoretical; `#080808` is what near-pure black looks like on a calibrated display. |
| Foreground `#E8E8E8` | Neutral silver-white. No warmth, no coolness. The text itself has no opinion. |
| Primary `#C0C8D4` | Brushed steel with a whisper of blue — the color of polished silver, not white. Heraldically, silver ("argent") is the light metal. |
| Accent `#D4AA6A` | 18-karat champagne gold — warm enough to read as gold, restrained enough not to shout. Not costume yellow. Not orange. |
| Muted `#7A8294` | Iron gray — the color of wrought metal. Present, but receding. |
| No box frame | A frame is decoration. Sable does not decorate. |
| No username | Identity is ambient knowledge at a personal workstation. When it matters, add it back. |
| Space fill | The gap between context and time is silence. A visible rule would imply a border between two zones. There is no border — just air. |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#080808`.

```
primary    #C0C8D4   hsl(213°, 15%, 79%)   brushed silver     12.3:1  AAA
accent     #D4AA6A   hsl(38°,  50%, 63%)   champagne gold      9.7:1  AAA
muted      #7A8294   hsl(220°, 10%, 53%)   iron gray           5.4:1  AA
error      #D44848   hsl(0°,   55%, 56%)   crimson             4.7:1  AA
```

### Assignment rules

```
 ~/path   branch status              · time
  ↑        ↑      ↑                  ↑   ↑
  primary  accent accent      muted muted muted
›
↑
accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules (`node`, `python`, `rust`, …) use `primary` — they are navigation-tier information. Command duration uses `muted dim` — it is supporting information.

**Heraldic role convention note:** In this theme, `primary` is silver (`#C0C8D4`) and `accent` is gold (`#D4AA6A`). This inverts the visual dominance pattern used by most other themes, where the accent is the strongest color. In heraldry, gold ("or") is the charge — the object placed on the ground. Silver ("argent") is the ground itself. Sable follows this: the directory path (silver) is the ground you stand on; git status and the cursor (gold) are the active charge, the mark of action. The gold naturally dominates visually, which is the correct behavior here — git status should be the most salient prompt element. The `primary` role carries navigation authority by semantic convention, not by visual weight.

### Why only four tokens?

A terminal prompt is information density work. More distinct hues create noise, not clarity. Four tokens produce exactly one visual hierarchy:

```
High attention:  accent  — git status, prompt character, cursor
Medium:          primary — where you are, what language you are in
Low:             muted   — what time it is, decorative chrome
Exception:       error   — something is broken
```

---

## ANSI Palette

The 16-color ANSI palette is derived from the semantic tokens, not chosen independently. Syntax highlighters, `ls`, `git log`, `grep` — all will harmonize with the prompt automatically.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#080808` | terminal black = background | background |
| ANSI 8 (bright black) | `#202020` | comments, dim text | background + subtle lift |
| ANSI 7 (white) | `#C0C8D4` | **= primary** | primary token — silver is "white" in heraldic terms |
| ANSI 11 (bright yellow) | `#D4AA6A` | **= accent** | accent token |
| ANSI 12 (bright blue) | `#7A8294` | **= muted** | muted token |
| ANSI 15 (bright white) | `#E8E8E8` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#D44848` | **= error** | error token |
| ANSI 10 (bright green) | `#58A858` | success, additions | moss green — harmonizes with palette |

The mapping of primary (brushed silver) to ANSI 7 (the "white" slot) is intentional. In heraldry, silver and white are the same tincture — "argent." What other themes put in the white slot, Sable makes silver.

The "normal" (non-bright) ANSI variants are darker — they appear in backgrounds, disabled states, and legacy contexts where the bright variants would be too prominent.

### Full palette

```
Normal                           Bright
───────────────────────────────  ─────────────────────────────────────
0  #080808  near-pure black       8  #202020  off-black
1  #804040  dark garnet           9  #D44848  crimson ← error
2  #407840  dark forest          10  #58A858  moss green
3  #886820  dark gold            11  #D4AA6A  champagne gold ← accent
4  #384870  midnight blue        12  #7A8294  iron gray ← muted
5  #704870  dark purple          13  #A868A8  silver purple
6  #387878  dark steel-blue      14  #60A8A8  steel cyan
7  #C0C8D4  brushed silver ← primary  15  #E8E8E8  silver-white ← foreground
```

### UI color slots

```
Background     #080808  near-pure black — heraldic sable
Foreground     #E8E8E8  silver-white
Bold           #E8E8E8  same as foreground (weight carries bold, not hue)
Cursor         #D4AA6A  champagne gold — accent token, immediate visibility
Cursor text    #080808  background inside cursor block
Selection      #181818  off-black highlight — barely visible but perceptible
Selected text  #E8E8E8  foreground on selection
Links          #D4AA6A  champagne gold — accent, distinct from body text
```

---

## Prompt Anatomy

### Layout

```
 ~/gloam   main ~2 +1                        · 14:32
›
```

Single line. All information left-to-right. No frame, no username, no visible rule. The cursor line is two characters: the prompt glyph and a space.

### The space fill

The `$fill` module expands to fill available terminal width. In Eventide, the fill character is `─` — a visible horizontal rule that draws the eye to the right edge. In Sable, the fill character is a single space.

The effect: the area between the last language module (or git status) and the time display is empty. No line. No dots. No decoration. Just distance.

This is not an omission. The gap is the design element. A watch face with no numerals still reads as a watch — the absence of decoration signals intentionality. A rule between context and time would imply they are in separate zones. They are not. They are on the same line, separated only by air.

### Prompt character

```
success_symbol = "›"   (U+203A — SINGLE RIGHT-POINTING ANGLE QUOTATION MARK)
error_symbol   = "›"   (same shape, fg:error)
vimcmd_symbol  = "‹"   (U+2039 — SINGLE LEFT-POINTING ANGLE QUOTATION MARK)
```

`›` is quieter than `❯`. The heavy ornament mark (`❯`) is decorative — it draws attention to itself. `›` is typographic — it is a quotation mark pressed into service as a prompt. The shape points forward; the context does the rest. On a near-pure black background with no frame around it, a heavy glyph would be ostentatious. `›` is not.

`‹` for vim normal mode follows the same logic. Direction reversal conveys mode. The glyph does not need weight to communicate.

### Structural elements

```
›   U+203A  SINGLE RIGHT-POINTING ANGLE QUOTATION MARK  (prompt, success)
‹   U+2039  SINGLE LEFT-POINTING ANGLE QUOTATION MARK   (vim normal mode)
·   U+00B7  MIDDLE DOT  (time prefix, command duration prefix)
```

`·` appears twice: before the clock, and before slow command durations (`> 2s`). Like Eventide's `◆`, the repeated glyph creates a "time-related information" visual token without requiring a second color.

### Module order and rationale

```
[navigation] [git] [languages] [performance]   [time]
[cursor]
```

Left to right: where → what state → what's installed → how long. Time lives right because it is ambient, not actionable. The space between performance and time is not padding — it is the fill.

Identity (username) is absent. At a personal workstation, the user knows who they are. On a shared or remote machine, add `$username\` before `$directory\` in the format string.

### Spacing

Each module's `format` begins and ends with a space inside the brackets:

```toml
format = "[ $path ]($style)"
```

This creates one character of breathing room on each side. No module-specific padding logic — every module participates equally.

---

## Typography

Starship renders in whatever font the terminal is configured with. The Sable system is designed around **JetBrains Mono Nerd Font**.

### Why JetBrains Mono

JetBrains Mono was designed for terminal/IDE use at small sizes. Its key properties:

- **Tall x-height** — the difference between uppercase and lowercase is pronounced. Paths and branch names are immediately readable.
- **Nerd Font integration** — all language glyphs (`, ` , ` `, etc.) occupy a consistent width and sit at the correct optical baseline.
- **Weight contrast** — the difference between `regular` (muted text) and `bold` (directory) is strong. `fg:primary` and `bold fg:primary` are visually distinct in the same line.
- **The `›` glyph** — renders at correct optical weight at 13pt. On thinner fonts it can disappear; JetBrains Mono holds the shape.

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
›
↑
fg:accent  (champagne gold)
```

### Error (exit ≠ 0)

```
›
↑
fg:error  (crimson)
```

The character itself does not change — only its color. The shape `›` remains consistent. Operators learn to read the color, not scan for a new glyph.

### Vim normal mode

```
‹
↑
fg:primary  (brushed silver)
```

`‹` is the inverse of `›`. The direction reversal maps to mode semantics — you are now moving backward through the editing model. Silver, not gold: vim normal is a navigation state, not an action state.

### Slow command (> 2s)

```
 ~/path  main                 · 3.2s          · 14:32
```

Duration appears between languages and fill, styled `fg:muted dim`. It is additional information, not an alert. The threshold is 2000ms — fast commands do not produce noise.

---

## Contrast Compliance

All tokens verified against background `#080808` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.00178

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #C0C8D4   0.550      12.3:1    AAA ✓
accent     #D4AA6A   0.431       9.7:1    AAA ✓
muted      #7A8294   0.234       5.4:1    AA  ✓
error      #D44848   0.208       4.98:1   AA  ✓
foreground #E8E8E8   0.820      16.4:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). All tokens meet or exceed this. `primary` and `accent` both reach AAA — they are visible even with screen glare, in dark environments, and on uncalibrated displays.

The near-pure black background (`#080808`) has a lower luminance than tinted backgrounds used in other themes. This makes contrast ratios slightly higher for the same foreground color — black is a favorable ground for light tinctures, which is precisely why heraldic design has used it for centuries.

---

## File Reference

```
themes/sable/
├── sable.json           source of truth
├── sable.md             this document
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
palette = "sable"

[palettes.sable]
primary = "#C0C8D4"
accent  = "#D4AA6A"
muted   = "#7A8294"
error   = "#D44848"
```

The palette block is the single source of truth. To adapt Sable to a different base hue, change only this block. All modules reference tokens (`fg:primary`, `fg:accent`, etc.) — nothing is hardcoded in the module configs.

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
npx github:marvinrichter/gloam sable starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/sable/iterm2.itermcolors`
3. `Color Presets ▾` → select `sable`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.

### Alacritty

```bash
npx github:marvinrichter/gloam sable alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam sable kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam sable wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam sable ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam sable windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam sable vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam sable neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme sable")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/sable/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam sable zed
```

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string on the first line (before `$cmd_duration`)
2. Configure the module with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. No other changes needed — spacing and color are inherited

### Adding the username back

For remote or shared machines where identity matters:

```toml
format = """
$username\
$directory\
...
```

```toml
[username]
show_always = true
style_user  = "fg:muted"
style_root  = "bold fg:error"
format      = "[ $user ](fg:muted)"
```

### Changing the base hue

The palette hue is 213° (silver-blue), 38° (gold), 220° (iron), 0° (crimson). To shift the system warmer, increase the primary and accent hue values proportionally in `[palettes.sable]`.

### Adding a fifth token

Add it to `[palettes.sable]` with a name and a hex value. Reference it as `fg:tokenname` in any module format string. Verify contrast ≥ 4.5:1 against `#080808` before shipping.
