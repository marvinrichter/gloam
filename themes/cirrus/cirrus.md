# Cirrus — Design System

> A terminal prompt and color theme for high-altitude clouds at midday.

---

## Concept

Cirrus clouds form between 6,000 and 12,000 meters, in the upper troposphere, where the temperature is −40°C to −60°C. They are made entirely of ice crystals, not water droplets. They are too thin to produce rain. They are the highest clouds visible to the naked eye, and they transmit more light than they block — the sky remains blue beneath them. The shadows they cast are lavender, not gray.

Cirrus means *lock of hair* in Latin. The clouds are wispy, fibrous, arranged by jet stream winds into streaks and hooks. They appear in a sky that is otherwise perfectly clear.

The theme is not about weather. It is about a specific quality of light — the cold precision of midday at altitude, where the air is thin and the colors have nowhere to scatter.

| Decision | Reasoning |
|---|---|
| Background `#EEF1F6` | Sky-white with a faint blue cast. Not paper-white, not gray-white — the specific tint of a sky viewed from altitude through thin ice crystal haze. |
| Foreground `#181C28` | Deep cold prussian dark. Not warm brown or neutral black — the darkness at the base of a clear blue sky, the depth you can see to when the air is clean. |
| Primary `#1E4888` | Prussian blue sky — the deep, clear blue seen between cirrus streaks at midday. Where you are in the filesystem holds the authority of the full sky. |
| Accent `#1A7060` | Teal-green at altitude — the green-shifted hue of ice-scattered light at the cloud boundary, distinct from the pure blue of the open sky. Git status and the cursor carry the precision of the instrument. |
| Muted `#506098` | Lavender cloud shadow — the shadow cast by cirrus is never gray. It has blue-violet in it, the color cast by the ice crystals diffracting the light obliquely. |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against background `#EEF1F6`. Contrast is measured as **dark token against light background**.

```
primary    #1E4888   hsl(222°, 64%, 33%)   prussian sky blue   7.9:1  AAA
accent     #1A7060   hsl(163°, 62%, 28%)   teal-green ice      5.3:1  AA
muted      #506098   hsl(228°, 31%, 46%)   lavender shadow     5.4:1  AA
error      #882028   hsl(353°, 63%, 34%)   danger red          8.1:1  AAA
```

### Assignment rules

```
[ ~/path ][ branch ~2 +1 ]·················[∘ 14:32]
     ↑         ↑      ↑   ↑             ↑   ↑
  primary     accent accent muted      muted muted
›
↑
accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules use `primary` — they are navigation-tier, the clear sky you are moving through. Command duration uses `muted dim` — the cloud shadow passing over.

### Why only four tokens?

Cirrus is a study in minimal material. The ice crystals are so fine and so sparse that they can barely be seen. Four tokens map to the four elements of the high-altitude sky:

```
High attention:  accent  — git status, prompt character, cursor (teal horizon)
Medium:          primary — where you are, what language you are in (prussian sky)
Low:             muted   — what time it is, chrome (lavender shadow)
Exception:       error   — danger, loss of altitude (warning red)
```

In a light theme, hierarchy is darkness. `primary` at 7.9:1 is the deepest blue — the full sky, authoritative. `accent` at 5.5:1 is the horizon teal — present and precise, but lower. `muted` at 5.4:1 is the shadow — still readable, but receding.

---

## ANSI Palette

### Light theme ANSI philosophy

Every ANSI color must be dark enough to read against the light background. ANSI 15 (bright white) becomes a near-background sky-white rather than a bright foreground. The foreground `#181C28` is set via the terminal Foreground Color slot directly — not in the ANSI palette.

All 16 ANSI colors are dark enough to display legibly on `#EEF1F6`.

### Design logic

| Slot | Hex | Role | Mapped from |
|---|---|---|---|
| ANSI 0 (black) | `#080C18` | terminal black = deep prussian night | cold inkblack |
| ANSI 8 (bright black) | `#505870` | comments, dim text | mid-dark cold slate |
| ANSI 12 (bright blue) | `#506098` | **= muted** | muted token |
| ANSI 13 (bright magenta) | `#1A7060` | **= accent** | accent token |
| ANSI 15 (bright white) | `#F0F4F8` | near-background sky — not white | background lightened |
| ANSI 9 (bright red) | `#882028` | **= error** | error token |
| ANSI 4 (blue) | `#182858` | links, deep navy | primary-adjacent navy |

### Full palette

```
Normal                              Bright
──────────────────────────────────  ──────────────────────────────────────────
0  #080C18  prussian night-black     8  #505870  mid-dark cold slate
1  #702020  dark red                 9  #882028  danger red ← error
2  #205428  dark forest green       10  #287038  deep olive-green
3  #504818  dark warm brown         11  #785820  amber-brown
4  #182858  deep navy blue          12  #506098  lavender shadow ← muted
5  #482858  dark blue-violet        13  #1A7060  teal-green ice ← accent
6  #184050  dark deep teal          14  #288080  teal-cyan
7  #9098B8  cold gray-blue          15  #F0F4F8  near-background sky-white
```

### UI color slots

```
Background     #EEF1F6  sky-white with cold blue cast
Foreground     #181C28  deep prussian cold dark
Bold           #080C18  deepest prussian — weight + altitude together
Cursor         #1A7060  teal-green — the precise instrument reading
Cursor text    #EEF1F6  background inside cursor block
Selection      #D8E0EC  cold blue-tinted highlight — slightly darker sky
Selected text  #181C28  foreground on selection
Links          #1E4888  prussian blue — primary token
```

---

## Prompt Anatomy

### Layout

```
[ ~/gloam ][ main ~2 +1 ]·························[∘ 14:32]
›
```

Single line. No box frame. The high-altitude sky has no horizon visible from within — only the expanse above.

### Structural elements

```
·   U+00B7  MIDDLE DOT  (fill — thin ice crystal haze between modules)
∘   U+2218  RING OPERATOR  (time prefix, duration prefix — a small cold circle, a crystal)
›   U+203A  SINGLE RIGHT-POINTING ANGLE QUOTATION MARK  (success cursor)
‹   U+2039  SINGLE LEFT-POINTING ANGLE QUOTATION MARK  (vim normal mode)
```

`∘` (the ring operator) is a small, open circle — an ice crystal at distance, the cold mark of a point observed from altitude. It appears before time and slow command durations: both are observations recorded with precision.

The fill character `·` is the diffuse haze of thin cirrus — present, nearly invisible, connecting the information without obscuring it.

`›` and `‹` are clean, minimal marks — a precision instrument, not a decorative one. The weight fits the cold, clear aesthetic.

### Module order and rationale

```
[navigation] [git] [languages] [performance] ··· [∘ time]
[cursor]
```

The username is omitted. At altitude, the landscape does not have names for the person observing it.

### Spacing

```toml
format = "[ $path ]($style)"
```

One character of breathing room on each side.

---

## Light Theme Notes

### How this works with syntax highlighters

Cirrus is a cool-toned light theme. Most syntax highlighters assume a dark background and will render differently:

- **ANSI 0 (black)** is the deep prussian `#080C18` — highlighters using this for "operators" and "punctuation" will produce near-black marks on the light background. Readable and precise.
- **ANSI 15 (bright white)** is the sky-white `#F0F4F8` — near-background, not pure white. A highlighter using this for "near-white" fills will produce a sky-tinted area — imperceptible against the background.
- **ANSI 7 (white)** is the cold gray-blue `#9098B8` — highlighters using this for "light text" will produce a muted blue-gray on sky-white. Readable and cold.

For best results on a light terminal, use a syntax theme that explicitly targets light backgrounds.

### Screen environments

Cirrus is designed for **cold-light conditions** — north-facing windows, studio fluorescents with high color rendering, well-calibrated monitors. On warm (orange-shifted) uncalibrated displays, the background may appear slightly greener than intended — the blue cast will be absorbed into the orange bias.

The theme performs best at higher screen brightness (70–100%). At low brightness, the subtle cool tint in the background can become invisible, making it appear nearly white. Increase brightness or use a warmer theme in dim environments.

### Bold text

In iTerm2: disable "Use bright colors for bold text" (`Preferences › Profiles › Text`). Bold text must be darker, not lighter. The Bold Color slot (`#080C18`) handles this correctly when the option is off.

---

## Typography

Cirrus is designed around **JetBrains Mono Nerd Font**.

### Why JetBrains Mono

- **Tall x-height** — uppercase/lowercase contrast is pronounced. On a cool light background, weight contrast reads as precision.
- **Weight contrast** — `regular` (muted chrome) and `bold` (directory) are distinct. Bold is a heavier pen, more pressure, more ink.
- **Nerd Font integration** — language glyphs at consistent width and baseline.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular
Size:         13pt
Line spacing: 1.1
```

## Visual Hierarchy

```
BOLD     directory path          the sky itself — where you are looking
REGULAR  git branch, languages   the cirrus bands — structured, directional
DIM      chrome, time, duration  the shadow — where the light bends slightly
```

`dim` is applied via `"fg:muted dim"`. In a light theme, `dim` reduces the opacity of an already-receding token — the shadow fades further, the lavender dissolves into sky-white.

The `bold fg:primary` on directory is the only bold element in the prompt.

---

## Interaction States

### Success (exit 0)

```
›
↑
fg:accent  (deep teal — the horizon is clear, the instrument reads correctly)
```

### Error (exit ≠ 0)

```
›
↑
fg:error  (danger red — the reading is outside tolerance)
```

The character does not change. The shape `›` is consistent.

### Vim normal mode

```
‹
↑
fg:primary  (prussian blue — the full sky, steady, not moving forward)
```

`‹` is the inverse of `›`. Backward motion, backward glyph.

### Slow command (> 2s)

```
[ ~/path ][ branch ] ················ [∘ 3.2s]  [∘ 14:32]
```

Duration styled `fg:muted dim`. Threshold is 2000ms.

---

## Contrast Compliance

All tokens verified against background `#EEF1F6`. Contrast measured as dark token against light background.

```
Background luminance: 0.878

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #1E4888   0.067       7.9:1    AAA ✓
accent     #1A7060   0.127       5.3:1    AA  ✓
muted      #506098   0.123       5.4:1    AA  ✓
error      #882028   0.064       8.1:1    AAA ✓
fg         #181C28   0.012      15.0:1    AAA ✓
bold       #080C18   0.002      17.3:1    AAA ✓
```

`primary` and `error` reach AAA — both must be unambiguous in bright light, on reflective screens, on uncalibrated monitors. `accent` and `muted` pass AA. `muted` at 5.4:1 is the lowest value in the set — the lavender shadow is meant to recede.

---

## File Reference

```
themes/cirrus/
├── cirrus.json            source of truth
├── cirrus.md              this document
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
palette = "cirrus"

[palettes.cirrus]
primary = "#1E4888"
accent  = "#1A7060"
muted   = "#506098"
error   = "#882028"
```

---

## Install

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

### Starship

```bash
npx github:marvinrichter/gloam cirrus starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/cirrus/iterm2.itermcolors`
3. `Color Presets ▾` → select `cirrus`

In iTerm2: `Preferences › Profiles › Text › Font → JetBrainsMono Nerd Font, 13pt`

**Light theme:** Disable "Use bright colors for bold text" (`Preferences › Profiles › Text`).

### Alacritty

```bash
npx github:marvinrichter/gloam cirrus alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam cirrus kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam cirrus wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam cirrus ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam cirrus windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam cirrus vscode
```

### Neovim

```bash
npx github:marvinrichter/gloam cirrus neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme cirrus")
```

### IntelliJ / JetBrains IDEs

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/cirrus/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam cirrus zed
```

---

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string (before `$cmd_duration`)
2. Configure with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. Verify the color reads as darker than the background — all tokens must be darker than the sky.

### Changing the base hue

The palette hue is 222° (prussian sky), 197° (horizon teal), 228° (lavender shadow), 353° (danger red). To shift toward a warmer, more golden variant — cirrus at late afternoon rather than midday — push primary toward 210° and warm the background slightly toward `#F2EEE8`.

### Adding a fifth token

Add it to `[palettes.cirrus]` with a name and hex value. Verify contrast ≥ 4.5:1 against `#EEF1F6` before shipping. Any new token must be darker than the background.

---

## Design Notes

### Accent / muted contrast proximity

Accent `#1A7060` (5.3:1) and muted `#506098` (5.4:1) are 0.1:1 apart in contrast — the closest pairing in the gloam collection. Their visual separation in the prompt relies entirely on the `dim` modifier applied to muted elements: without dim, the fill and time chrome render at nearly the same visual weight as the git branch. This is the tightest margin in the system. On terminals that do not support `dim` (or that implement it at less than 40% intensity reduction), this pairing may collapse. Verify on your terminal before deploying in a professional context.

### Using Cirrus alongside dark themes

Cirrus pairs naturally with Fjord (cold dark) or Aether (cool dark). A terminal setup that switches from Cirrus in daylight to a dark theme at night — triggered by macOS auto appearance switching — is a natural workflow. Use separate iTerm2 profiles, each pointing to a different starship config via `STARSHIP_CONFIG`.
