# gloam

Twenty-one terminal and editor theme design systems. Each built from a single atmospheric concept: semantic color tokens, a matched 16-color ANSI palette, and generated configs for every major terminal emulator and IDE.

Every token in every theme clears 4.5:1 contrast against its background. Not as a selling point — as a baseline.

**Supported targets:** VS Code · Starship · Neovim · iTerm2 · Alacritty · Kitty · WezTerm · Ghostty · tmux · Zed · Windows Terminal · Helix · IntelliJ · Oh My Posh · Sublime Text · Apple Terminal

---

## Contents

- [Quick Start](#quick-start)
- [Themes](#themes)
  - [Absinthe](#absinthe)
  - [Aether](#aether)
  - [Amethyst](#amethyst)
  - [Basalt](#basalt)
  - [Cirrus](#cirrus)
  - [Cordovan](#cordovan)
  - [Daybook](#daybook)
  - [Ember](#ember)
  - [Eventide](#eventide)
  - [Fjord](#fjord)
  - [Nacreous](#nacreous)
  - [Nocturne](#nocturne)
  - [Ochre](#ochre)
  - [Parchment](#parchment)
  - [Petrichor](#petrichor)
  - [Sable](#sable)
  - [Saffron](#saffron)
  - [Solano](#solano)
  - [Tungsten](#tungsten)
  - [Umbra](#umbra)
  - [Verdigris](#verdigris)
- [Choosing a theme](#choosing-a-theme)
- [Design System](#design-system)
- [Install](#install)
  - [Prerequisites](#prerequisites)
  - [VS Code](#vs-code)
  - [Starship](#starship)
  - [Neovim](#neovim)
  - [iTerm2](#iterm2--manual-import)
  - [tmux](#tmux)
  - [Helix](#helix)
  - [IntelliJ / JetBrains IDEs](#intellij--jetbrains-ides--manual-import)
  - [Oh My Posh](#oh-my-posh--manual-copy)
  - [Sublime Text](#sublime-text--manual-copy)
  - [Apple Terminal](#apple-terminal--manual-import)
- [Structure](#structure)
- [Contributing](#contributing)

## Quick Start

```bash
npx github:marvinrichter/gloam eventide starship
```

Replace `eventide` with any theme name and `starship` with any target (see [Install](#install) for all options).

---

## What makes gloam different

Each theme starts with a specific atmospheric or material moment — not a color preference, but a concept with constraints. Color choices must be defensible from that concept. The four-token semantic model (`primary`, `accent`, `muted`, `error`) keeps prompt elements consistent across every theme: wherever you expect the directory, the git branch, the time — they are always in the same token role, with different colors but the same structure.

Every token in every theme clears WCAG AA 4.5:1 against its background. The generator produces all 16 format files from a single JSON source, so themes are never hand-tuned per-target. Change one value in the JSON and every format regenerates in sync.

---

## Themes

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

### Basalt

> Hawaiian lava reaching the Pacific. Black volcanic rock, white sea foam, extraordinary teal water, twenty minutes of gold before the sun drops.

```
[ ~/gloam ][ main ~2 +1 ]              [∎ 14:32]
▸
```

| Token | Hex | Role |
|---|---|---|
| primary | `#50C8B8` | Hawaiian teal — directory, languages |
| accent | `#E8B040` | sunset gold — git, cursor |
| muted | `#7888A0` | volcanic sea-gray — chrome, time |
| error | `#E05858` | lava heat shimmer |

Background `#090A0B` · Foreground `#E0E4E8` · Layout: single-line · Fill: `╌` · Cursor: `▸`

[Design system guide →](themes/basalt/basalt.md)

---

### Cirrus

> High-altitude ice crystal clouds at midday. Sky-white background, prussian blue sky, deep teal horizon. Cold precision. The shadows are lavender, not gray.

```
[ ~/gloam ][ main ~2 +1 ]·························[∘ 14:32]
›
```

| Token | Hex | Role |
|---|---|---|
| primary | `#1E4888` | prussian sky blue — directory, languages |
| accent | `#1A7060` | deep teal at altitude — git, cursor |
| muted | `#506098` | lavender cloud shadow — chrome, time |
| error | `#882028` | danger red |

Background `#EEF1F6` · Foreground `#181C28` · Layout: single-line · Fill: `·` · Cursor: `›`

> **Light theme.** All tokens are dark colors on a sky-white background. See [cirrus.md](themes/cirrus/cirrus.md) for light theme setup notes — iTerm2 requires one additional setting.

[Design system guide →](themes/cirrus/cirrus.md)

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

### Daybook

> A Georgian merchant's daily ledger. Cream paper ruled in faded blue, entries in dark sepia, totals and corrections in rubrication rust-red. Afternoon light through a tall window.

```
[ ~/my-ledger ][ main ~2 +1 ]·····················[¶ 14:32]
›
```

| Token | Hex | Role |
|---|---|---|
| primary | `#284878` | ruling blue — directory, languages |
| accent | `#884830` | rubrication rust-red — git, cursor |
| muted | `#6A5E4E` | paper shadow — chrome, time |
| error | `#882020` | dark crimson |

Background `#F2EEE6` · Foreground `#1E1A14` · Layout: single-line · Fill: `·` · Cursor: `›`

> **Light theme.** All tokens are dark colors on a cream paper background. See [daybook.md](themes/daybook/daybook.md) for light theme setup notes — iTerm2 requires one additional setting.

[Design system guide →](themes/daybook/daybook.md)

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

### Nacreous

> Iridescent nacreous clouds, 15–25 km above the polar surface. Teal-green shifting to pink, like oil on cold water. Only visible in polar winter, before sunrise.

```
╭  marvin  ~/gloam   main ~2 +1  ················  ✧ 14:32
╰─⟫
```

| Token | Hex | Role |
|---|---|---|
| primary | `#78D8C8` | nacreous teal-green — directory, languages |
| accent | `#E890C8` | nacreous pink — git, cursor |
| muted | `#8888A8` | ice fog — chrome, time |
| error | `#E06868` | warning red |

Background `#0B0C10` · Foreground `#E4E8F0` · Layout: two-line box · Fill: `·` · Cursor: `⟫`

[Design system guide →](themes/nacreous/nacreous.md)

---

### Nocturne

> Chopin at night. Candlelight on ivory keys, blood-red velvet curtain, the piano warm from decades of low light. Everything played pianissimo.

```
╭  marvin  ~/gloam   main ~2 +1  ──────────────  ○ 14:32
╰─❯
```

| Token | Hex | Role |
|---|---|---|
| primary | `#E0D0A8` | candlelight ivory — directory, languages |
| accent | `#D05A6A` | blood-red velvet — git, cursor |
| muted | `#848080` | candlesmoke gray — chrome, time |
| error | `#E04848` | hot candleflame |

Background `#100A0C` · Foreground `#EEE8E0` · Layout: two-line box · Fill: `─` · Cursor: `❯`

[Design system guide →](themes/nocturne/nocturne.md)

---

### Ochre

> Dawn on mesa rock. The moment the first light hits iron oxide and turns the cliffs to fire.

```
 ~/gloam  main ~2  ···············  ◌ 14:32 ›
```

| Token | Hex | Role |
|---|---|---|
| primary | `#722018` | iron oxide red — directory, languages |
| accent | `#1A6068` | deep teal — git, cursor |
| muted | `#705040` | weathered sienna — chrome, time |
| error | `#7A1828` | deep crimson |

Background `#F2E4D0` · Foreground `#220E08` · Layout: single-line · Fill: `·` · Cursor: `›`

> **Light theme.** All tokens are dark colors on a warm sandstone background. See [ochre.md](themes/ochre/ochre.md) for light theme setup notes — iTerm2 requires one additional setting.

[Design system guide →](themes/ochre/ochre.md)

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

Background `#E8D6B4` · Foreground `#2A1E12` · Layout: single-line · Fill: `·` · Cursor: `›`

> **Light theme.** All tokens are dark colors on a warm cream background. See [parchment.md](themes/parchment/parchment.md) for light theme setup notes — iTerm2 requires one additional setting.

[Design system guide →](themes/parchment/parchment.md)

---

### Petrichor

> The smell of rain on dry earth, one minute before it falls. Grass green ground, ozone electric sky, the tension between cool charge and warm earth.

```
[ ~/gloam ][ main ~2 +1 ]─────────────────────[∼ 14:32]
›
```

| Token | Hex | Role |
|---|---|---|
| primary | `#78C888` | new grass green — directory, languages |
| accent | `#58C8D8` | ozone electric blue — git, cursor |
| muted | `#78806A` | dry earth surface — chrome, time |
| error | `#D05858` | storm warning red |

Background `#0A0C0A` · Foreground `#D8DCCC` · Layout: single-line · Fill: `─` · Cursor: `›`

[Design system guide →](themes/petrichor/petrichor.md)

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

### Saffron

> Morning spice market. Saffron cloth, indigo dye pots, the hour before the light becomes merciless.

```
╭  ~/gloam   main ~2  ──────────────────────────  ◈ 14:32
╰─❯
```

| Token | Hex | Role |
|---|---|---|
| primary | `#5E3008` | dark amber — directory, languages |
| accent | `#3A2880` | indigo — git, cursor |
| muted | `#806040` | warm sienna — chrome, time |
| error | `#802028` | deep crimson |

Background `#FAF0D8` · Foreground `#281808` · Layout: two-line box · Fill: `─` · Cursor: `❯`

> **Light theme.** All tokens are dark colors on a pale saffron background. See [saffron.md](themes/saffron/saffron.md) for light theme setup notes — iTerm2 requires one additional setting.

[Design system guide →](themes/saffron/saffron.md)

---

### Solano

> High desert at midday. Bleached adobe walls, terracotta rooftiles, ink-shadow, deep Pacific blue.

```
 ~/gloam  main ~2  ∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿∿  ☀ 14:32 ›
```

| Token | Hex | Role |
|---|---|---|
| primary | `#782010` | terracotta red — directory, languages |
| accent | `#1A4A7A` | Pacific blue — git, cursor |
| muted | `#7A5C40` | adobe tan — chrome, time |
| error | `#8B1A2A` | deep crimson |

Background `#F5EDE0` · Foreground `#2A1C10` · Layout: single-line · Fill: `∿` · Cursor: `›`

> **Light theme.** All tokens are dark colors on a warm cream background. See [solano.md](themes/solano/solano.md) for light theme setup notes — iTerm2 requires one additional setting.

[Design system guide →](themes/solano/solano.md)

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

## Choosing a theme

All 21 themes share the same structural model — four semantic tokens, 16-color ANSI palette, identical targets. The differences are concept, color temperature, and prompt layout.

### By color temperature

| Warm (golds, ambers, corals) | Cool (teals, blues, purples) | Neutral (grays, whites) |
|---|---|---|
| Eventide, Ember, Cordovan | Aether, Fjord, Basalt | Tungsten, Sable, Umbra |
| Nocturne, Solano, Saffron, Ochre | Verdigris, Nacreous, Petrichor | Absinthe |
| | Amethyst, Cirrus | |

### By background type

| Dark themes | Light themes |
|---|---|
| Eventide, Aether, Ember, Absinthe, Verdigris, Sable | Parchment, Daybook, Cirrus |
| Fjord, Umbra, Cordovan, Tungsten, Amethyst | Solano, Saffron, Ochre |
| Nacreous, Petrichor, Nocturne, Basalt | |

### By prompt layout

| Two-line box (`╭╰─`) | Single-line (no frame) |
|---|---|
| Eventide, Ember, Verdigris, Fjord | Absinthe, Sable, Umbra, Tungsten |
| Cordovan, Amethyst, Nacreous, Nocturne | Parchment, Petrichor, Basalt, Daybook |
| Saffron, Aether | Cirrus, Solano, Ochre |

### Picking a light theme

All six light themes use dark tokens on a warm background. Key differences:

| Theme | Background | Primary | Feel |
|---|---|---|---|
| Parchment | `#E8D6B4` old paper | `#4A2E12` dark brown | antique manuscript |
| Daybook | `#F2EEE6` cream | `#284878` navy | ruled notebook |
| Cirrus | `#EEF1F6` sky white | `#1E4888` steel blue | high altitude, minimal |
| Solano | `#F5EDE0` adobe | `#782010` terracotta | high desert midday |
| Saffron | `#FAF0D8` pale gold | `#5E3008` dark amber | morning spice market |
| Ochre | `#F2E4D0` sandstone | `#722018` iron oxide | dawn on mesa rock |

**All light themes require one extra iTerm2 setting:** uncheck _Use bright colors for bold text_ (`Preferences › Profiles › Colors`).

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
| Absinthe | single-line | — | `·` | `▸` |
| Aether | two-line | `╭╰─` | `·` | `⟫` |
| Amethyst | two-line | `╭╰─` | `·` | `⟫` |
| Basalt | single-line | — | `╌` | `▸` |
| Cirrus | single-line | — | `·` | `›` |
| Cordovan | two-line | `╭╰─` | `─` | `❯` |
| Daybook | single-line | — | `·` | `›` |
| Ember | two-line | `╭╰─` | `·` | `❯` |
| Eventide | two-line | `╭╰─` | `─` | `❯` |
| Fjord | two-line | `╭╰─` | `·` | `›` |
| Nacreous | two-line | `╭╰─` | `·` | `⟫` |
| Nocturne | two-line | `╭╰─` | `─` | `❯` |
| Ochre | single-line | — | `·` | `›` |
| Parchment | single-line | — | `·` | `›` |
| Petrichor | single-line | — | `─` | `›` |
| Sable | single-line | — | ` ` | `›` |
| Saffron | two-line | `╭╰─` | `─` | `❯` |
| Solano | single-line | — | `∿` | `›` |
| Tungsten | single-line | — | `·` | `▸` |
| Umbra | single-line | — | `·` | `▹` |
| Verdigris | two-line | `╭╰─` | `─` | `›` |

Each theme's JSON file is the single source of truth. The generator produces all 16 format files from it.

---

## Install

```bash
npx github:marvinrichter/gloam <theme> <target>
```

The installer copies the theme config and wires it into your existing config file — no clone required.

**Themes:** `absinthe` · `aether` · `amethyst` · `basalt` · `cirrus` · `cordovan` · `daybook` · `ember` · `eventide` · `fjord` · `nacreous` · `nocturne` · `ochre` · `parchment` · `petrichor` · `sable` · `saffron` · `solano` · `tungsten` · `umbra` · `verdigris`

**Targets:** `vscode` · `starship` · `neovim` · `alacritty` · `kitty` · `wezterm` · `ghostty` · `tmux` · `zed` · `windows-terminal` · `helix`

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

### VS Code

After running the installer, reload VS Code (`Cmd+Shift+P` → **Reload Window**) and select the theme via `Cmd+K Cmd+T`.

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

### tmux

```bash
npx github:marvinrichter/gloam eventide tmux
```

The installer adds a `source-file` line to `~/.tmux.conf`. Reload with:

```bash
tmux source-file ~/.tmux.conf
```

---

### Helix

```bash
npx github:marvinrichter/gloam eventide helix
```

The installer copies `helix.toml` to `~/.config/helix/themes/<name>.toml`. Add to `~/.config/helix/config.toml`:

```toml
theme = "<name>"
```

---

### IntelliJ / JetBrains IDEs — manual import

The installer does not support IntelliJ. Import manually:

```
Settings › Editor › Color Scheme › ⚙ › Import Scheme
```

Select `themes/<name>/intellij.icls`.

---

### Oh My Posh — manual copy

Copy the generated file to the Oh My Posh themes directory:

```bash
cp themes/<name>/oh-my-posh.omp.json ~/.config/oh-my-posh/themes/<name>.omp.json
```

Then configure your shell to use it:

```bash
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/<name>.omp.json)"
```

---

### Sublime Text — manual copy

Copy the generated file to your Sublime Text packages:

```bash
cp themes/<name>/sublime-text.sublime-color-scheme \
   ~/Library/Application\ Support/Sublime\ Text/Packages/User/
```

Then select via **Preferences › Color Scheme…** → `<name>`.

---

### Apple Terminal — manual import

The installer does not support Apple Terminal directly. Import manually:

1. `Terminal › Preferences › Profiles › ⚙ › Import…`
2. Select `themes/<name>/terminal.terminal`
3. Select the imported profile from the list and click **Default**

**All light themes:** uncheck **Use bright colors for bold text** in the imported profile.

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
│       ├── zed.json           generated
│       ├── helix.toml         generated
│       ├── tmux.conf          generated
│       ├── terminal.terminal  generated
│       ├── oh-my-posh.omp.json generated
│       └── sublime-text.sublime-color-scheme  generated
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
    │   ├── helix.js
    │   ├── tmux.js
    │   ├── terminal-app.js
    │   ├── oh-my-posh.js
    │   ├── sublime-text.js
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

---

## Questions and security

- **Questions and support:** [SUPPORT.md](SUPPORT.md)
- **Security vulnerabilities:** [SECURITY.md](SECURITY.md) — do not open a public issue for security reports

---

MIT License · Copyright 2025 Marvin Richter
