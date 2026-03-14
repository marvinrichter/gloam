# Umbra — Design System

> A terminal prompt and iTerm2 color theme for the edge of total darkness.

---

## Concept

Umbra names the phenomenon precisely: the full shadow, the region where no light reaches. But this theme inhabits the penumbra — the partial shadow at the boundary, where darkness is almost complete but not quite. The background is not pure black. It holds the faintest trace of something, a barely-perceptible blue-gray residue that makes the void feel inhabited rather than empty.

The concept is mathematical before it is aesthetic. Shadow geometry distinguishes three zones: the umbra (total shadow), the penumbra (partial shadow), and the antumbra (the region beyond, where light surrounds). The color system maps these zones to information hierarchy:

| Zone | Analogy | Token | Role |
|---|---|---|---|
| Antumbra | Full light | foreground `#E4E8F0` | body text, readable content |
| Penumbra edge | Light arriving | primary `#A0B4C8` | navigation, language context |
| Penumbra core | Boundary, transition | accent `#8B6CF0` | git state, cursor, attention |
| Umbra | Near-darkness | muted `#728090` | chrome, time, ambient info |
| Void | Below perception | background `#070708` | the ground |

Every design decision maps to that geometry:

| Decision | Reasoning |
|---|---|
| Background `#070708` | The penumbra casts shadow over near-black, not pure black. `#000000` has no memory of light. `#070708` holds a trace. |
| Foreground `#E4E8F0` | Pre-dawn sky is not white. It is a blue-washed pale that precedes direct sunlight — cooler than noon, warmer than void. |
| Primary `#A0B4C8` | The color of sky at 4:47am — the moment before the horizon shows any warmth. Blue-silver, cold, clear. |
| Accent `#8B6CF0` | Amethyst violet: the boundary color. At the penumbra edge, scattered light produces violet before any other hue appears. |
| Muted `#728090` | Shadow slate: the color of surfaces still in partial shadow, neither illuminated nor fully dark. |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against background `#070708`.

```
primary    #A0B4C8   hsl(210°, 22%, 70%)   pale morning blue     9.5:1  AAA
accent     #8B6CF0   hsl(258°, 82%, 68%)   amethyst violet       5.3:1  AA
muted      #728090   hsl(213°, 11%, 50%)   shadow slate          5.0:1  AA
error      #DC5858   hsl(0°, 64%, 60%)     crimson               5.4:1  AA
```

### Assignment rules

```
 ~/path   branch status  ···················  · time
  ↑        ↑      ↑      ↑                  ↑   ↑
  primary  accent accent fill (muted dim)  muted muted
▹
↑
accent (success) / error (fail) / primary (vim)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language and environment modules (`node`, `python`, `rust`, …) use `primary` — they are navigation-tier information, telling you what context you are in. Command duration uses `muted dim` — supporting information, present only when slow. The fill character `·` uses `muted dim` — it disappears into the chrome.

### Why only four tokens?

A terminal prompt is information density work. More distinct hues create noise, not clarity. Four tokens produce exactly one visual hierarchy:

```
High attention:  accent  — git status, prompt character, cursor
Medium:          primary — where you are, what language you are in
Low:             muted   — what time it is, how long it took, decorative fill
Exception:       error   — something is broken
```

### Four-token rationale

The Umbra system deliberately omits a username token. The single-line layout has no room for identity chrome — and in practice, you know who you are. Removing `$username` reduces horizontal noise and gives more width to the directory path, which is the most actionable navigation information.

---

## ANSI Palette

The 16-color ANSI palette is derived from the semantic tokens and the shadow-geometry concept. Syntax highlighters, `ls`, `git log`, `grep` — all will harmonize with the prompt automatically.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#070708` | terminal black = background | background |
| ANSI 8 (bright black) | `#1A1C20` | comments, dim text | background + slight lift |
| ANSI 12 (bright blue) | `#728090` | **= muted** | muted token |
| ANSI 13 (bright magenta) | `#8B6CF0` | **= accent** | accent token |
| ANSI 15 (bright white) | `#E4E8F0` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#DC5858` | **= error** | error token |
| ANSI 7 (white) | `#707880` | medium slate — fallback text | near muted |

The normal ANSI variants (0–7) are deliberately dimmer — they appear in backgrounds, disabled states, and legacy contexts where the bright variants are too prominent. The bright slots (8–15) carry the semantic weight.

### Full palette

```
Normal                              Bright
──────────────────────────────────  ────────────────────────────────────
0  #070708  near-void (bg)          8  #1A1C20  near-black (comments)
1  #9A3838  dark crimson            9  #DC5858  crimson ← error
2  #487850  shadow green           10  #607870  muted sage
3  #907840  dim gold               11  #A09060  pale gold
4  #3858A0  deep slate blue        12  #728090  shadow slate ← muted
5  #7858A8  shadow violet          13  #8B6CF0  amethyst violet ← accent
6  #387880  dim teal               14  #507878  dim cyan
7  #707880  medium slate           15  #E4E8F0  pale dawn ← foreground
```

---

## UI Colors

```
Background     #070708   near-void — barely not black
Foreground     #E4E8F0   pale dawn blue-white
Bold           #F0F4FF   blue-white bright — weight carries bold, cooler than body
Cursor         #8B6CF0   amethyst violet — accent, visible against near-void
Cursor text    #070708   background inside cursor block
Selection      #121420   slightly lighter near-black — visible but not jarring
Selected text  #E4E8F0   foreground on selection
Links          #A0B4C8   pale morning blue — primary, readable, distinct from body
```

The cursor in amethyst violet is the brightest non-text element in the entire UI. It snaps to attention immediately against the near-void background. This is intentional — the cursor is where you are; it should be findable without scanning.

---

## Prompt Anatomy

### Layout

```
 ~/gloam   main ~2 +1  ·····················  · 04:47
▹
```

Single line. All information on one horizontal plane. The cursor line is minimal — one glyph, no decoration.

### Structural elements

```
▹   U+25B9  WHITE RIGHT-POINTING SMALL TRIANGLE  (success / error character)
◃   U+25C3  WHITE LEFT-POINTING SMALL TRIANGLE   (vim normal mode)
·   U+00B7  MIDDLE DOT  (fill character, time prefix, duration prefix)
```

The fill character `·` is used in three positions: as the repeating fill between content and time, as the time prefix (`· 04:47`), and as the duration prefix (`· 3.2s`). A single repeated glyph unifies all chrome — the `·` marks ambient information without introducing a new visual token.

`▹` and `◃` are small, directional, geometric. They do not compete with text. The direction reversal in vim mode maps to mode semantics — forward motion vs. backward editing.

### Module order and rationale

```
[navigation] [git] [languages] [performance] ··· [time]
[cursor]
```

Left to right: where → what state → what's installed → how long. Time lives at the right edge because it is ambient, not actionable. Identity (`$username`) is omitted — the single-line layout prioritizes actionable navigation over identity chrome.

Languages only appear when detected. `$fill` expands to push time right regardless of how many languages are visible.

### Spacing

Each module's `format` begins and ends with a space inside the brackets:

```toml
format = "[ $path ]($style)"
```

This creates 1 character of breathing room on each side. No module-specific padding logic — every module participates equally.

---

## Typography

Starship renders in whatever font the terminal is configured with. The Umbra system is designed around **JetBrains Mono Nerd Font**.

### Why JetBrains Mono

JetBrains Mono was designed for terminal/IDE use at small sizes. Its key properties:

- **Tall x-height** — the difference between uppercase and lowercase is pronounced. `~/path` is immediately readable.
- **Ligature support** — `▹` and `·` render at consistent optical width without collision.
- **Nerd Font integration** — all language glyphs (, , , etc.) occupy a consistent width and sit at the correct optical baseline.
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
npx github:marvinrichter/gloam umbra starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/umbra/iterm2.itermcolors`
3. `Color Presets ▾` → select `umbra`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.
### Alacritty

```bash
npx github:marvinrichter/gloam umbra alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam umbra kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam umbra wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam umbra ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam umbra windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam umbra vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam umbra neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme umbra")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/umbra/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam umbra zed
```
## Visual Hierarchy

Three weights of attention in every rendered prompt line:

```
BOLD     directory path          the most actionable information
REGULAR  git branch, languages   contextual — useful but not urgent
DIM      chrome, time, duration  ambient — available if you look for it
```

`dim` is applied via the `dim` style modifier: `"fg:muted dim"`. In most terminals this renders at approximately 50% intensity of the same hue. It is the typographic equivalent of a caption.

The `bold fg:primary` on directory is the only bold element in the prompt. One bold element per line is sufficient. Everything else defers to it.

---

## Interaction States

### Success (exit 0)

```
▹
↑
fg:accent  (amethyst violet)
```

### Error (exit 0)

```
▹
↑
fg:error  (crimson)
```

The character itself does not change — only its color. The shape `▹` remains consistent. Operators learn to read the color, not scan for a new glyph.

### Vim normal mode

```
◃
↑
fg:primary  (pale morning blue)
```

`◃` is the mirror of `▹`. The direction reversal maps to mode semantics — you are now moving backward through the editing model. The shift to primary color signals a contextual change without requiring a second shape vocabulary.

### Slow command (> 2s)

```
 ~/path  ·····················  · 3.2s  · 04:47
```

Duration appears between languages and fill, styled `fg:muted dim`. The `·` prefix matches the time prefix — both are ambient chrome, sharing the same glyph signals that both are time-related. The threshold is 2000ms — fast commands produce no noise.

---

## Contrast Compliance

All tokens verified against background `#070708` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.002

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #A0B4C8   0.443       9.5:1    AAA ✓
accent     #8B6CF0   0.224       5.3:1    AA  ✓
muted      #728090   0.209       5.0:1    AA  ✓
error      #DC5858   0.230       5.4:1    AA  ✓
foreground #E4E8F0   0.779      16.4:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). All tokens exceed this. `primary` reaches AAA — it is visible even with screen glare, in dark environments, and on uncalibrated displays. `accent`, `muted`, and `error` all clear AA by a margin that accounts for `dim` modifier usage.

Note on `muted dim`: the `dim` style modifier reduces intensity by approximately 50%, which would lower muted's effective contrast to approximately 2.5:1. Dim text is intentional ambient chrome, not body text — it is not subject to body-text contrast thresholds.

---

## File Reference

```
themes/umbra/
├── umbra.json           source of truth
├── umbra.md             this document
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
palette = "umbra"

[palettes.umbra]
primary = "#A0B4C8"
accent  = "#8B6CF0"
muted   = "#728090"
error   = "#DC5858"
```

The palette block is the single source of truth. To adapt Umbra to a different base hue, change only this block. All modules reference tokens (`fg:primary`, `fg:accent`, etc.) — nothing is hardcoded in the module configs.

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
npx github:marvinrichter/gloam umbra starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/umbra/iterm2.itermcolors`
3. `Color Presets ▾` → select `umbra`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.
### Alacritty

```bash
npx github:marvinrichter/gloam umbra alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam umbra kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam umbra wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam umbra ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam umbra windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam umbra vscode
```

Reload VS Code (`Cmd+Shift+P` → **Reload Window**), then select the theme via `Cmd+K Cmd+T`.

### Neovim

```bash
npx github:marvinrichter/gloam umbra neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme umbra")
```

### IntelliJ / JetBrains IDEs

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/umbra/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam umbra zed
```
## Extending the System

### Adding a module

1. Add `$module_name\` to the format string on the first line (before `$cmd_duration`)
2. Configure the module with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. No other changes needed — spacing and color are inherited

### Changing the base hue

The palette hues are approximately 210° (primary blue), 258° (accent violet), 213° (muted slate), 0° (error red). To shift the system toward a different time-of-day analogy — warmer pre-dawn, colder deep night — adjust the HSL hue values in `[palettes.umbra]`. The shadow-to-light gradient is preserved as long as accent remains warmer than primary.

### Adding a fifth token

Add it to `[palettes.umbra]` with a name and hex value. Reference it as `fg:tokenname` in any module format string. Verify contrast ≥ 4.5:1 against `#070708` before shipping. Shadow-geometry rationale: a fifth token should map to a distinct zone or phenomenon in the penumbra model, not just a preferred color.

### Adapting for light mode

Umbra is a near-void dark theme. It has no light-mode variant and is not designed to be inverted. The near-void background is structural — inverting it to near-white would require a complete re-derivation of the palette using a different atmospheric metaphor.
