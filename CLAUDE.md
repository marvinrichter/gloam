# CLAUDE.md — gloam

54 atmospheric color themes for 16 terminal/IDE targets. Each theme is a design system: semantic tokens → 16-color ANSI palette → generated configs. All tokens clear WCAG AA 4.5:1 contrast.

## Key commands

```bash
npm test                    # run tests with coverage
npm run generate            # generate all output files from theme sources
npm run check-contrast      # verify WCAG AA contrast for all themes
npm run new-theme           # scaffold a new theme
npm run install-theme       # install a theme locally
npm run lint                # JS + Markdown linting
npm run format              # Prettier (JS files)
npm run validate-schemas    # validate theme JSON against schema
npm run validate-completeness  # check all themes export all required targets
```

## Structure

```
themes/          — theme source files (one directory per theme)
scripts/
  generators/    — one generator per target (vscode.js, alacritty.js, etc.)
  installers/    — install scripts per target
  __tests__/     — Node test suite
  generate.js    — main generation entry point
  check-contrast.js
  new-theme.js
  install.js
  ci/            — CI validation scripts
```

## Supported targets

VS Code · Starship · Neovim · iTerm2 · Alacritty · Kitty · WezTerm · Ghostty · tmux · Zed · Windows Terminal · Helix · IntelliJ · Oh My Posh · Sublime Text · Apple Terminal

## Adding a theme

1. `npm run new-theme` — scaffolds the theme directory with token stubs
2. Fill in semantic color tokens
3. `npm run check-contrast` — must pass before committing
4. `npm run generate` — produces all 16 output configs
5. `npm run validate-completeness` — verifies all targets are present

## Conventions

- Theme names are single atmospheric nouns (e.g. Petrichor, Solano, Ironcast)
- Tokens are semantic, not literal (`syntax.keyword`, not `color.purple`)
- WCAG AA 4.5:1 contrast is a hard requirement, enforced in CI
- OKLab perceptual distance check prevents visually indistinct themes
