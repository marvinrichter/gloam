# Amethyst — Design System

> A terminal prompt and iTerm2 color theme for working inside a geode.

---

## Concept

Amethyst is the only theme in the gloam collection where purple is the primary navigation color. Every other theme uses purple as chrome or accent — something secondary, receding. Here purple leads.

The conceit is geological: a geode split open. The outside of a geode is unremarkable — dark matrix rock, dense and opaque. The inside is the revelation: a hollow cavity lined with crystal faces, catching ambient light and refracting it in violet and blue. Some crystals contain fine needles of rutile — a titanium oxide mineral that grows as golden threads through the quartz, catching light at a different angle entirely.

That structure is the design system:

| Layer | Geological meaning | Color role |
|---|---|---|
| Host rock | The dark matrix that surrounds the geode | Background `#0C0811` |
| Crystal face | Amethyst quartz, translucent, violet | Primary — navigation, directories, languages |
| Rutile inclusion | Gold mineral needles inside the crystal | Accent — git, cursor |
| Crystal shadow | The unlit faces between crystal clusters | Muted — chrome, username, time |

Working inside this theme should feel like working inside the mineral chamber itself — deep purple-black surroundings, violet light on the things you navigate through, gold on the things you act on.

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against the background `#0C0811`.

```
primary    #C084F0   hsl(281°, 81%, 73%)   amethyst violet    7.5:1  AAA
accent     #E8B84A   hsl(41°, 79%, 60%)    rutile gold       11.1:1  AAA
muted      #9080A8   hsl(270°, 15%, 58%)   shadow purple      5.6:1  AA
error      #E05858   hsl(0°, 68%, 61%)     crystal fault      5.4:1  AA
```

### Assignment rules

```
╭  user  ~/path   branch status  ···············  ✤ time
   ↑      ↑        ↑      ↑      ↑               ↑  ↑
   muted  primary  accent accent muted dim        muted muted
╰─⟫
↑  ↑
muted  accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules (`node`, `python`, `rust`, …) use `primary` — they are navigation-tier information, telling you what context you are operating in. Command duration uses `muted dim` — it is supporting information, ambient rather than actionable.

### Why purple as primary?

In most color systems, purple occupies the "accent" or "special" role — it appears infrequently and signals something distinctive. Inverting this creates the geode effect: purple is everywhere you look (every directory, every language badge), because the crystal interior is everywhere. Gold becomes the exception — the rutile needle that catches the light differently. You reach for it when acting (git operations, the cursor itself) rather than when navigating.

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

The 16-color ANSI palette is derived from the semantic tokens and the geological palette, not chosen independently. Syntax highlighters, `ls`, `git log`, `grep` — all will harmonize with the prompt automatically.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#0C0811` | terminal black = background | background |
| ANSI 8 (bright black) | `#201428` | comments, dim text | background + 20% purple |
| ANSI 13 (bright magenta) | `#C084F0` | **= primary** | primary token |
| ANSI 11 (bright yellow) | `#E8B84A` | **= accent** | accent token |
| ANSI 12 (bright blue) | `#9080A8` | **= muted** | muted token |
| ANSI 15 (bright white) | `#EAD8F8` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#E05858` | errors, deletions | error token |
| ANSI 10 (bright green) | `#68A870` | success, additions | crystal green, harmonizes with palette |
| ANSI 14 (bright cyan) | `#60A8C0` | strings, links | crystal blue complement |

### A note on ANSI 13 as the primary slot

Conventional terminal themes place the "hero" color in ANSI 11 (bright yellow) because most themes use gold, amber, or warm tones as their primary. Amethyst breaks this convention.

Purple/violet lives in ANSI 13 — the bright magenta slot. This is not a workaround; it is semantically correct. Most syntax highlighters assign keywords, type names, and special identifiers to ANSI 5 (magenta) and ANSI 13 (bright magenta). By placing the amethyst primary in slot 13, the prompt color and the syntax highlighter color naturally align: both are answering the question "what is the dominant structural element here?" with the same hue. The crystal violet in your directory path will match the keyword violet in your editor. The geode wraps around the code.

### Full palette

```
Normal                            Bright
────────────────────────────────  ──────────────────────────────────────
0  #0C0811  dark purple-black      8  #201428  dark purple-black (comments)
1  #B04040  deep red               9  #E05858  crystal fault ← error
2  #508058  deep sage             10  #68A870  crystal green
3  #C09840  gold                  11  #E8B84A  rutile gold ← accent
4  #5068B0  deep blue-violet      12  #9080A8  shadow purple ← muted
5  #9060B0  deep purple           13  #C084F0  amethyst violet ← primary
6  #4080A8  deep teal             14  #60A8C0  crystal blue
7  #8870A0  muted purple-gray     15  #EAD8F8  pale amethyst ← foreground
```

The "normal" (non-bright) ANSI variants are deliberately dimmer — they appear in backgrounds, disabled states, and legacy contexts where the bright variants are too prominent.

---

## UI Colors

```
Background     #0C0811   dark purple-black — the host rock
Foreground     #EAD8F8   pale amethyst — reflected crystal light
Bold           #F8F0FF   bright white with purple cast
Cursor         #E8B84A   rutile gold — gold cursor on dark purple is striking
Cursor text    #0C0811   background inside cursor block
Selection      #180E28   deep purple highlight — visible but not harsh
Selected text  #EAD8F8   foreground on selection
Links          #C084F0   primary — amethyst for hyperlinks
```

---

## Prompt Anatomy

### Layout

```
╭  marvin  ~/gloam   main ~2 +1  ···········  ✤ 14:32
╰─⟫
```

Two lines. The first carries all information. The second is the cursor line — minimal, uncluttered.

### Structural elements

```
╭   U+256D  BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
╰   U+2570  BOX DRAWINGS LIGHT ARC UP AND RIGHT
─   U+2500  BOX DRAWINGS LIGHT HORIZONTAL
·   U+00B7  MIDDLE DOT  (fill character)
✤   U+2724  FOUR TEARDROP-SPOKED ASTERISK  (time prefix, command duration prefix)
⟫   U+27EB  MATHEMATICAL RIGHT DOUBLE ANGLE BRACKET
⟪   U+27EA  MATHEMATICAL LEFT DOUBLE ANGLE BRACKET  (vim normal mode)
```

`╭` and `╰─` are styled `fg:muted` — same hue as the username and time. They read as frame, not content.

### The fill character

The fill character is `·` (middle dot) rather than `─` (box drawing dash). This is deliberate. A full horizontal line creates visual weight that competes with the box frame corners. Middle dots at `dim` opacity read as mineral texture — the grainy surface of the host rock between the crystal clusters. The fill becomes part of the geological metaphor rather than a typographic separator.

### The cursor character

`⟫` (double angle bracket) is used instead of the conventional `❯` (single angle). Double angle brackets suggest depth — looking through a crystal aperture, a passage into the interior. `⟪` in vim normal mode inverts this, suggesting movement back through the same passage.

### The time prefix

`✤` (U+2724 FOUR TEARDROP-SPOKED ASTERISK) is the crystallographic spike marker. Each teardrop spike corresponds to a crystal axis — the four-fold symmetry of the amethyst growth structure. Unlike the solid `✦` (U+2726 BLACK FOUR POINTED STAR), which appears as a flat filled star, `✤` has an organic teardrop taper to each point that reads as a growing crystal rather than a geometric shape. It appears before the clock and before slow command durations.

**Note:** The timePrefix was changed from `✦` (U+2726) to `✤` (U+2724) to eliminate a prompt identity collision with the Aether theme, which also uses `✦`. Both themes share deep purple-black backgrounds (`#0C0811` vs `#0C0B1A`) — without distinct chrome elements they are visually interchangeable in peripheral vision. The new glyph is crystallographic (spike pattern) while `✦` was retained by Aether. See also Aether's design guide for the complementary note.

### The gold cursor on dark purple

The cursor is the only element on screen that moves in real time. By setting it to `#E8B84A` (rutile gold) against `#0C0811` (dark purple-black), the cursor achieves maximum contrast — 11.1:1 — and maximum color separation from the surrounding text. On a purple background, gold is as far from the ground as a color can be. The cursor is unmissable.

### Module order and rationale

```
╭  [identity] [navigation] [git] [languages] [performance] ··· [time]
╰─ [cursor]
```

Left to right: who → where → what state → what's installed → how long. Time lives right because it is ambient, not actionable.

Languages only appear when detected. `$fill` expands to push time right regardless of how many language modules are visible.

### Spacing

Each module's `format` begins and ends with a space inside the brackets:

```toml
format = "[ $path ]($style)"
```

This creates 1 character of breathing room on each side. No module-specific padding logic — every module participates equally.

---

## Typography

Starship renders in whatever font the terminal is configured with. The Amethyst system is designed around **JetBrains Mono Nerd Font**.

### Why JetBrains Mono

JetBrains Mono was designed for terminal/IDE use at small sizes. Its key properties:

- **Tall x-height** — the difference between uppercase and lowercase is pronounced. `User  path` is immediately readable.
- **Ligature support** — `⟫⟫` and `··` resolve cleanly without collision.
- **Nerd Font integration** — all language glyphs (`, `, ` `, etc.) occupy a consistent width and sit at the correct optical baseline.
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

`dim` is applied via the `dim` style modifier: `"fg:muted dim"`. In most terminals this renders at approximately 50% intensity of the same hue. It is the typographic equivalent of a caption.

The `bold fg:primary` on directory is the only bold element in the prompt. One bold element per line is sufficient. Everything else defers.

---

## Interaction States

### Success (exit 0)

```
╰─⟫
    ↑
    fg:accent  (rutile gold)
```

### Error (exit ≠ 0)

```
╰─⟫
    ↑
    fg:error  (crystal fault red)
```

The character itself does not change — only its color. The shape `⟫` remains consistent. Operators learn to read the color, not scan for a new glyph.

### Vim normal mode

```
╰─⟪
    ↑
    fg:primary  (amethyst violet)
```

`⟪` is the inverse of `⟫`. The direction reversal maps to mode semantics — you are now moving backward through the editing model. The primary color (amethyst) marks this as a navigation state, distinct from the accent (gold) of the active cursor.

### Slow command (> 2s)

```
╭  marvin  ~/path  ·············  ✤ 3.2s  ···  ✤ 14:32
```

Duration appears between languages and fill, styled `fg:muted dim`. It is additional information, not an alert. The threshold is 2000ms — fast commands do not produce noise.

---

## Contrast Compliance

All tokens verified against background `#0C0811` using the WCAG 2.1 relative luminance formula.

Background luminance: L = 0.0024

```
Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #C084F0   0.344       7.5:1    AAA ✓
accent     #E8B84A   0.532      11.1:1    AAA ✓
muted      #9080A8   0.243       5.6:1    AA  ✓
error      #E05858   0.237       5.4:1    AA  ✓
foreground #EAD8F8   0.764      15.7:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). All tokens exceed this by at least 1.2×. `primary` and `accent` both reach AAA — they remain visible under screen glare, in dark environments, and on uncalibrated displays.

Note on `primary` at 7.5:1: this is the lowest AAA score in the gloam collection. Purple is intrinsically harder to push to high contrast while maintaining its identity — too light and it becomes lavender-white, losing the amethyst character. 7.5:1 is a deliberate minimum, accepted because the tradeoff preserves the geological fidelity of the palette. All body text uses `foreground` at 15.7:1, where legibility is never in question.

---

## File Reference

```
themes/amethyst/
├── amethyst.json           source of truth
├── amethyst.md             this document
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
palette = "amethyst"

[palettes.amethyst]
primary = "#C084F0"   # amethyst violet
accent  = "#E8B84A"   # rutile gold
muted   = "#9080A8"   # shadow purple
error   = "#E05858"   # crystal fault
```

The palette block is the single source of truth. To adapt Amethyst to a different base hue, change only this block. All modules reference tokens (`fg:primary`, `fg:accent`, etc.) — nothing is hardcoded in the module configurations.

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
npx github:marvinrichter/gloam amethyst starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/amethyst/iterm2.itermcolors`
3. `Color Presets ▾` → select `amethyst`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.

### Alacritty

```bash
npx github:marvinrichter/gloam amethyst alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam amethyst kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam amethyst wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam amethyst ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam amethyst windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam amethyst vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam amethyst neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme amethyst")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/amethyst/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam amethyst zed
```

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string on the first line (before `$cmd_duration`)
2. Configure the module with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. No other changes needed — spacing and color are inherited

### Changing the base hue

The palette hue is 281° (amethyst violet), 41° (rutile gold), 270° (shadow purple), 0° (fault red). To shift the entire system while maintaining the geological character, adjust the HSL hue values: the gap between primary (281°) and accent (41°) is approximately 120° — a wide split-complementary separation that is what makes the gold so dramatic against the purple. Preserve that gap when adapting.

### Adding a fifth token

Add it to `[palettes.amethyst]` with a name and a hex value. Reference it as `fg:tokenname` in any module format string. Verify contrast ≥ 4.5:1 against `#0C0811` before shipping.

### Adjusting the fill density

The `·` fill at `fg:muted dim` reads as sparse mineral texture. For a denser fill, increase the character repeat or switch to `·` at full `fg:muted` intensity. For a lighter fill, use a space or reduce to `fg:muted dim` at lower intensity if your terminal supports it.
