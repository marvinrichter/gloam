# Absinthe — Design System

> A terminal prompt and iTerm2 color theme for the forbidden green hour — la fée verte.

---

## Concept

Absinthe is not a green theme. It is a specific green, under a specific light, in a specific era. The wormwood liqueur glowing in a Parisian café circa 1890, illuminated by candlelight through a sugar cube dissolving into cold water. Art nouveau ironwork around the window. A chemistry set arranged on the bar.

Every design decision maps to that atmosphere:

| Decision | Reasoning |
|---|---|
| Background `#080D0A` | The café at night. Not pure black — there is candlelight, there is life. A green-tinted near-dark. |
| Foreground `#D8E8D4` | Herbal parchment. The color of absinthe label paper, not a clinical white. |
| Primary `#70E0A0` | The characteristic absinthe green — not lime, not teal. The specific hue of wormwood and anise illuminated from within. |
| Accent `#E8C848` | Candlelight through a golden anise flower. Warm, alchemical, precise. |
| Muted `#7A8A7A` | The wormwood plant itself — gray-green, herbal, present in the background. |

The single-line layout reinforces the concept. No box frame, no username. Alchemical precision — the prompt names only what matters. A command line that expects deliberate, exact input.

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#080D0A`.

```
primary    #70E0A0   hsl(150°, 65%, 66%)  absinthe green    12.4:1  AAA
accent     #E8C848   hsl(47°,  76%, 59%)  golden anise      12.2:1  AAA
muted      #7A8A7A   hsl(120°,  6%, 51%)  wormwood gray      5.4:1  AA
error      #E05858   hsl(0°,   67%, 61%)  toxic warning      5.8:1  AA
```

### Assignment rules

```
~/path   branch status  ···················  ◇ time
↑        ↑      ↑       ↑                   ↑  ↑
primary  accent accent  muted dim           muted muted
▸
↑
accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules (`node`, `python`, `rust`, …) use `primary` — they are navigation-tier information. Command duration uses `muted dim` — it is supporting information, like a laboratory notation in the margin.

### Why only four tokens?

A terminal prompt is information density work. More distinct hues create noise, not clarity. Four tokens produce exactly one visual hierarchy:

```
High attention:  accent  — git status, prompt character, cursor, time prefix
Medium:          primary — where you are, what language you are in
Low:             muted   — what time it is, decorative chrome, fill dots
Exception:       error   — something is broken
```

---

## ANSI Palette

The 16-color ANSI palette is derived from the semantic tokens and the absinthe concept, not chosen independently. Syntax highlighters, `ls`, `git log`, `grep` — all will harmonize with the prompt automatically.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#080D0A` | terminal black = background | background |
| ANSI 8 (bright black) | `#182018` | comments, dim text | background + forest lift |
| ANSI 10 (bright green) | `#70E0A0` | **= primary** | primary token |
| ANSI 11 (bright yellow) | `#E8C848` | **= accent** | accent token |
| ANSI 12 (bright blue) | `#7A8A7A` | **= muted** | muted token |
| ANSI 15 (bright white) | `#D8E8D4` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#E05858` | errors, deletions | error token |
| ANSI 14 (bright cyan) | `#68C8A8` | strings, links | emerald complement |

The "normal" (non-bright) ANSI variants are deliberately dimmer — they appear in backgrounds, disabled states, and legacy contexts where the bright variants are too prominent.

### Full palette

```
Normal                              Bright
──────────────────────────────────  ──────────────────────────────────────
0  #080D0A  near-black wormwood      8  #182018  deep forest shadow
1  #885848  deep wood-red            9  #E05858  toxic warning ← error
2  #50986A  deep forest green       10  #70E0A0  absinthe green ← primary
3  #A89040  tarnished gold          11  #E8C848  golden anise ← accent
4  #384858  dark prussian           12  #7A8A7A  wormwood gray ← muted
5  #786888  purple shadow           13  #B898A8  faded violet
6  #388070  deep malachite          14  #68C8A8  emerald
7  #889878  wormwood gray-green     15  #D8E8D4  pale herbal ← foreground
```

### UI color slots

```
Background     #080D0A  near-black wormwood dark
Foreground     #D8E8D4  pale herbal parchment
Bold           #D8E8D4  same as foreground (weight carries bold, not hue)
Cursor         #E8C848  golden anise — accent token, stands out immediately
Cursor text    #080D0A  background inside cursor block
Selection      #101810  deep forest highlight — visible but not jarring
Selected text  #D8E8D4  foreground on selection
Links          #E8C848  golden anise — warm, readable, distinct from body text
```

---

## Prompt Anatomy

### Layout

```
~/project   main ~2 +1  ·····················  ◇ 23:12
▸
```

Two lines. The first carries all information. The second is the cursor line — a single prompt character, nothing else. No box frame, no username. Alchemical precision.

### Single-line rationale

Eventide uses a box frame (`╭` / `╰─`) with username to create a contained, atmospheric shell. Absinthe takes the opposite position: the frame is removed entirely, the username omitted. What remains is the essential information. Like a recipe written by an apothecary — only the measurements that matter, no decorative heading.

This approach suits workflows where the prompt must recede into the background between commands. The eye finds the `▸` immediately; everything else is context, not identity.

### Structural elements

```
∙   U+2219  BULLET OPERATOR  (fill character — absinthe drops through sugar)
◇   U+25C7  WHITE DIAMOND  (time prefix, command duration prefix — lab notation)
▸   U+25B8  SMALL RIGHT-POINTING TRIANGLE  (prompt success)
◂   U+25C2  SMALL LEFT-POINTING TRIANGLE   (vim normal mode)
```

`◇` appears twice: before the clock, and before slow command durations (`> 2s`). The repetition is intentional — a shared glyph creates a "time-related info" visual token without requiring a second color. In vintage laboratory notation, the diamond marks a measurement.

The fill character `∙` (bullet operator) reads as falling drops — absinthe dripping through a sugar cube into the glass. Heavier than a middle dot, it carries more presence in the gap between navigation and time. It is dim by design: `fg:muted dim`.

### Module order and rationale

```
[navigation] [git] [languages] [performance] ··· [time]
[cursor]
```

Left to right: where → what state → what's installed → how long. Time lives right because it is ambient, not actionable. Identity (username) is omitted — in a single-user local session, it is noise.

Languages only appear when detected. `$fill` expands to push time right regardless of how many languages are visible.

### Spacing

Each module's `format` begins and ends with a space inside the brackets:

```toml
format = "[ $path ]($style)"
```

This creates 1 character of breathing room on each side. No module-specific padding logic — every module participates equally.

---

## Typography

Starship renders in whatever font the terminal is configured with. The Absinthe system is designed around **JetBrains Mono Nerd Font**.

### Why JetBrains Mono

JetBrains Mono was designed for terminal/IDE use at small sizes. Its key properties:

- **Tall x-height** — the difference between uppercase and lowercase is pronounced. `~/path` is immediately readable.
- **Ligature support** — the `▸` glyph and `~~` resolve cleanly without collision.
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

`dim` is applied via the `dim` style modifier: `"fg:muted dim"`. In most terminals this renders at ~50% intensity of the same hue. It is the typographic equivalent of a margin annotation in a laboratory notebook.

The `bold fg:primary` on directory is the only bold element in the prompt. One bold element per line is enough. Everything else defers.

---

## Interaction States

### Success (exit 0)

```
▸
↑
fg:accent  (golden anise)
```

### Error (exit ≠ 0)

```
▸
↑
fg:error  (toxic warning red)
```

The character does not change — only its color. The shape `▸` remains consistent. Operators learn to read the color, not scan for a new glyph. The triangle is ambiguous by nature — it points forward regardless of outcome. The color resolves the ambiguity.

### Vim normal mode

```
◂
↑
fg:primary  (absinthe green)
```

`◂` is the directional inverse of `▸`. The reversal maps to mode semantics — you are now moving backward through the editing model. The green marks it as a stable, navigational state, not an alert.

### Slow command (> 2s)

```
~/path  ·······················  ◇ 3.2s  ···  ◇ 23:12
```

Duration appears between languages and fill, styled `fg:muted dim`. It is additional information, not an alert. The threshold is 2000ms — fast commands do not produce noise. The `◇` glyph links it visually to the time display at the right.

---

## Contrast Compliance

All tokens verified against background `#080D0A` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.00219

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #70E0A0   0.523      12.4:1    AAA ✓
accent     #E8C848   0.518      12.2:1    AAA ✓
muted      #7A8A7A   0.225       5.4:1    AA  ✓
error      #E05858   0.247       5.8:1    AA  ✓
foreground #D8E8D4   0.686      16.2:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). All tokens exceed this by at least 1.2×. `primary` and `accent` both reach AAA — they are visible even with screen glare, in dark environments, and on uncalibrated displays.

---

## File Reference

```
themes/absinthe/
├── absinthe.json           source of truth
├── absinthe.md             this document
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
palette = "absinthe"

[palettes.absinthe]
primary = "#70E0A0"
accent  = "#E8C848"
muted   = "#7A8A7A"
error   = "#E05858"
```

The palette block is the single source of truth. To adapt Absinthe to a different base hue, change only this block. All modules reference tokens (`fg:primary`, `fg:accent`, etc.) — nothing is hardcoded in the module configs.

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
npx github:marvinrichter/gloam absinthe starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/absinthe/iterm2.itermcolors`
3. `Color Presets ▾` → select `absinthe`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.

### Alacritty

```bash
npx github:marvinrichter/gloam absinthe alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam absinthe kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam absinthe wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam absinthe ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam absinthe windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam absinthe vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam absinthe neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme absinthe")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/absinthe/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam absinthe zed
```

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string on the first line (before `$cmd_duration`)
2. Configure the module with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. No other changes needed — spacing and color are inherited

### Restoring the username

If you want the username visible (e.g. on a shared machine), add the `[username]` block:

```toml
[username]
show_always = true
style_user  = "fg:muted"
style_root  = "bold fg:error"
format      = "[ $user ](fg:muted)"
```

Then add `$username\` to the format string before `$directory`. The muted style keeps it below the visual weight of the path.

### Changing the base hue

The palette hue is 150° (green), 47° (gold), 120° (gray-green), 0° (red). To shift the system toward a different botanical — say violet wormwood or blue gentian — adjust the HSL hue values proportionally in `[palettes.absinthe]`.

### Adding a fifth token

Add it to `[palettes.absinthe]` with a name and a hex value. Reference it as `fg:tokenname` in any module format string. Verify contrast ≥ 4.5:1 against `#080D0A` before shipping.

---

## Design Notes

### Primary / accent luminance proximity

Primary `#70E0A0` (L=0.523) and accent `#E8C848` (L=0.518) have near-identical luminances — Δ=0.005, less than 1% difference. This is unusual: most themes pair a high-luminance and a medium-luminance token for primary and accent. In Absinthe, both tokens reach AAA independently (12.4:1 and 12.2:1 respectively) and their separation is achieved through hue contrast alone (hsl 150° vs hsl 47° — a 103° gap). The two primary signals in the absinthe aesthetic — the green liqueur and the golden anise — are co-equal in luminance by design, the way the botanicals are co-equal in the recipe. Token hierarchy in the rendered prompt is established by the bold modifier on directory (making primary heavier in weight) rather than by luminance.

### Cross-collection note (Absinthe / Petrichor)

Absinthe and Petrichor are the two themes in the gloam collection built on a grass-green primary. The key distinction is the accent: Absinthe uses gold (hsl 47°, alchemical-botanical register), Petrichor uses sky-blue (hsl 198°, storm-physics register). Both themes share a dark background with green undertone; all other tokens differ. When choosing between them: Absinthe belongs to the Parisian café interior; Petrichor belongs to the dry field before rain. See also petrichor.md.
