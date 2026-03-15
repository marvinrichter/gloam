# Daybook — Design System

> A terminal prompt and color theme for the merchant's ledger in afternoon light.

---

## Concept

A daybook is a merchant's daily journal — the first record of every transaction before it is posted to the ledger. Georgian counting houses kept them in oblong volumes with marbled board covers: cream paper ruled with faint blue lines in iron-based ink, the day's entries in dark sepia, the totals rubricated in rust-red, the margin notes in the same rust. The paper has a faint sizing gloss. The ink smells of gall and iron. The light is afternoon light from a tall window, cool and clear.

The aesthetic is functional authority. Nothing decorative. Every mark made with a purpose. The blue ruling exists to keep the columns straight, not to be seen. The rust-red correction and total marks are the only color that was meant to be noticed.

| Decision | Reasoning |
|---|---|
| Background `#F2EEE6` | Cream laid paper with sizing — a cooler, slightly lighter off-white than Parchment's amber vellum. The daybook paper is fresh, sized, and functional; the color suggests cool afternoon light rather than centuries of cellar air. |
| Foreground `#1E1A14` | Dark sepia-brown iron gall ink, freshly written. Not quite black — the iron gall always has a warmth that distinguishes it from pure carbon black. |
| Primary `#284878` | Faded ruling blue — the iron-based blue ink used to rule the columns. Deep enough to read clearly, faded enough not to compete with the main entries. |
| Accent `#884830` | Rubrication rust-red — the second ink, used for totals, headings, and corrections. Git status and the cursor carry the bookkeeper's marking color. |
| Muted `#6A5E4E` | Shadow in the paper crease — the warm mid-brown where the paper folds and the light does not reach. |

No color in Daybook is bright. Every token is a working material, not a design statement.

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against background `#F2EEE6`. Contrast is measured as **dark token against light background**.

```
primary    #284878   hsl(222°, 50%, 31%)   ruling blue         7.9:1  AAA
accent     #884830   hsl(24°,  48%, 36%)   rubrication rust    6.1:1  AA
muted      #6A5E4E   hsl(34°,  15%, 36%)   paper shadow        5.5:1  AA
error      #882020   hsl(0°,   63%, 34%)   dark crimson        8.0:1  AAA
```

### Assignment rules

```
[ ~/path ][ branch ~2 +1 ]·················[¶ 14:32]
     ↑         ↑      ↑   ↑              ↑  ↑
  primary     accent accent muted       muted muted
›
↑
accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules use `primary` — they are navigation-tier, the day's main entries. Command duration uses `muted dim` — a marginal time notation, the time the transaction was logged.

### Why only four tokens?

A daybook contains exactly four types of marks: the entry text, the ruling, the rubrication, and the error correction. Four tokens map directly to that register:

```
High attention:  accent  — git status, prompt character, cursor (rubrication)
Medium:          primary — where you are, what language you are in (main entry)
Low:             muted   — what time it is, decorative chrome (paper shadow)
Exception:       error   — something is wrong (the red correction mark)
```

In a light theme, hierarchy is communicated by darkness. The darkest token commands the most attention; the lightest recedes. `primary` at 7.9:1 is not the most authoritative mark — that is `fg` itself at 15.1:1. But `primary` carries more weight than `muted` (5.5:1) and more weight than `accent` (6.1:1). The bookkeeper's column ruling holds more visual mass than the rubrication.

This is the opposite of most prompt designs. In Daybook, the directory — where you are — carries the weight of the ruled column. The git status accent is a correction mark: important when present, not the dominant voice.

---

## ANSI Palette

### Light theme ANSI philosophy

In a light theme, the ANSI palette operates differently from dark themes. Every color must be dark enough to read against the light background. ANSI 15 (bright white) becomes a near-background tone — a very light cream — rather than a bright white foreground.

The foreground `#1E1A14` is not placed in any ANSI slot. It is set via the terminal Foreground Color slot directly. Never rely on ANSI to carry your foreground in a light theme.

All 16 ANSI colors are dark enough to display legibly on `#F2EEE6`.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#0E0A08` | terminal black = darkest ink | near-black inkblack |
| ANSI 8 (bright black) | `#4A4030` | comments, dim text | warm dark paper shadow |
| ANSI 11 (bright yellow) | `#886028` | warm amber (near accent) | accent-adjacent gold |
| ANSI 12 (bright blue) | `#6A5E4E` | **= muted** | muted token |
| ANSI 13 (bright magenta) | `#884830` | **= accent** | accent token |
| ANSI 15 (bright white) | `#F0EBE0` | lightest paper — near-background | background lightened |
| ANSI 9 (bright red) | `#882020` | **= error** | error token |
| ANSI 4 (blue) | `#183060` | links, ruling blue | primary-adjacent navy |

### Full palette

```
Normal                              Bright
──────────────────────────────────  ──────────────────────────────────────────
0  #0E0A08  ink-black (darkest)      8  #4A4030  warm dark paper shadow
1  #6A1E1E  dark crimson             9  #882020  dark crimson ← error
2  #204828  dark forest green       10  #387038  bright olive
3  #604818  dark amber              11  #886028  warm gold
4  #183060  deep navy ruling        12  #6A5E4E  paper shadow ← muted
5  #582858  dark plum               13  #884830  rubrication rust ← accent
6  #184848  dark teal               14  #286868  teal
7  #A09080  warm mid-parchment      15  #F0EBE0  near-background cream
```

### UI color slots

```
Background     #F2EEE6  cream laid paper
Foreground     #1E1A14  dark sepia-brown ink
Bold           #0A0806  darkest ink — heavier pen, more ink
Cursor         #884830  rubrication rust — the nib marking the current entry
Cursor text    #F2EEE6  background inside cursor block — paper beneath the nib
Selection      #D8CEB8  slightly darker paper — visible highlight, not jarring
Selected text  #1E1A14  foreground — ink remains readable on marked paper
Links          #284878  ruling blue — the annotation color for references
```

---

## Prompt Anatomy

### Layout

```
[ ~/my-ledger ][ main ~2 +1 ]·····················[¶ 14:32]
›
```

Single line. No box frame. The daybook page is open — a clear expanse of ruled paper, no border.

### Structural elements

```
·   U+00B7  MIDDLE DOT  (fill — the ruled dot between entry and margin)
¶   U+00B6  PILCROW SIGN  (time prefix, duration prefix — paragraph mark, used in manuscripts and legal documents to denote a section or entry point)
›   U+203A  SINGLE RIGHT-POINTING ANGLE QUOTATION MARK  (success cursor)
‹   U+2039  SINGLE LEFT-POINTING ANGLE QUOTATION MARK  (vim normal mode)
```

`¶` (the pilcrow, or paragraph mark) was the standard mark used in manuscripts and printed books to indicate a new entry, a new section of the ledger. It appears before time and slow command durations: both are time-of-entry notations. The bookkeeper wrote the time of each transaction in the margin. The prompt repeats that practice.

The fill character `·` is the ruled dot — the faint blue ruling translated to the terminal, creating the columnar structure of the ledger page.

`›` and `‹` are lightweight marks — a fine quill nib, not a broad press. They fit the restrained aesthetic of the counting house.

### Module order and rationale

```
[navigation] [git] [languages] [performance] ··· [¶ time]
[cursor]
```

Left to right: where → what state → what's installed → how long. The username is omitted — the daybook does not record the clerk's name on every line.

### Spacing

```toml
format = "[ $path ]($style)"
```

One character of breathing room on each side. The entry text breathes within its column.

---

## Light Theme Notes

### How this works with syntax highlighters

Most syntax highlighters are calibrated for dark terminals. On a light terminal, the behavior shifts:

- **ANSI 0 (black)** is the darkest ink `#0E0A08` — used by highlighters for "comments" or "operators." On Daybook this produces very dark text, which is readable and appropriate.
- **ANSI 15 (bright white)** is the near-background cream `#F0EBE0`. A highlighter using this for "near-white" produces cream-on-paper — correct behavior.
- **ANSI 7 (white)** is the warm mid-parchment `#A09080` — a warm tan. Highlighters using this for "light text" will produce tan-on-cream, readable but subdued.

For best results, use a syntax highlighting theme that explicitly targets light terminals. The Daybook ANSI palette is calibrated so that all colors remain legible even when a dark-terminal highlighter is applied unchanged.

### Screen environments

Daybook is designed for **daylight** — afternoon light, office fluorescents, bright studio. On a dark-adapted display in a dim room, the light background may strain the eyes. This is by design: the daybook belongs on the writing desk, in the light.

On cool (blue-shifted) uncalibrated displays, the background may appear slightly more yellow than intended. The cream is warm, and a cool display will exaggerate that.

### Bold text

In iTerm2: disable "Use bright colors for bold text" (`Preferences › Profiles › Text`). In a light theme, bold text must be darker, not lighter. The Bold Color slot (`#0A0806`) handles this correctly when the option is off.

---

## Typography

Daybook is designed around **JetBrains Mono Nerd Font**.

### Why JetBrains Mono

- **Tall x-height** — weight contrast between uppercase and lowercase is pronounced. On a light background, weight contrast matters more than in dark themes.
- **Weight contrast** — `regular` (muted chrome) and `bold` (directory) are visually distinct. Bold reads as a heavier pen stroke — more ink.
- **Nerd Font integration** — all language glyphs occupy a consistent width.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular
Size:         13pt
Line spacing: 1.1
```

## Visual Hierarchy

```
BOLD     directory path          the main entry — the primary column
REGULAR  git branch, languages   the contextual columns
DIM      chrome, time, duration  the marginal annotation — the time of entry
```

`dim` is applied via `"fg:muted dim"`. In a light theme, `dim` reduces opacity of an already-dark token — the faded annotation, barely legible at the edge of the page.

The `bold fg:primary` on directory is the only bold element in the prompt. One heavy stroke per line.

---

## Interaction States

### Success (exit 0)

```
›
↑
fg:accent  (rubrication rust — the total has been struck through, the entry is complete)
```

### Error (exit ≠ 0)

```
›
↑
fg:error  (dark crimson — the correction mark, the red ink of the error)
```

The character does not change. The shape `›` is consistent. The color is the signal.

In Daybook, `accent` and `error` are both warm-dark in the red-brown family. The distinction is clear: accent `#884830` is rust-brown — the working rubrication ink, intentional and authoritative. Error `#882020` is dark crimson — the correction mark, the entry that should not have been made.

### Vim normal mode

```
‹
↑
fg:primary  (ruling blue — navigating the page, not writing)
```

`‹` is the inverse of `›`. The direction reversal maps to mode semantics.

### Slow command (> 2s)

```
[ ~/path ][ branch ] ···················· [¶ 3.2s]  [¶ 14:32]
```

Duration styled `fg:muted dim`. Threshold is 2000ms.

---

## Contrast Compliance

All tokens verified against background `#F2EEE6`. Contrast measured as dark token against light background.

```
Background luminance: 0.866

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #284878   0.066       7.9:1    AAA ✓
accent     #884830   0.101       6.1:1    AA  ✓
muted      #6A5E4E   0.116       5.5:1    AA  ✓
error      #882020   0.064       8.0:1    AAA ✓
fg         #1E1A14   0.011      15.1:1    AAA ✓
bold       #0A0806   0.004      16.9:1    AAA ✓
```

`primary` and `error` reach AAA — both must be fully legible in bright daylight, on reflective screens, on uncalibrated displays. `muted` at 5.5:1 passes AA but does not reach AAA: it is the annotation at the edge of the page, not the entry.

---

## File Reference

```
themes/daybook/
├── daybook.json           source of truth
├── daybook.md             this document
├── starship.toml
├── iterm2.itermcolors
├── alacritty.toml
├── kitty.conf
├── wezterm.lua
├── ghostty
├── windows-terminal.json
├── vscode.json
├── neovim.lua
├── intellij.icls
└── zed.json
```

### starship.toml

```toml
palette = "daybook"

[palettes.daybook]
primary = "#284878"
accent  = "#884830"
muted   = "#6A5E4E"
error   = "#882020"
```

---

## Install

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

### Starship

```bash
npx github:marvinrichter/gloam daybook starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/daybook/iterm2.itermcolors`
3. `Color Presets ▾` → select `daybook`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

**Light theme:** Disable "Use bright colors for bold text" (`Preferences › Profiles › Text`).

### Alacritty

```bash
npx github:marvinrichter/gloam daybook alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam daybook kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam daybook wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam daybook ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam daybook windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam daybook vscode
```

### Neovim

```bash
npx github:marvinrichter/gloam daybook neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme daybook")
```

### IntelliJ / JetBrains IDEs

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/daybook/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam daybook zed
```

---

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string (before `$cmd_duration`)
2. Configure with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. In a light theme, verify the color reads as darker than the background — all tokens must be darker than the page.

### Changing the base hue

The palette hue is 222° (ruling blue), 24° (rubrication rust), 34° (paper shadow), 0° (correction crimson). To shift toward a cooler variant — a Victorian blueprint or cyanotype rather than an ink ledger — replace the primary with a deeper Prussian blue and cool the muted toward neutral gray.

### Adding a fifth token

Add it to `[palettes.daybook]` with a name and hex value. Reference it as `fg:tokenname`. Verify contrast ≥ 4.5:1 against `#F2EEE6`. Any new token must be **darker** than the background — this is a light theme.

---

## Design Notes

### Accent / muted contrast proximity

Accent `#884830` (6.1:1) and muted `#6A5E4E` (5.5:1) are only 0.6:1 apart in contrast against the `#F2EEE6` background. In the rendered prompt, their visual separation relies on the `dim` modifier applied to muted elements (`fg:muted dim`). Without `dim`, accent and muted render at similar weight — on displays or in terminals that do not support `dim`, the fill, time, and duration chrome may not recede as intended. If your terminal does not visually distinguish `dim` text, consider bumping the muted token one step lighter (higher contrast ratio) to increase passive separation from accent.

### Using Daybook alongside dark themes

Daybook pairs well with Nocturne (warm dark) or Eventide (cool dark). Both the terminal color profile and the starship config need to switch together. One approach: separate iTerm2 profiles for day and night, each referencing a different `STARSHIP_CONFIG` path.
