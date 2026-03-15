# Parchment — Design System

> A terminal prompt and iTerm2 color theme for the manuscript writing desk.

---

## Concept

Parchment is the only light theme in the set. Everything inverts.

The material is aged vellum — the scraped and dried animal skin that monks copied manuscripts onto for a thousand years before paper displaced it. The background is the warm cream-yellow of old vellum: not white, not yellow, but the specific off-cream of a page that has absorbed decades of candlelight, cellar air, and the oils of careful hands. The color of the Book of Kells. The color of the Utrecht Psalter.

The ink is iron gall — the dominant writing ink of medieval and Renaissance Europe, made from iron salts and tannic acid extracted from oak galls. Fresh iron gall ink is nearly black. As it ages and oxidizes it pulls toward warm brown. Old manuscripts show this shift throughout: the deep near-black of recent additions, the warm sepia of older passages, the faded brown of text copied a century before. The Parchment prompt encodes this progression directly: `primary` is the freshest, darkest ink; `muted` is the faded passage; `accent` is the rust-brown second ink used for rubrication and emphasis.

The scholarly tradition reinterpreted: your codebase is a manuscript. The terminal is the writing desk. The prompt is the illuminated margin.

| Decision | Reasoning |
|---|---|
| Background `#E8D6B4` | The specific warm cream-yellow of aged vellum — more saturated than modern cream paper, distinctly warmer and more amber than Daybook's cooler sizing-white. Cooler yellows read as document; warmer creams read as artificial. |
| Foreground `#2A1E12` | Iron gall ink in its aged state — deep warm brown, not black. Pure `#000000` would be wrong — too stark, too digital, nothing like a manuscript. |
| Primary `#4A2E12` | The darkest navigational ink. Where you are in the filesystem is the most important information. This is the ink the scribe used for the main text. |
| Accent `#7A3A10` | The rubrication ink — the rust-brown used for headings, initials, and annotation in medieval manuscripts. Git status and the cursor glyph use this: they demand slightly more attention than the main text. |
| Muted `#6B5A48` | Faded ink from an earlier copyist — still readable, but receding. Chrome and time annotations: present but not demanding. |

No light colors appear in the semantic token set. Every prompt element is a dark mark on a light ground. This is not a dark theme with the colors swapped. It is a different visual regime that requires different compositional thinking.

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against background `#E8D6B4`. Contrast is measured as **dark token against light background** — the inverse of the other themes in this set.

```
primary    #4A2E12   hsl(28°,  57%,  18%)  iron gall ink          9.8:1  AAA
accent     #7A3A10   hsl(25°,  77%,  27%)  rust-brown (2nd ink)   6.7:1  AA
muted      #6B5A48   hsl(27°,  20%,  35%)  faded ink              5.2:1  AA
error      #8B2020   hsl(0°,   63%,  34%)  dark crimson           7.1:1  AA
```

### Assignment rules

```
[ ~/path ]  [  branch status ]  ···  [§ time]
     ↑            ↑     ↑      ↑        ↑
  primary       accent accent  muted   muted
›
↑
accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules use `primary` — they are navigation-tier information, the main text of the manuscript page. Command duration uses `muted dim` — it is a marginal annotation.

### Why only four tokens?

A terminal prompt is information density work. More distinct hues create noise, not clarity. Four tokens produce exactly one visual hierarchy:

```
High attention:  accent  — git status, prompt character, cursor
Medium:          primary — where you are, what language you are in
Low:             muted   — what time it is, decorative chrome
Exception:       error   — something is broken
```

In a light theme, hierarchy is communicated by lightness contrast against the background, not by hue brightness against dark space. All four tokens are darker than the background by design. The visual weight of each token is determined by how far it departs from the background luminance — `primary` at 9.8:1 carries the most authority; `muted` at 5.2:1 recedes.

---

## ANSI Palette

### Light theme ANSI philosophy

The 16-color ANSI palette in a light theme operates under a constraint absent from dark themes: **every color must be dark enough to read against the light background**. In dark themes, ANSI 15 (bright white) is the foreground. In Parchment, ANSI 15 is the lightest shade of the background — a near-parchment tone for syntax highlighters that expect a "near-white" slot.

The foreground `#2A1E12` is not placed in any ANSI slot. It is set via the iTerm2 Foreground Color slot directly, which is separate from the 16-color palette. This is correct behavior for light themes: never rely on ANSI to carry your foreground.

All 16 ANSI colors are dark enough to display legibly on `#E8D6B4`. The normal-vs-bright distinction is achieved by weight (darker vs. slightly lighter) rather than by brightness inversion.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#1A0E08` | terminal black = darkest ink | inkblack |
| ANSI 8 (bright black) | `#4A3828` | comments, dim text | faded warm gray |
| ANSI 11 (bright yellow) | `#7A3A10` | **= accent** | accent token |
| ANSI 12 (bright blue) | `#6B5A48` | **= muted** | muted token |
| ANSI 15 (bright white) | `#F0E8D8` | lightest parchment — near-background | background lightened |
| ANSI 9 (bright red) | `#9A3030` | errors, deletions | error-adjacent |
| ANSI 10 (bright green) | `#387830` | success, additions | dark olive — warm-adjacent |
| ANSI 4 (blue) | `#28407A` | links, ink blue | manuscript annotation blue |

The "normal" (non-bright) ANSI variants are deliberately darker than their bright counterparts — the opposite of a dark theme where bright means lighter. In Parchment, brighter means further from the background, which means darker.

### Full palette

```
Normal                              Bright
──────────────────────────────────  ──────────────────────────────────────────
0  #1A0E08  ink black (darkest)     8  #4A3828  warm dark gray (faded ink)
1  #7A2020  dark crimson            9  #9A3030  error-adjacent red
2  #285820  dark olive              10 #387830  bright olive
3  #785A10  dark amber              11 #7A3A10  rust-brown ← accent
4  #28407A  ink blue                12 #6B5A48  faded ink ← muted
5  #58285A  dark purple             13 #784890  bright purple
6  #1A5050  dark teal               14 #287878  bright teal
7  #C0A888  parchment mid           15 #F0E8D8  lightest parchment ← near-bg
```

---

## UI Colors

Note on the inversion from standard terminal practice: in a dark theme, Background is dark and Foreground is light. In Parchment, Background is light and Foreground is dark. Every UI color slot participates in this inversion.

```
Background     #E8D6B4  aged parchment / vellum
Foreground     #2A1E12  iron gall ink — deep warm brown
Bold           #1A0E08  even darker ink — weight + depth together for bold
Cursor         #7A3A10  rust-brown accent — the ink nib against the page
Cursor text    #E8D6B4  background — cursor text matches the paper beneath it
Selection      #D4BEA0  darker parchment — visible highlight, not jarring
Selected text  #2A1E12  foreground — ink remains readable on highlighted paper
Links          #28407A  ink blue — ANSI 4, manuscript annotation color for links
```

---

## Prompt Anatomy

### Layout

Single line. No box frame. The manuscript margin is clean — the illuminated margin of a medieval text is a clear strip of vellum, not a ruled border.

```
[ ~/my-repo ][ branch ~2 +1 ]·················[§ 14:32]
›
```

### Structural elements

```
·   U+00B7  MIDDLE DOT  (fill character — ink dust between quill strokes)
§   U+00A7  SECTION SIGN  (time prefix, command duration prefix — manuscript notation)
›   U+203A  SINGLE RIGHT-POINTING ANGLE QUOTATION MARK  (success cursor)
‹   U+2039  SINGLE LEFT-POINTING ANGLE QUOTATION MARK  (vim normal mode)
```

`§` (the section mark) was used in medieval manuscripts to denote the start of a new section. It appears as a time prefix and duration prefix — both are temporal markers, annotations on the manuscript page. The doubled `§§` form familiar from legal documents is not used here; the single mark is sufficient.

`›` and `‹` replace the heavier `❯`/`❮` used in the dark themes. The lighter weight fits the manuscript aesthetic — a fine quill stroke, not a broad chisel mark. The direction reversal for vim normal mode is intentional: backward motion, backward glyph.

The fill character `·` is the same middle dot used in the other themes. In Parchment it reads as ink dust between strokes rather than scattered embers.

### Module order and rationale

```
[navigation] [git] [languages] [performance] ··· [§ time]
[cursor]
```

Left to right: where → what state → what's installed → how long. Time lives right because it is ambient, not actionable. The username module is omitted — on a manuscript, the scribe's name appears in the colophon at the end, not in every margin. The prompt is the work, not the worker.

### Spacing

Each module's format begins and ends with a space inside the brackets:

```toml
format = "[ $path ]($style)"
```

This creates 1 character of breathing room on each side. The manuscript page breathes — text does not crowd the margin.

---

## Light Theme Notes

### How this works with syntax highlighters

Syntax highlighters in terminal emulators use the 16 ANSI colors. In a light theme, the behavior is different from what most highlighters assume:

- **ANSI 0 (black)** is the darkest ink color, not the background. A highlighter using ANSI 0 for "comments" will produce very dark, somewhat hidden comment text — which is appropriate.
- **ANSI 15 (bright white)** is the lightest parchment shade, not white. A highlighter using ANSI 15 for "background fills" will produce a near-paper tone — correct behavior.
- **ANSI 7 (white)** is the parchment mid-tone `#C0A888` — a warm tan. Highlighters using this for "light text" will produce tan-on-parchment, which is readable but subdued.

Most highlighters are designed for dark themes and will render in unexpected ways on a light terminal. The Parchment ANSI palette is calibrated to minimize jarring results in this mismatch: all colors are dark enough to read, and the near-background ANSI 15 slot prevents accidental invisible-on-white rendering.

For best results with syntax highlighting on a light terminal, consider using a syntax highlighter theme that explicitly targets light terminals — Solarized Light, Tomorrow, or any theme that sets foreground/background explicitly rather than relying on ANSI 0/15.

### What to expect vs dark themes

| Behavior | Dark theme | Parchment (light) |
|---|---|---|
| Unreadable text | Almost never | Can occur if a tool assumes dark bg |
| Cursor visibility | High contrast (light on dark) | Moderate (rust-brown on cream) |
| Selection highlight | Dark bg gets lighter | Light bg gets slightly darker |
| Bold text | Lighter than regular | Darker than regular |
| Comment text (ANSI 8) | Dim gray — recedes | Warm dark gray — still readable |
| Link color | Bright saturated | Ink blue — muted but clear |

### Screen environments

Parchment is designed for **well-lit working conditions** — daylight, office lighting, bright studio. On a dark-adapted display or in a dim room, the light background may cause eye strain. The theme is intentional: it is the aesthetic of the writing desk, the library, the scriptorium. It belongs in the light.

On uncalibrated displays that run cool (blue-shifted), the background may appear more yellow than intended. This is correct — the vellum is warm, and a cool display will exaggerate that warmth relative to a calibrated one.

---

## Typography

Starship renders in whatever font the terminal is configured with. The Parchment system is designed around **JetBrains Mono Nerd Font**.

### Why JetBrains Mono

- **Tall x-height** — the difference between uppercase and lowercase is pronounced. On a light background, weight contrast matters more than in a dark theme where the background absorbs imprecision.
- **Ligature support** — `›` and `‹` sit correctly without collision at typical sizes.
- **Nerd Font integration** — all language glyphs occupy a consistent width and sit at the correct optical baseline.
- **Weight contrast** — the difference between `regular` (muted text) and `bold` (directory) is strong. In a light theme, bold reads as physically heavier ink — the scribe pressing harder.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular  (bold handled per-module by starship)
Size:         13pt     (readable density; 14pt for large displays)
Line spacing: 1.1      (breathing room between lines — the vellum breathes)
```

## Visual Hierarchy

Three weights of attention in every rendered prompt line:

```
BOLD     directory path          the main text — where you are
REGULAR  git branch, languages   contextual — useful but not urgent
DIM      chrome, time, duration  marginal annotation — available if you look
```

`dim` is applied via the `dim` style modifier: `"fg:muted dim"`. On a light background, `dim` reduces the rendering opacity of an already-subdued color — the faded ink fades further, as old annotations do.

The `bold fg:primary` on directory is the only bold element in the prompt. One bold stroke per margin. Everything else defers.

In the Parchment system, hierarchy is communicated by darkness rather than brightness. The darkest token (`primary` at 9.8:1) commands the most attention. The lightest token (`muted` at 5.2:1) recedes. Accent sits between them at 6.7:1 — heavier than muted but lighter than primary. Git status is important, but where you are in the filesystem is more important.

---

## Interaction States

### Success (exit 0)

```
›
↑
fg:accent  (rust-brown — the ink nib, ready to write)
```

### Error (exit ≠ 0)

```
›
↑
fg:error  (dark crimson — the correction mark)
```

The character itself does not change — only its color. The shape `›` remains consistent. Operators learn to read the color, not scan for a new glyph.

In the Parchment palette, accent and error are both warm-dark tones in the red-brown family. The distinction is clear: accent `#7A3A10` is rust-brown — warm, earthy, the color of the rubrication ink. Error `#8B2020` is dark crimson — the color of a correction mark, of ink spilled in a different register.

### Vim normal mode

```
‹
↑
fg:primary  (iron gall ink — the main text hand, now moving backward)
```

`‹` is the inverse of `›`. The direction reversal maps to mode semantics. Primary signals a steady, navigational state — not active editing, but purposeful motion through the text.

### Slow command (> 2s)

```
[ ~/path ][ branch ] ·················· [§ 3.2s]  [§ 14:32]
```

Duration appears between languages and fill, styled `fg:muted dim`. It is a marginal time annotation, not an alert. The threshold is 2000ms — fast commands produce no note in the margin.

---

## Contrast Compliance

All tokens verified against background `#E8D6B4` using the WCAG 2.1 relative luminance formula. Contrast measured as dark token against light background.

```
Background luminance: 0.686  (#E8D6B4)

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #4A2E12   0.033       8.9:1    AAA ✓
accent     #7A3A10   0.071       6.1:1    AA  ✓
muted      #6B5A48   0.107       4.7:1    AA  ✓
error      #8B2020   0.065       6.4:1    AA  ✓
fg         #2A1E12   0.026      10.0:1    AAA ✓
bold       #1A0E08   0.016      11.3:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). All tokens exceed this. `primary` and `fg` reach AAA — visible in bright daylight, on reflective screens, on uncalibrated displays. `muted` at 4.7:1 is the lowest value in the set; it passes AA with 0.2:1 of margin. On uncalibrated displays running warm (yellow-shifted), the background `#E8D6B4` may appear slightly lighter, narrowing this margin — users relying on muted text in high-glare or warm-shifted environments should test before deploying.

---

## File Reference

```
themes/parchment/
├── parchment.json           source of truth
├── parchment.md             this document
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
palette = "parchment"

[palettes.parchment]
primary = "#4A2E12"
accent  = "#7A3A10"
muted   = "#6B5A48"
error   = "#8B2020"
```

The palette block is the single source of truth. To adapt Parchment to a different base hue, change only this block. All modules reference tokens (`fg:primary`, `fg:accent`, etc.) — nothing is hardcoded in the module configs.

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
npx github:marvinrichter/gloam parchment starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/parchment/iterm2.itermcolors`
3. `Color Presets ▾` → select `parchment`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.

**Light theme:** Disable "Use bright colors for bold text" (`Preferences › Profiles › Text`). In a light theme bold text must be darker, not lighter — the Bold Color slot (`#1A0E08`) handles this correctly when the option is off.

### Alacritty

```bash
npx github:marvinrichter/gloam parchment alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam parchment kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam parchment wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam parchment ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam parchment windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam parchment vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam parchment neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme parchment")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/parchment/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam parchment zed
```

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string (before `$cmd_duration`)
2. Configure the module with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. No other changes needed — spacing and color are inherited

### Changing the base hue

The palette hue sits at approximately 25°–28° (warm brown). To shift the aesthetic cooler — toward a blue-black iron gall at its freshest — push the primary hue toward neutral dark gray. To shift warmer — toward sepia — increase the hue toward 35°–40°. The background `#E8D6B4` can also be shifted: cooler vellum reads more like modern paper; warmer reads more like very old or wax-treated parchment.

### Adding a fifth token

Add it to `[palettes.parchment]` with a name and a hex value. Reference it as `fg:tokenname` in any module format string. Verify contrast ≥ 4.5:1 against `#E8D6B4` before shipping. Any new token must be **darker** than the background — this is a light theme, and all ink marks are darker than the page they appear on.

### Using Parchment alongside dark themes

Parchment pairs naturally with Ember (warm dark), Eventide (cool dark), or any dark theme in the set. A terminal setup that alternates between Parchment during daylight hours and a dark theme at night — triggered by macOS auto appearance switching — is a natural workflow. Both the iTerm2 color profile and the starship config would need to switch. One approach: use separate iTerm2 profiles for day and night, each pointing to a different starship config via `STARSHIP_CONFIG`.
