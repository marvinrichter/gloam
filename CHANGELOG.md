# Changelog

All notable changes to gloam are documented here.

This file is maintained automatically by [release-please](https://github.com/googleapis/release-please) from [Conventional Commits](https://www.conventionalcommits.org). Do not edit it manually.

<!-- NOTE: package.json version is updated by release-please when it opens a release PR.
     Until that PR is merged, package.json may show a lower version than the latest entry
     in this CHANGELOG. The CHANGELOG reflects the intended next release; package.json
     reflects the last published release. -->

<!-- releases will be prepended here by release-please -->

## [1.6.0](https://github.com/marvinrichter/gloam/compare/v1.5.0...v1.6.0) (2026-03-16)

### Features

* SEO, accessibility, and copy improvements to docs/index.html ([#22](https://github.com/marvinrichter/gloam/issues/22)) ([420177e](https://github.com/marvinrichter/gloam/commit/420177e5b29f53dc4c92f0c274061aec07ca1521))

## [1.5.0](https://github.com/marvinrichter/gloam/compare/v1.4.1...v1.5.0) (2026-03-16)

### Features

* add 24 new themes filling design-concept and hue gaps ([#20](https://github.com/marvinrichter/gloam/issues/20)) ([1c952d4](https://github.com/marvinrichter/gloam/commit/1c952d46c230f495cc64208a1975865c36762bf5))

### Bug Fixes

* disable MD060 table-column-style for markdownlint-cli2 v0.21 compat ([#18](https://github.com/marvinrichter/gloam/issues/18)) ([2c23ab6](https://github.com/marvinrichter/gloam/commit/2c23ab6208fb651e363ab4b1e1d4c1542a3affd7))
* resolve ESLint v10 lint errors (preserve-caught-error, no-useless-assignment) ([#17](https://github.com/marvinrichter/gloam/issues/17)) ([b171d16](https://github.com/marvinrichter/gloam/commit/b171d163d3814d9e5aed2612fa63824d93d5c15e))

## [1.4.0] — CI quality gates and coverage reporting

### Features

* add coverage comment bot — posts per-file 🟢/🟡/🔴 breakdown on every PR (zero dependencies)
* add WCAG AA contrast gate — CI fails if any theme token drops below 4.5:1
* add JSON schema validation — all 21 theme source files validated against `docs/specifications/theme-schema.json` on every push
* split generator check into dedicated job — runs once after tests pass instead of redundantly across the full matrix

### Fixes

* fix Oh My Posh generator to emit pure JSON (removed invalid `//` comment header)
* fix ESLint violations in `helix.js`, `oh-my-posh.js`, and `new-theme.js`
* apply Prettier formatting across all generator scripts

## [1.3.0] — Five new target formats

### Features

* add Helix editor target — copies `helix.toml` to `~/.config/helix/themes/`
* add tmux target — appends `source-file` line to `~/.tmux.conf`
* add Apple Terminal target — generates `terminal.terminal` for manual import
* add Oh My Posh target — generates `oh-my-posh.omp.json` for manual install
* add Sublime Text target — generates `sublime-text.sublime-color-scheme` for manual install

## [1.2.0] — Three new light themes

### Features

* add Solano theme — high desert light, terracotta red + Pacific blue
* add Saffron theme — morning spice market light, dark amber + indigo
* add Ochre theme — dawn mesa rock light, iron oxide red + deep teal

## [1.1.0] — Six new themes

### Features

* add Nacreous theme — stratospheric dark, iridescent teal-green + polar pink
* add Petrichor theme — pre-storm dark, grass green + ozone electric blue
* add Nocturne theme — candlelit dark, candlelight ivory + blood-red velvet
* add Basalt theme — volcanic dark, Hawaiian teal + sunset gold
* add Daybook theme — cream paper light, ruling blue + rubrication rust
* add Cirrus theme — sky-white light, prussian sky blue + deep teal

## [1.0.0] — Initial release

### Features

* add Eventide theme — twilight dark, warm gold + sunset coral
* add Aether theme — deep space dark, aurora teal + nebula violet
* add Ember theme — watch fire dark, ember amber + active flame
* add Absinthe theme — art nouveau dark, absinthe green + golden anise
* add Verdigris theme — oxidised copper dark, verdigris teal + bronze
* add Sable theme — heraldic dark, brushed silver + champagne gold
* add Fjord theme — Norwegian fjord dark, ice sky blue + distant amber
* add Umbra theme — penumbra dark, pale morning blue + amethyst violet
* add Cordovan theme — leather workshop dark, cordovan tan + cold steel
* add Tungsten theme — filament dark, white-gold + scientific blue
* add Amethyst theme — crystal dark, amethyst violet + rutile gold
* add Parchment theme — manuscript light, iron gall ink + rust-brown
