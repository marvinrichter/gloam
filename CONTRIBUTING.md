# Contributing to gloam

gloam is a collection of thirty-eight terminal and editor theme design systems. Contributions are welcome — new themes, new target formats, and fixes to existing ones.

---

## Development setup

**Prerequisites:** Node.js 22+, JetBrains Mono Nerd Font

```bash
git clone https://github.com/marvinrichter/gloam.git
cd gloam
npm install

# Run the test suite (node:test)
npm test

# Regenerate all sixteen formats from the theme JSON source files
npm run generate
```

---

## How to contribute

1. **Find or open an issue** — comment to say you are working on it before starting
2. **Fork and branch** — `git checkout -b feat/your-change`
3. **Make your changes** — see the sections below for what each type of change requires
4. **Run tests and the generator** — `npm test && npm run generate`
5. **Submit a PR** — fill in the PR template fully; incomplete templates will be returned

---

## Adding a new theme

A theme starts as two files. The generator produces the rest.

```
themes/<name>/
├── <name>.json     machine-readable source of truth
└── <name>.md       design system guide
```

**Requirements before a new theme will be merged:**

1. **Four semantic tokens** — `primary`, `accent`, `muted`, `error` defined in `tokens`
2. **WCAG AA contrast** — all four tokens must achieve ≥ 4.5:1 against the background. Calculate contrast using the WCAG relative luminance formula: `L = 0.2126 × R + 0.7152 × G + 0.0722 × B` (where R/G/B are linearised 0–1 values), then `ratio = (L1 + 0.05) / (L2 + 0.05)`. Use a calculator such as [Colour Contrast Analyser](https://www.tpgi.com/color-contrast-checker/) or [Coolors contrast checker](https://coolors.co/contrast-checker). Include the luminance calculations in `<name>.md` — see `eventide.md` for a worked example.
3. **Coherent ANSI palette** — ANSI slots must derive from the semantic tokens, not be chosen independently. Syntax highlighting will use these — they must harmonise with the prompt
4. **Distinct territory** — the theme must occupy a different hue family or atmospheric concept from the existing thirty-eight. The table below maps each existing theme to its hue family and atmospheric character. A new theme must not overlap with an existing entry:

   | Theme | Hue family | Atmospheric character |
   |---|---|---|
   | Eventide | Warm (gold + coral + lavender) | Twilight — day/night threshold |
   | Aether | Cool (teal + violet) | Deep space — void between galaxies |
   | Ember | Warm (amber + orange) | Watch fire — coal and flame |
   | Absinthe | Cool-green (green + gold) | Art nouveau chemistry — forbidden liqueur |
   | Verdigris | Teal + bronze | Oxidised copper — patina and metal |
   | Sable | Neutral (silver + gold) | Heraldic — pure black, no decoration |
   | Fjord | Cool blue + amber | Norwegian fjord at dusk |
   | Umbra | Blue-grey + violet | Penumbra — mathematical shadow edge |
   | Cordovan | Warm tan + steel blue | Leather workshop — cordovan and clasps |
   | Tungsten | Warm gold-white + cold blue | Filament at operating temperature |
   | Amethyst | Purple + rutile gold | Crystal in dark matrix — mineral light |
   | Parchment | Warm cream (light theme) | Manuscript vellum — iron gall ink |
   | Nacreous | Iridescent teal + polar pink | Nacreous clouds — stratospheric dark |
   | Petrichor | Grass green + ozone blue | Pre-storm — dry earth before rain |
   | Nocturne | Candlelight ivory + blood-red velvet | Candlelit dark — piano nocturne |
   | Basalt | Hawaiian teal + sunset gold | Volcanic dark — lava meets ocean |
   | Daybook | Ruling blue + rubrication rust (light theme) | Cream paper light — ledger in daylight |
   | Cirrus | Prussian sky blue + deep teal (light theme) | Sky-white light — high-altitude midday |
   | Solano | Terracotta red + Pacific blue (light theme) | High desert midday — bleached adobe |
   | Saffron | Dark amber + indigo (light theme) | Morning spice market — pale saffron light |
   | Ochre | Iron oxide red + deep teal (light theme) | Dawn on mesa rock — sandstone and fire |
   | Bamboo | Vermilion + celadon | Hanko seal — red ink on parchment |
   | Bloom | Carmine rose + dried plum (light theme) | Pressed rose petals — barely-pink paper |
   | Canopy | Chartreuse + filtered amber | Forest canopy — sunlit undergrowth |
   | Carmine | Cochineal red + warm coral | Mineral pigment — oldest organic dye |
   | Cast | Oxidized brass yellow + olive | Industrial mould — cooling brass surface |
   | Cobalt | Royal periwinkle + electric cyan | Cobalt glass — oxide blue from within |
   | Dusk | Twilight lavender + last amber | Mid-tone twilight — twenty minutes after sunset |
   | Fern | Forest green + morning amber (light theme) | Woodland morning — sage light through fronds |
   | Graphite | Near-neutral mauve + pale gold | Graphite on paper — pencil before ink |
   | Ironcast | Steel blue-grey + acid yellow | Cast iron — pre-storm foundry sky |
   | Noir | Incandescent gold + warm amber | Film noir — single bulb in darkness |
   | Rosewater | Rose-pink + pale lilac | Distilled rosewater — the pink before it fades |
   | Stark | Deep navy + dark orange (light theme) | Pure white paper — absolute contrast, no atmosphere |
   | Sumi | Ink-wash indigo + diluted blue | Sumi-e — pigment pooling on wet paper |
   | Synthwave | Neon magenta + neon cyan | Midnight arcade — synthetic, no material reference |
   | Tallow | Cream-gold + terracotta | Tallow candle — soft pooled warmth |
   | Weld | Olive yellow-green + molten amber | Weld seam — oxidation flame on steel |

   **Notes on the table:**
   - Two green-dark themes (Petrichor and Absinthe) and Canopy coexist intentionally — Petrichor's accent is ozone blue (186°), Absinthe's is gold (38°), and Canopy's primary sits at hue 92° (chartreuse), all visually distinct despite shared green ground.
   - The nine light themes span cool (Cirrus, Daybook, Fern), warm-neutral (Parchment), warm-saturated (Solano, Saffron, Ochre, Bloom), and high-contrast neutral (Stark). New light theme proposals must avoid overlap with these existing atmospheric concepts.

5. **A concept** — the theme derives from a specific atmospheric or material reference. Color choices must be defensible from that concept, not arbitrary
6. **Design guide** — `<name>.md` must follow the structure of any existing guide, including the contrast compliance table with luminance calculations

Once both files exist, run:

```bash
npm run generate   # produces all 16 format files in themes/<name>/
npm test           # must pass with no failures
```

The `<name>.json` schema:

```json
{
  "name": "mytheme",
  "displayName": "My Theme",
  "type": "dark",
  "background": "#...",
  "foreground": "#...",
  "tokens": { "primary": "#...", "accent": "#...", "muted": "#...", "error": "#..." },
  "ansi": ["#000000", "..."],
  "ui": {
    "cursor": "#...", "cursorText": "#...",
    "selection": "#...", "selectionText": "#...",
    "bold": "#...", "link": "#..."
  },
  "prompt": {
    "layout": "two-line-box",
    "showUsername": true,
    "fill": "·",
    "timePrefix": "◆",
    "successSymbol": "❯",
    "vimSymbol": "❮"
  }
}
```

`layout` is either `"two-line-box"` or `"single-line"`.

A formal JSON Schema (draft-07) covering all fields, types, and constraints is available at [`docs/specifications/theme-schema.json`](docs/specifications/theme-schema.json).

The `prompt` section is read by both the Starship generator (`scripts/generators/starship.js`) and the Oh My Posh generator (`scripts/generators/oh-my-posh.js`). It controls layout, fill character, time prefix symbol, and vim mode indicator — fields that both tools expose identically. If a future prompt tool requires fields that conflict with these, refactor to `"prompt": { "starship": { ... }, "oh-my-posh": { ... } }` keyed by tool name.

---

## Modifying an existing theme

- Edit `themes/<name>/<name>.json` — the single source of truth
- Re-verify all contrast ratios if any token changes
- Update the `<name>.md` contrast table to match
- Run `npm run generate` to regenerate all format files
- Run `npm test` — tests verify output correctness

---

## Running tests

Run the full test suite:

```bash
npm test
```

Run a single test file (e.g. just the VS Code generator tests):

```bash
node --test scripts/__tests__/vscode.test.js
```

---

## Adding a new target format

New formats require:

1. A generator module at `scripts/generators/<format>.js` — follow the pattern of an existing generator (e.g. `scripts/generators/ghostty.js` for a simple key=value format)
2. Register the new target in `scripts/generate.js` — add `{ filename: "<format>.<ext>", fn: generateFormat }` to the `TARGETS` array
3. Add an installer function in `scripts/install.js` — follow the factory pattern in `createInstallers()`
4. Register the installer in the `installerMap` inside `run()` in `scripts/install.js`
5. Tests in `scripts/__tests__/<format>.test.js` — at minimum: output is a string, required color values are present, all 38 themes generate without error
6. Documentation in the README install section and `docs/index.html`

Bug reports and feature requests: [GitHub Issues](https://github.com/marvinrichter/gloam/issues)

---

## Design space — open invitations

The following territory is currently unoccupied and would be welcome:

- Any concept not already in the "Distinct territory" table above, subject to the same requirements

The sixteen existing generated formats and their target applications:

| Filename | Application | Notes |
|---|---|---|
| `starship.toml` | Starship prompt | Copies to `~/.config/starship.toml` |
| `iterm2.itermcolors` | iTerm2 | Manual import via Preferences GUI |
| `alacritty.toml` | Alacritty terminal | Copies to `~/.config/alacritty/themes/` |
| `kitty.conf` | Kitty terminal | Copies to `~/.config/kitty/` |
| `wezterm.lua` | WezTerm terminal | Copies to `~/.config/wezterm/colors/` |
| `ghostty` | Ghostty terminal | Copies to `~/.config/ghostty/themes/` |
| `windows-terminal.json` | Windows Terminal | Merges scheme into `settings.json` |
| `vscode.json` | VS Code / Cursor | Installed as a local extension |
| `neovim.lua` | Neovim | Copies to `~/.config/nvim/colors/` |
| `intellij.icls` | IntelliJ / JetBrains IDEs | Manual import via Settings GUI |
| `zed.json` | Zed editor | Copies to `~/.config/zed/themes/` |
| `helix.toml` | Helix editor | Copies to `~/.config/helix/themes/` |
| `tmux.conf` | tmux | Source-file line added to `~/.tmux.conf` |
| `terminal.terminal` | Apple Terminal | Manual import via Preferences GUI |
| `oh-my-posh.omp.json` | Oh My Posh prompt | Manual copy to Oh My Posh themes directory |
| `sublime-text.sublime-color-scheme` | Sublime Text | Manual copy to Packages/User/ |

---

## Commit format

[Conventional Commits](https://www.conventionalcommits.org):

```
feat: add Solstice theme
fix: correct primary token contrast in Tungsten
refactor: extract shared ANSI palette logic
docs: update Fjord design guide contrast table
chore: upgrade node:test runner
```

Types: `feat`, `fix`, `docs`, `test`, `refactor`, `chore`, `perf`

A release PR is opened automatically on every merge to `main` via release-please. Conventional Commit types determine what version bump is applied.

---

## PR review process

- PRs are reviewed by the maintainer within a few days
- One approval is required to merge
- The CI workflow must pass: tests + generator output up to date
- Squash merge preferred for clean history

---

## Reporting security issues

Do not open a public GitHub issue for security vulnerabilities. See [SECURITY.md](./SECURITY.md).
