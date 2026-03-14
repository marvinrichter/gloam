# gloam

Twelve terminal and editor theme design systems. Each built from a single atmospheric concept: semantic color tokens, a matched 16-color ANSI palette, and generated configs for every major terminal emulator and IDE.

Every token in every theme clears 4.5:1 contrast against its background. Not as a selling point — as a baseline.

**Supported targets:** Starship · iTerm2 · Alacritty · Kitty · WezTerm · Ghostty · Windows Terminal · VS Code · Neovim · IntelliJ · Zed

---

## Contents

- [Themes](#themes)
  - [Eventide](#eventide)
  - [Aether](#aether)
  - [Ember](#ember)
  - [Absinthe](#absinthe)
  - [Verdigris](#verdigris)
  - [Sable](#sable)
  - [Fjord](#fjord)
  - [Umbra](#umbra)
  - [Cordovan](#cordovan)
  - [Tungsten](#tungsten)
  - [Amethyst](#amethyst)
  - [Parchment](#parchment)
- [Design System](#design-system)
- [Install](#install)
  - [Prerequisites](#prerequisites)
  - [Starship](#starship)
  - [VS Code](#vs-code)
  - [Neovim](#neovim)
  - [iTerm2](#iterm2--manual-import)
  - [IntelliJ / JetBrains IDEs](#intellij--jetbrains-ides--manual-import)
- [Structure](#structure)
- [Contributing](#contributing)

## What makes gloam different

Each theme starts with a specific atmospheric or material moment — not a color preference, but a concept with constraints. Color choices must be defensible from that concept. The four-token semantic model (`primary`, `accent`, `muted`, `error`) keeps prompt elements consistent across every theme: wherever you expect the directory, the git branch, the time — they are always in the same token role, with different colors but the same structure.

Every token in every theme clears WCAG AA 4.5:1 against its background. The generator produces all 11 format files from a single JSON source, so themes are never hand-tuned per-target. Change one value in the JSON and every format regenerates in sync.

---

## Themes

### Eventide

> The moment between day and night. Deep indigo sky, warm gold navigation, twilight lavender chrome, sunset coral git.

```
╭  user  ~/gloam  ❯  main ~2  ────────────────────────────  ◆ 14:32
╰─❯
```

| Token | Hex | Role |
|---|---|---|
| primary | `#E8B86D` | warm gold — directory, languages |
| accent | `#FF7F57` | sunset coral — git, cursor |
| muted | `#8B84C4` | twilight lavender — chrome, time |
| error | `#E85D5D` | aurora red |

Background `#0D0F1A` · Foreground `#F0EAD6` · Layout: two-line box · Fill: `─` · Cursor: `❯`

[Design system guide →](themes/eventide/eventide.md)

---

### Aether

> Deep space observatory. Running code at the edge of the universe. The background holds residual violet-blue — the void between galaxies.

```
╭  user  ~/gloam  ⟫  main ~2  ················  ✦ 14:32
╰─⟫
```

| Token | Hex | Role |
|---|---|---|
| primary | `#5EE8B8` | aurora green — directory, languages |
| accent | `#C084FC` | nebula violet — git, cursor |
| muted | `#8886B0` | cosmic dust — chrome, time |
| error | `#FF6B6B` | solar flare |

Background `#0C0B1A` · Foreground `#D4D8F0` · Layout: two-line box · Fill: `·` · Cursor: `⟫`

[Design system guide →](themes/aether/aether.md)

---

### Ember

> The watch fire at 3am. The entire world is orange and black. The background is deep charcoal-brown — not pure black, but warm, like cooling coal.

```
╭  user  ~/gloam  ❯  main ~2  ················  ◈ 14:32
╰─❯
```

| Token | Hex | Role |
|---|---|---|
| primary | `#FFAB40` | ember amber — directory, languages |
| accent | `#FF6D00` | active flame — git, cursor |
| muted | `#9E8E78` | smoke gray-brown — chrome, time |
| error | `#FF4040` | sudden flare |

Background `#111008` · Foreground `#F5EDD4` · Layout: two-line box · Fill: `·` · Cursor: `❯`

[Design system guide →](themes/ember/ember.md)

---

### Absinthe

> La fée verte. Vintage chemistry lab, art nouveau, the forbidden liqueur glowing green in candlelight. Single-line layout — alchemical precision.

```
 ~/gloam   main ~2  ···························  ◇ 14:32
▸
```

| Token | Hex | Role |
|---|---|---|
| primary | `#70E0A0` | absinthe green — directory, languages |
| accent | `#E8C848` | golden anise — git, cursor |
| muted | `#7A8A7A` | wormwood gray — chrome, time |
| error | `#E05858` | toxic warning |

Background `#080D0A` · Foreground `#D8E8D4` · Layout: single-line · Fill: `·` · Cursor: `▸`

[Design system guide →](themes/absinthe/absinthe.md)

---

### Verdigris

> Ancient bronze turned sea-green by time and salt air. The color of old statues, copper rooftops, oxidized piping. Two materials: the teal patina and the bronze beneath.

```
╭  user  ~/gloam  ›  main ~2  ────────────────────────────  ⌘ 14:32
╰─›
```

| Token | Hex | Role |
|---|---|---|
| primary | `#52C4A8` | verdigris teal — directory, languages |
| accent | `#CD8B4A` | bronze copper — git, cursor |
| muted | `#7A9490` | patina gray — chrome, time |
| error | `#D46060` | oxidation red |

Background `#0D1210` · Foreground `#D4E0D8` · Layout: two-line box · Fill: `─` · Cursor: `›`

[Design system guide →](themes/verdigris/verdigris.md)

---

### Sable

> The heraldic color — black, pure and absolute. Silver and gold on black. No box frames. No decorative chrome. The prompt exists because it must.

```
 ~/gloam   main ~2                               · 14:32
›
```

| Token | Hex | Role |
|---|---|---|
| primary | `#C0C8D4` | brushed silver — directory, languages |
| accent | `#D4AA6A` | champagne gold — git, cursor |
| muted | `#7A8294` | iron gray — chrome, time |
| error | `#D44848` | crimson |

Background `#080808` · Foreground `#E8E8E8` · Layout: single-line · Fill: ` ` · Cursor: `›`

[Design system guide →](themes/sable/sable.md)

---

### Fjord

> Norwegian fjord at dusk. Cold deep-blue water, perfectly still. A single amber light from a distant farmhouse. No username — cold, anonymous, Nordic.

```
╭  ~/gloam   main ~2  ················  ∼ 14:32
╰─›
```

| Token | Hex | Role |
|---|---|---|
| primary | `#6EB5E0` | ice sky blue — directory, languages |
| accent | `#E8C46A` | distant amber light — git, cursor |
| muted | `#688EAA` | fog over water — chrome, time |
| error | `#E06060` | warning light |

Background `#0A0F18` · Foreground `#D4E0E8` · Layout: two-line box · Fill: `·` · Cursor: `›`

[Design system guide →](themes/fjord/fjord.md)

---

### Umbra

> The penumbra — the partial shadow at the edge of total darkness. A mathematical concept made visible. Pale morning blue at the boundary. Amethyst violet — the color of transition.

```
 ~/gloam   main ~2  ·····················  · 14:32
▹
```

| Token | Hex | Role |
|---|---|---|
| primary | `#A0B4C8` | pale morning blue — directory, languages |
| accent | `#8B6CF0` | amethyst violet — git, cursor |
| muted | `#728090` | shadow slate — chrome, time |
| error | `#DC5858` | crimson |

Background `#070708` · Foreground `#E4E8F0` · Layout: single-line · Fill: `·` · Cursor: `▹`

[Design system guide →](themes/umbra/umbra.md)

---

### Cordovan

> A cordovan leather workshop. Two materials tell the whole story: the tan-caramel of the leather itself and the cold blue-steel of the buckles and clasps.

```
╭  user  ~/gloam  ❯  main ~2  ────────────────────────────  ⊕ 14:32
╰─❯
```

| Token | Hex | Role |
|---|---|---|
| primary | `#C49A6A` | cordovan tan — directory, languages |
| accent | `#6B9AB8` | cold steel (buckles, clasps) — git, cursor |
| muted | `#9A7D6A` | worn leather shadow — chrome, time |
| error | `#D06060` | warning |

Background `#120A06` · Foreground `#EAE0D4` · Layout: two-line box · Fill: `─` · Cursor: `❯`

[Design system guide →](themes/cordovan/cordovan.md)

---

### Tungsten

> Tungsten filament at operating temperature — past orange, almost white but holding onto gold. The primary is the filament's light. The accent is the oscilloscope watching it.

```
 ~/gloam   main ~2  ····················  ⋄ 14:32
▸
```

| Token | Hex | Role |
|---|---|---|
| primary | `#F0D890` | filament white-gold — directory, languages |
| accent | `#5A90C8` | scientific blue — git, cursor |
| muted | `#887A60` | warm gray — chrome, time |
| error | `#E05858` | fault indicator |

Background `#0E0C09` · Foreground `#F4EED8` · Layout: single-line · Fill: `·` · Cursor: `▸`

[Design system guide →](themes/tungsten/tungsten.md)

---

### Amethyst

> Purple quartz crystal grown in a dark matrix. The background is the host rock. The primary is the crystal — violet, translucent. The accent is rutile gold, mineral inclusions catching light from inside.

```
╭  user  ~/gloam  ⟫  main ~2  ················  ✧ 14:32
╰─⟫
```

| Token | Hex | Role |
|---|---|---|
| primary | `#C084F0` | amethyst violet — directory, languages |
| accent | `#E8B84A` | rutile gold inclusions — git, cursor |
| muted | `#9080A8` | shadow purple — chrome, time |
| error | `#E05858` | fault |

Background `#0C0811` · Foreground `#EAD8F8` · Layout: two-line box · Fill: `·` · Cursor: `⟫`

[Design system guide →](themes/amethyst/amethyst.md)

---

### Parchment

> Aged vellum. The material monks copied manuscripts onto. Iron gall ink as primary. Rust-brown as accent. The only light theme in the set — everything inverts.

```
 ~/gloam   main ~2  ···························  § 14:32
›
```

| Token | Hex | Role |
|---|---|---|
| primary | `#4A2E12` | iron gall ink — directory, languages |
| accent | `#7A3A10` | rust-brown (second ink) — git, cursor |
| muted | `#6B5A48` | faded ink — chrome, time |
| error | `#8B2020` | dark crimson |

Background `#EDE0C8` · Foreground `#2A1E12` · Layout: single-line · Fill: `·` · Cursor: `›`

> **Light theme.** All tokens are dark colors on a warm cream background. See [parchment.md](themes/parchment/parchment.md) for light theme setup notes — iTerm2 requires one additional setting.

[Design system guide →](themes/parchment/parchment.md)

---

## Design System

All themes share the same four-token architecture:

```
primary   ← directory path, language badges
accent    ← git branch/status, prompt character, cursor
muted     ← username, time, structural chrome (box corners)
error     ← fail state only
```

Structural and layout choices vary per theme:

| Theme | Layout | Box frame | Fill | Prompt |
|---|---|---|---|---|
| Eventide | two-line | `╭╰─` | `─` | `❯` |
| Aether | two-line | `╭╰─` | `·` | `⟫` |
| Ember | two-line | `╭╰─` | `·` | `❯` |
| Verdigris | two-line | `╭╰─` | `─` | `›` |
| Fjord | two-line | `╭╰─` | `·` | `›` |
| Cordovan | two-line | `╭╰─` | `─` | `❯` |
| Amethyst | two-line | `╭╰─` | `·` | `⟫` |
| Absinthe | single-line | — | `·` | `▸` |
| Sable | single-line | — | ` ` | `›` |
| Umbra | single-line | — | `·` | `▹` |
| Tungsten | single-line | — | `·` | `▸` |
| Parchment | single-line | — | `·` | `›` |

Each theme's JSON file is the single source of truth. The generator produces all 11 format files from it.

---

## Install

```bash
npx github:marvinrichter/gloam <theme> <target>
```

The installer copies the theme config and wires it into your existing config file — no clone required.

**Themes:** `eventide` · `aether` · `ember` · `absinthe` · `verdigris` · `sable` · `fjord` · `umbra` · `cordovan` · `tungsten` · `amethyst` · `parchment`

**Targets:** `starship` · `alacritty` · `kitty` · `wezterm` · `ghostty` · `neovim` · `vscode` · `zed` · `windows-terminal`

Install all themes to one target at once:

```bash
npx github:marvinrichter/gloam all starship
```

---

### Prerequisites

**JetBrains Mono Nerd Font** — required for all Nerd Font glyphs (language symbols, git icon):

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

---

### Starship

Install Starship and add the init line to your shell config once:

```bash
brew install starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc    # zsh
echo 'eval "$(starship init bash)"' >> ~/.bashrc  # bash
```

Then install the theme:

```bash
npx github:marvinrichter/gloam eventide starship
```

> The Starship config and iTerm2 theme are a pair. Using one without the other will work, but ANSI-based syntax highlighting (`ls`, `git log`, `grep`) will not harmonize with the prompt.

---

### VS Code

After running the installer, reload VS Code (`Cmd+Shift+P` → **Reload Window**) and select the theme via `Cmd+K Cmd+T`.

---

### Neovim

After running the installer, add to `init.lua`:

```lua
vim.cmd("colorscheme <name>")
```

---

### iTerm2 — manual import

The installer does not support iTerm2. Import manually:

1. `Preferences › Profiles › Colors › Color Presets ▾ › Import…`
2. Select `themes/<name>/iterm2.itermcolors`
3. `Color Presets ▾` → select the imported theme name

**Parchment (light theme) only:** uncheck **Use bright colors for bold text** (`Preferences › Profiles › Colors`). Without this, bold text is invisible against the light background.

---

### IntelliJ / JetBrains IDEs — manual import

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/<name>/intellij.icls`.

---

## Structure

```
gloam/
├── README.md
├── package.json               npm test / npm run generate / npx entrypoint
├── docs/                      GitHub Pages
│   ├── index.html
│   ├── brand-guidelines.md
│   └── assets/
│       └── tokens.css
├── themes/
│   └── eventide/              one directory per theme
│       ├── eventide.json      machine-readable source of truth
│       ├── eventide.md        design system guide
│       ├── starship.toml      generated
│       ├── iterm2.itermcolors generated
│       ├── alacritty.toml     generated
│       ├── kitty.conf         generated
│       ├── wezterm.lua        generated
│       ├── ghostty            generated
│       ├── windows-terminal.json  generated
│       ├── vscode.json        generated
│       ├── neovim.lua         generated
│       ├── intellij.icls      generated
│       └── zed.json           generated
└── scripts/
    ├── install.js             theme installer — `npx github:marvinrichter/gloam`
    ├── generate.js            regenerate all formats from theme JSON files
    ├── generators/            one module per output format
    │   ├── starship.js
    │   ├── iterm2.js
    │   ├── alacritty.js
    │   ├── kitty.js
    │   ├── wezterm.js
    │   ├── ghostty.js
    │   ├── windows-terminal.js
    │   ├── vscode.js
    │   ├── neovim.js
    │   ├── intellij.js
    │   ├── zed.js
    │   ├── syntax-map.js      shared syntax token → IDE role mapping
    │   └── utils.js           hex/float color utilities
    └── __tests__/             TDD test suite (node:test)
```

---

## Troubleshooting

### Glyphs display as boxes or question marks

The Nerd Font glyphs (language badges, git icon) require JetBrains Mono Nerd Font. Install it and set it as your terminal font:

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

Then set `JetBrainsMono Nerd Font` (exact name) as your terminal's font family.

### Colors look wrong or desaturated

Verify your terminal's color profile is set to sRGB. On iTerm2: Preferences › Profiles › Colors — ensure "Color Space" is sRGB. On macOS, desaturation can occur when the display profile is set to Display P3 without color management in the terminal.

### Starship config not loading

Check that the init line is in your shell config and that you have reloaded the shell:

```bash
# Verify the init line is present
grep starship ~/.zshrc     # or ~/.bashrc

# Reload
source ~/.zshrc
```

The installer copies `starship.toml` to `~/.config/starship.toml`. If `$STARSHIP_CONFIG` is set, it must point to that path.

### iTerm2 theme imported but not applied

After import, the theme must be explicitly selected: Preferences › Profiles › Colors › Color Presets ▾ → select the theme name. Import and selection are separate steps.

### Contrast looks different on different displays

gloam themes are calibrated for sRGB displays at typical brightness (200–300 nits). High-brightness displays and wide-gamut (P3) profiles can shift perceived contrast. The WCAG 4.5:1 guarantee holds under sRGB conditions. If a token looks low-contrast on your display, check display calibration before filing an issue.

### Parchment (light theme) looks wrong in iTerm2

Uncheck **Use bright colors for bold text** in Preferences › Profiles › Colors. Without this, bold text is invisible against the light background.

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for setup, theme requirements, and the PR process.

MIT License · Copyright 2025 Marvin Richter
