# Petrichor — Design System

> A terminal prompt and color theme for the moment before rain.

---

## Concept

Petrichor is the word for the smell of rain on dry earth — coined in 1964 from the Greek *petra* (stone) and *ichor* (the fluid in the veins of the gods). The actual mechanism: actinobacteria in soil produce geosmin, which is released as aerosols when the first raindrops hit dry ground. The smell precedes the rain itself.

The theme is not about rain falling. It is about the minute before it falls. The air pressure is dropping. The temperature shifts. The ozone smell arrives first. The dry grass and earth still hold the warmth of the day. There is a tension between the cool electric sky and the warm ground that hasn't yet given way.

| Decision | Reasoning |
|---|---|
| Background `#0A0C0A` | Pre-storm earth at night. The green undertone distinguishes it from a simple near-black. The sky is darkening, the ground is still warm. |
| Foreground `#D8DCCC` | Pale sky before the storm front arrives — not quite white, with a slight yellow-green cast from the underlit clouds. |
| Primary `#78C888` | New grass green — the grass that already grew from the last rain. Where you are is rooted, vegetative, present. |
| Accent `#48B8E8` | Ozone electric blue — clear sky-blue carrying the static charge ahead of the storm front. The hue is pushed to hsl 198° (distinctly blue, not teal) to ensure at least 63° of hue separation from the grass-green primary (hsl 135°), removing the blue-green collapse zone that affects deuteranomalous perception. |
| Muted `#78806A` | Dry earth surface — the ochre-gray of topsoil just before moisture. Chrome and time annotations hold the ambient warmth. |

---

## Color System

### Semantic tokens

Four named tokens cover every prompt use case. All verified against background `#0A0C0A`.

```
primary    #78C888   hsl(135°, 36%, 63%)   new grass green    9.8:1  AAA
accent     #48B8E8   hsl(198°, 74%, 59%)   ozone electric     8.7:1  AAA
muted      #78806A   hsl(82°,   9%, 46%)   dry earth          4.9:1  AA
error      #D05858   hsl(0°,   56%, 58%)   storm warning red  4.9:1  AA
```

### Assignment rules

```
[ ~/path ][ branch ~2 +1 ]────────────────[∼ 14:32]
     ↑         ↑      ↑   ↑              ↑  ↑
  primary     accent accent muted       muted muted
›
↑
accent (success) / error (fail)
```

One rule governs the whole system: **muted for chrome, primary for navigation, accent for git and the cursor.**

Language/environment modules use `primary` — they are navigation-tier information. Command duration uses `muted dim` — it is ambient, like the warmth still rising from the ground.

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
| ANSI 0 (black) | `#0A0C0A` | terminal black = background | background |
| ANSI 8 (bright black) | `#181C18` | comments, dim text | background + slight lift |
| ANSI 10 (bright green) | `#78C888` | **= primary** | primary token |
| ANSI 12 (bright blue) | `#78806A` | **= muted** | muted token |
| ANSI 13 (bright magenta) | `#48B8E8` | **= accent** | accent token |
| ANSI 15 (bright white) | `#D8DCCC` | **= foreground** | foreground |
| ANSI 9 (bright red) | `#D05858` | **= error** | error token |
| ANSI 14 (bright cyan) | `#60C8A0` | strings, links | cool mint-cyan |

The "normal" ANSI variants are deliberately dimmer — they appear in backgrounds, disabled states, and legacy contexts where the bright variants are too prominent.

### Full palette

```
Normal                              Bright
──────────────────────────────────  ──────────────────────────────────────────
0  #0A0C0A  pre-storm dark earth     8  #181C18  dim near-black (stormy)
1  #804040  dark rust-red            9  #D05858  storm warning red ← error
2  #408040  dark forest green       10  #78C888  new grass green ← primary
3  #908040  dark dry grass          11  #B0C070  bright sage-yellow
4  #384878  dark slate blue         12  #78806A  dry earth muted ← muted
5  #684878  dark muted purple       13  #48B8E8  ozone electric ← accent
6  #388888  dark teal               14  #60C8A0  cool mint-cyan
7  #788070  earthen gray-green      15  #D8DCCC  pale sky ← foreground
```

### UI color slots

```
Background     #0A0C0A  pre-storm dark earth
Foreground     #D8DCCC  pale sky before the front
Bold           #D8DCCC  same as foreground
Cursor         #48B8E8  ozone electric — accent token
Cursor text    #0A0C0A  background inside cursor block
Selection      #182018  dark stormy highlight
Selected text  #D8DCCC  foreground on selection
Links          #78C888  grass green — primary token, rooted and present
```

---

## Prompt Anatomy

### Layout

```
[ ~/gloam ][ main ~2 +1 ]─────────────────────[∼ 14:32]
›
```

Single line. No box frame. The pre-rain landscape is open — the horizon is visible, the sky is wide.

### Structural elements

```
─   U+2500  BOX DRAWINGS LIGHT HORIZONTAL  (fill — the ground line before rain)
∼   U+223C  TILDE OPERATOR  (time prefix, duration prefix — wave, approaching front)
›   U+203A  SINGLE RIGHT-POINTING ANGLE QUOTATION MARK  (success cursor)
‹   U+2039  SINGLE LEFT-POINTING ANGLE QUOTATION MARK  (vim normal mode)
```

`∼` (the tilde operator) reads as a wave — the pressure wave advancing ahead of the weather system. It appears before both the time and slow command durations: both are temporal markers, the ticking of a clock while you wait for the rain.

The fill character `─` is the ground line — steady, horizontal, holding the landscape flat while the sky above charges.

### Module order and rationale

```
[navigation] [git] [languages] [performance] ── [∼ time]
[cursor]
```

Left to right: where → what state → what's installed → how long. The username is omitted — the landscape does not know who you are.

### Spacing

Each module's `format` begins and ends with a space inside the brackets:

```toml
format = "[ $path ]($style)"
```

One character of breathing room on each side. No module-specific padding logic.

---

## Typography

Petrichor is designed around **JetBrains Mono Nerd Font**.

### Settings

```
Font:         JetBrainsMono Nerd Font
Weight:       Regular  (bold handled per-module by starship)
Size:         13pt     (readable density; 14pt for large displays)
Line spacing: 1.1
```

## Visual Hierarchy

```
BOLD     directory path          the most actionable information
REGULAR  git branch, languages   contextual — useful but not urgent
DIM      chrome, time, duration  ambient — the warmth in the ground
```

`dim` is applied via the `dim` style modifier: `"fg:muted dim"`. The dry earth hue at half intensity recedes further — soil drying toward dust.

The `bold fg:primary` on directory is the only bold element in the prompt.

---

## Interaction States

### Success (exit 0)

```
›
↑
fg:accent  (ozone electric — the charge released)
```

### Error (exit ≠ 0)

```
›
↑
fg:error  (storm warning red — the front has arrived)
```

The character does not change — only its color.

### Vim normal mode

```
‹
↑
fg:primary  (grass green — settled into the land, not moving forward)
```

`‹` is the inverse of `›`. Backward motion, backward glyph.

### Slow command (> 2s)

```
[ ~/path ][ branch ] ──────────────── [∼ 3.2s]  [∼ 14:32]
```

Duration appears between languages and fill, styled `fg:muted dim`. The threshold is 2000ms.

---

## Contrast Compliance

All tokens verified against background `#0A0C0A` using the WCAG 2.1 relative luminance formula.

```
Background luminance: 0.00351

Token      Hex       Luminance  Contrast  Level
─────────  ────────  ─────────  ────────  ──────────
primary    #78C888   0.475       9.8:1    AAA ✓
accent     #48B8E8   0.416       8.7:1    AAA ✓
muted      #78806A   0.210       4.9:1    AA  ✓
error      #D05858   0.211       4.9:1    AA  ✓
foreground #D8DCCC   0.702      14.1:1    AAA ✓
```

Minimum threshold: 4.5:1 (WCAG AA for normal text). `muted` and `error` pass AA but do not reach AAA — they are the quietest elements in the system. `primary` and `accent` both reach AAA.

---

## File Reference

```
themes/petrichor/
├── petrichor.json         source of truth
├── petrichor.md           this document
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
palette = "petrichor"

[palettes.petrichor]
primary = "#78C888"
accent  = "#48B8E8"
muted   = "#78806A"
error   = "#D05858"
```

---

## Install

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

### Starship

```bash
npx github:marvinrichter/gloam petrichor starship
```

### iTerm2

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/petrichor/iterm2.itermcolors`
3. `Color Presets ▾` → select `petrichor`

### Alacritty

```bash
npx github:marvinrichter/gloam petrichor alacritty
```

### Kitty

```bash
npx github:marvinrichter/gloam petrichor kitty
```

### WezTerm

```bash
npx github:marvinrichter/gloam petrichor wezterm
```

### Ghostty

```bash
npx github:marvinrichter/gloam petrichor ghostty
```

### Windows Terminal

```bash
npx github:marvinrichter/gloam petrichor windows-terminal
```

### VS Code

```bash
npx github:marvinrichter/gloam petrichor vscode
```

### Neovim

```bash
npx github:marvinrichter/gloam petrichor neovim
```

Add to `init.lua`:

```lua
vim.cmd("colorscheme petrichor")
```

### IntelliJ / JetBrains IDEs

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/petrichor/intellij.icls`.

### Zed

```bash
npx github:marvinrichter/gloam petrichor zed
```

---

## Extending the System

### Adding a module

1. Add `$module_name\` to the format string (before `$cmd_duration`)
2. Configure the module with `style = "fg:primary"` and `format = "[ $symbol($version) ]($style)"`
3. No other changes needed

### Changing the base hue

The palette hue is 135° (grass green), 198° (ozone electric), 82° (dry earth), 0° (storm warning). To shift the system toward a wetter, more lush variant — after the rain, not before — push the primary toward 155°, the muted toward 120°, and warm the background by one notch toward green.

---

## Design Notes

### Muted and error contrast proximity

Muted `#78806A` (4.9:1) and error `#D05858` (4.9:1) are the tightest-margin token pair in the gloam collection — both sit 0.4:1 above the WCAG AA floor of 4.5:1 on the `#0A0C0A` background. This is intentional: dry earth (muted) and storm warning (error) are both present and slightly alarming in pre-storm conditions. Both tokens are deliberately near the AA threshold rather than pushed to AAA. Users on uncalibrated displays should note this minimal margin — either token could fall below AA on display brightness settings below 50%.

### Cross-collection note (Petrichor / Absinthe)

Petrichor and Absinthe are both dark themes built on a grass-green primary. The key distinctions: Absinthe uses a gold accent (hsl 38°, warm alchemical register), Petrichor uses a clear sky-blue accent (hsl 198°, electric storm register). Absinthe's concept is art-nouveau chemistry — the forbidden liqueur. Petrichor's is geosmin and storm physics — the dry earth before rain. The green ground is shared; everything else differs. See also absinthe.md.

### Adding a fifth token

Add it to `[palettes.petrichor]` with a name and hex value. Verify contrast ≥ 4.5:1 against `#0A0C0A` before shipping.
