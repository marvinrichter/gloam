# Fjord — Design System

> A terminal prompt and iTerm2 color theme for a Norwegian fjord at dusk.

---

## Concept

Fjord captures a specific geographic moment: the water surface of a Norwegian fjord at dusk, perfectly still, the light failing, a single amber point from a farmhouse on the far shore. Not a mood board. A discipline.

Every design decision maps to that moment:

| Decision | Reasoning |
|---|---|
| Background `#0A0F18` | Water at night is not black. It holds depth — blue-indigo absorbed from the sky, cold and opaque. |
| Foreground `#D4E0E8` | Winter sky light is desaturated and slightly blue. Not warm parchment, not pure white — cold pale sky. |
| Primary `#6EB5E0` | The ice-blue color of sky reflected in still water. The color of space and depth. |
| Accent `#E8C46A` | A single amber farmhouse light across the fjord. Warm against everything cold. The only warmth in the palette. |
| Muted `#688EAA` | Fog sitting on the water surface. Present, diffuse, not demanding attention. |
| Error `#E06060` | A warning light — the only red in the scene. Cuts through fog immediately. |

The restraint is the point. Scandinavian design removes until nothing can be removed without losing function. The prompt follows the same logic: no username, no ornamentation, only what is navigationally necessary.

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#0A0F18`.

```
primary    #6EB5E0   hsl(204°, 61%, 65%)   ice sky blue         8.6:1   AAA
accent     #E8C46A   hsl(43°,  71%, 67%)   distant amber        11.5:1  AAA
muted      #688EAA   hsl(207°, 26%, 54%)   fog over water       5.5:1   AA
error      #E06060   hsl(0°,   65%, 63%)   warning light        5.5:1   AA
```

### Assignment rules

```
╭  ~/path   branch status  ·····················  ∼ time
   ↑         ↑      ↑      ↑                      ↑   ↑
   primary   accent accent muted dim              muted muted
╰─›
↑  ↑
muted  accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules (`node`, `python`, `rust`, …) use `primary` — they are navigation-tier information. Command duration uses `muted dim` — it is supporting information, like fog, present but not urgent.

### Why only four tokens?

A terminal prompt is information density work. More distinct hues create noise, not clarity. Four tokens produce exactly one visual hierarchy:

```
High attention:  accent  — git status, prompt character, cursor, time
Medium:          primary — where you are, what language you are in
Low:             muted   — structural chrome, fill dots, box frame
Exception:       error   — something is broken
```

---

## ANSI Palette

The 16-color ANSI palette is derived from the semantic tokens and the fjord color environment, not chosen independently. Syntax highlighters, `ls`, `git log`, `grep` — all will harmonize with the prompt automatically.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#0A0F18` | terminal black = background | background |
| ANSI 8 (bright black) | `#1E2A38` | comments, dim text | background + 20% blue |
| ANSI 11 (bright yellow) | `#E8C46A` | **= accent** | accent token (amber light) |
| ANSI 12 (bright blue) | `#6EB5E0` | **= primary** | primary token (ice sky) |
| ANSI 15 (bright white) | `#D4E0E8` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#E06060` | **= error** | error token directly |
| ANSI 10 (bright green) | `#60B878` | success, additions | bright moss — cold-climate green |
| ANSI 14 (bright cyan) | `#60C0C8` | strings, links | glacier cyan — ice surface |

The "normal" (non-bright) ANSI variants are deliberately dimmer — they appear in backgrounds, disabled states, and legacy contexts where the bright variants are too prominent. The normal variants stay within the fjord palette: deep blue, fjord green, muted amber, fog gray.

### Full palette

```
Normal                          Bright
──────────────────────────────  ────────────────────────────────────
0  #0A0F18  deep night water    8  #1E2A38  dark shadow (comments)
1  #B84040  dark red            9  #E06060  warning light ← error
2  #4A9860  fjord green         10 #60B878  bright moss
3  #B09040  muted amber         11 #E8C46A  distant amber ← accent
4  #3868A8  deep blue           12 #6EB5E0  ice sky blue  ← primary
5  #8060A0  twilight purple     13 #B090C8  northern violet
6  #3A8898  glacier teal        14 #60C0C8  glacier cyan
7  #788898  fog gray            15 #D4E0E8  pale winter sky ← foreground
```

### Harmonization notes

The normal palette uses colors that could exist in a fjord landscape at dusk: the greens of moss and pine, the purples of fading sky, the grays of fog and stone. Nothing is arbitrary. Normal red (`#B84040`) is dark enough to read as "subdued warning" rather than alarm. Bright red (`#E06060`) is the full error token.

---

## UI Colors

```
Background     #0A0F18  deep night water
Foreground     #D4E0E8  pale winter sky
Bold           #F0EEE8  slightly brighter — weight carries bold, not hue
Cursor         #E8C46A  distant amber — the single warm point in the scene
Cursor text    #0A0F18  background inside cursor block
Selection      #0E1828  dark highlight — barely lighter than background
Selected text  #D4E0E8  foreground on selection — unchanged
Links          #6EB5E0  ice sky blue — primary token, readable and distinct
```

The cursor amber is the most important UI color decision. In a scene that is almost entirely cool — blues, grays, fogs — the single warm amber light is what draws the eye. The cursor does the same in the terminal. You always know where you are.

---

## Prompt Anatomy

### Layout

```
╭  ~/gloam   main ~2 +1  ···············  ∼ 14:32
╰─›
```

Two lines. The first carries all information. The second is the cursor line — minimal, uncluttered. No username: cold, anonymous, like the fjord itself.

### Fill behavior

The `·` fill character is the visual signature of Fjord. It reads as a water surface — repetitive, horizontal, flat. The dots push time to the right margin, creating the same horizontal stillness as looking across still water.

```
╭  ~/path  ·····················  ∼ 14:32
           ↑___________________↑
           fill expands here
```

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
·   U+00B7  MIDDLE DOT  (fill character — water surface)
∼   U+223C  TILDE OPERATOR  (time prefix — water symbol)
›   U+203A  SINGLE RIGHT-POINTING ANGLE QUOTATION MARK
‹   U+2039  SINGLE LEFT-POINTING ANGLE QUOTATION MARK  (vim normal)
```

`╭` and `╰─` are styled `fg:muted` — fog-colored, same as the fill. They read as frame, not content. The box is present but unassertive.

`∼` appears twice: before the clock, and before slow command durations (`> 2s`). The tilde encodes water in both contexts — time flowing, duration passing. The repetition is intentional.

`›` and `‹` are lighter than Eventide's `❯`/`❮`. The Scandinavian design principle: reduce weight until the form is essential.

### Module order and rationale

```
╭  [navigation] [git] [languages] [performance] ··· [time]
╰─ [cursor]
```

Left to right: where → what state → what's installed → how long. Time lives right because it is ambient, not actionable. Identity (username) is omitted: the fjord does not announce itself.

Languages only appear when detected. `$fill` expands to push time right regardless of how many languages are visible.

### Spacing

Each module's `format` begins and ends with a space inside the brackets:

```toml
format = "[ $path ]($style)"
```

One character of breathing room on each side. Modules do not crowd each other. Still water does not rush.

---

## Typography

Starship renders in whatever font the terminal is configured with. The Fjord system is designed around **JetBrains Mono Nerd Font**.

### Why JetBrains Mono

JetBrains Mono was designed for terminal/IDE use at small sizes. Its key properties:

- **Tall x-height** — the difference between uppercase and lowercase is pronounced. Directory paths are immediately readable.
- **Ligature support** — `›` and `∼` resolve cleanly without collision.
- **Nerd Font integration** — all language glyphs (, , , etc.) occupy a consistent width and sit at the correct optical baseline.
- **Weight contrast** — the difference between `regular` (muted text) and `bold` (directory) is strong. `fg:primary` and `bold fg:primary` are visually distinct in the same line.
- **Dot rendering** — the `·` fill character is rendered at the exact midline, consistent across the full fill width. Critical for the horizontal water-surface effect.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular  (bold handled per-module by starship)
Size:         13pt     (readable density; 14pt for large displays)
Line spacing: 1.1      (breathing room without wasting vertical space)
```

## Visual Hierarchy

Three weights of attention in every rendered prompt line:

```
BOLD     directory path          the most actionable information
REGULAR  git branch, languages   contextual — useful but not urgent
DIM      chrome, time, fill      ambient — available if you look for it
```

`dim` is applied via the `dim` style modifier: `"fg:muted dim"`. In most terminals this renders at ~50% intensity of the same hue. The fill dots use `fg:muted dim` — they are structural noise, not content.

The `bold fg:primary` on directory is the only bold element in the prompt. One bold element per line. Everything else defers to it. Scandinavian restraint: one element leads, nothing competes.

---

## Interaction States

### Success (exit 0)

```
╰─›
    ↑
    fg:accent  (distant amber)
```

### Error (exit ≠ 0)

```
╰─›
    ↑
    fg:error  (warning light)
```

The character itself does not change — only its color. The shape `›` remains consistent. Operators learn to read the color, not scan for a new glyph. The amber-to-red shift is legible at a glance: warm means fine, red means stopped.

### Vim normal mode

```
╰─‹
    ↑
    fg:primary  (ice sky blue)
```

`‹` is the inverse of `›`. The direction reversal maps to mode semantics — you are now moving backward through the editing model. Ice blue: cool, controlled, precise.

### Slow command (> 2s)

```
╭  ~/path  ··················  ∼ 3.2s  ·  ∼ 14:32
```

Duration appears between languages and fill, styled `fg:muted dim`. The `∼` prefix connects it visually to the time module — both are time-related, both use the water tilde. The threshold is 2000ms — fast commands do not produce noise.

---

## Contrast Compliance

All tokens verified against background `#0A0F18` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.0048

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #6EB5E0   0.421       8.6:1    AAA ✓
accent     #E8C46A   0.581      11.5:1    AAA ✓
muted      #688EAA   0.251       5.5:1    AA  ✓
error      #E06060   0.253       5.5:1    AA  ✓
foreground #D4E0E8   0.748      14.6:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). All tokens exceed this. `primary` and `accent` both reach AAA — visible with screen glare, in dark rooms, and on uncalibrated displays. `muted` and `error` both land precisely at the AA/AAA boundary — enough contrast to be readable, dim enough to not overwhelm.

---

## File Reference

```
themes/fjord/
├── fjord.json           source of truth
├── fjord.md             this document
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
palette = "fjord"

[palettes.fjord]
primary = "#6EB5E0"
accent  = "#E8C46A"
muted   = "#688EAA"
error   = "#E06060"
```

The palette block is the single source of truth. To adapt Fjord to a different base hue, change only this block. All modules reference tokens (`fg:primary`, `fg:accent`, etc.) — nothing is hardcoded in the module configs.

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
npx github:marvinrichter/gloam fjord starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/fjord/iterm2.itermcolors`
3. `Color Presets ▾` → select `fjord`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.

### Alacritty

```bash
npx github:marvinrichter/gloam fjord alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam fjord kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam fjord wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam fjord ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam fjord windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam fjord vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam fjord neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme fjord")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/fjord/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam fjord zed
```

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string on the first line (before `$cmd_duration`)
2. Configure the module with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. No other changes needed — spacing and color are inherited

### Changing the base hue

The palette hue is 204° (ice blue), 43° (amber), 207° (fog), 0° (warning). To shift the entire system warmer, increase the primary hue toward teal. To shift cooler, push it toward 220°. The amber accent is the intentional counterpoint — it should always be warm relative to primary.

### Adding a fifth token

Add it to `[palettes.fjord]` with a name and a hex value. Reference it as `fg:tokenname` in any module format string. Verify contrast ≥ 4.5:1 against `#0A0F18` before shipping.

---

## Design Notes

### Muted / error contrast proximity

Muted `#688EAA` (5.5:1) and error `#E06060` (5.5:1) share identical contrast ratios against the `#0A0F18` background. Their visual separation is achieved by hue alone (207° blue-gray vs. 0° red) — no luminance gap. On calibrated displays in normal viewing conditions the blue-gray / red distinction is clear. Users with protanopia (red-blind, ~1% of males) may find these tokens difficult to distinguish; at typical prompt sizes both tokens would render at similar perceived lightness. The `dim` modifier does not apply to error tokens — error is never dimmed. If protanopia accommodation is required, raise the muted contrast above 6:1 to create luminance separation from error.

### Cross-collection note (Fjord / Nocturne)

Fjord and Nocturne are structurally similar: both use two-line arc-box layout (`╭`/`╰─`) with `─` fill and `›`/`❯` cursor family. Both have warm amber-gold accents. Key distinctions: Fjord's background is cool blue-dark (`#0A0F18`), Nocturne's is warm claret-dark (`#100A0C`). Fjord's primary is ice blue (hsl 204°), Nocturne's is candlelight ivory (hsl 43°). Fjord uses `∼` as timePrefix (wave-tilde, Nordic water), Nocturne uses `○` (whole note, piano rest). The Fjord aesthetic is coastal Scandinavian; Nocturne is Parisian interior. See also nocturne.md.

### Removing username

Username is omitted from the format string by design. This is not a `disabled = true` flag — it is simply absent from the format. To restore it, add `$username\` after `[╭](fg:muted)\` in the format string and configure:

```toml
[username]
show_always = true
style_user  = "fg:muted"
style_root  = "bold fg:error"
format      = "[ $user ](fg:muted)"
```
