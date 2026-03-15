# gloam — Architecture Tour

A guided walkthrough of the codebase using Eventide as the canonical example. After reading this, you will know the 8 anchor files every contributor must understand.

---

## The journey: one theme, all 16 formats

Everything in gloam starts with a single JSON file and ends with 16 generated output files.

```
themes/eventide/eventide.json   ← source of truth
         │
         └── npm run generate
                    │
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
                    ├── zed.json
                    ├── helix.toml
                    ├── tmux.conf
                    ├── terminal.terminal
                    ├── oh-my-posh.omp.json
                    └── sublime-text.sublime-color-scheme
```

---

## Anchor file 1: `themes/eventide/eventide.json`

The source of truth for a theme. It defines:

- `background`, `foreground` — the terminal canvas
- `tokens.primary/accent/muted/error` — the four semantic tokens
- `ansi[]` — 16-element ANSI palette array
- `ui{}` — cursor, selection, bold, link colors for terminal UI slots
- `prompt{}` — Starship-specific layout and symbol choices

This file is the only file a theme designer edits. All other files are generated from it.

**Why only four tokens?** See [ADR-001](../decisions/ADR-001.md).

---

## Anchor file 2: `scripts/generate.js`

The CLI entry point and orchestrator for generation. Responsibilities:

1. Discovers all theme directories under `themes/`
2. Reads and parses each `<name>.json`
3. Calls `validateTheme()` on each — rejects invalid themes with specific error messages
4. Calls each generator function for each theme
5. Writes the output files

`validateTheme()` in this file is the schema enforcer. Any new required field must be added here (and tested in `scripts/__tests__/validate-themes.test.js`).

---

## Anchor file 3: `scripts/generators/starship.js`

The most complex generator. It reads `theme.prompt.layout` to produce either a two-line-box or single-line Starship config, and uses all four semantic tokens plus the ANSI palette to color every Starship module.

The `prompt` object in the JSON exists entirely to support this generator. No other generator reads `prompt`. See [ADR-003](../decisions/ADR-003.md) for why generators over manual files, and `docs/ARCHITECTURE.md` for the note on Starship-only prompt fields.

---

## Anchor file 4: `scripts/generators/syntax-map.js`

A shared helper that maps semantic roles to colors for editor targets (VS Code, Neovim, IntelliJ, Zed). It reads specific ANSI slots by index for syntax roles:

- `ansi[10]` → string color
- `ansi[11]` → number color
- `ansi[13]` → constant color

This is where the ANSI-by-harmony trade-off is operationalized. See [ADR-005](../decisions/ADR-005.md).

---

## Anchor file 5: `scripts/generators/vscode.js`

Typical example of a structured-format generator. Takes a theme object and returns a VS Code theme JSON string. Uses `syntaxColors()` from `syntax-map.js` for token colors. A good model for adding a new generator.

---

## Anchor file 6: `scripts/install.js`

The installer CLI and factory. `createInstallers(home, repo)` returns a bound set of installer functions. Each installer:

1. Copies the relevant generated format file to the correct OS location
2. Modifies the target application's config file (with `upsertLine` for line-based configs, or JSON read-modify-write for JSON configs)

The exported `upsertLine()` function handles idempotent config line replacement. The exported `run()` function is the CLI entry point.

**Security note:** The `src()` function canonicalizes theme paths with `path.normalize()` and asserts they remain within the themes directory, preventing path traversal.

---

## Anchor file 7: `scripts/__tests__/validate-themes.test.js`

Two test suites in one file:

1. Unit tests for `validateTheme()` with constructed invalid inputs
2. Integration: reads all 38 real theme JSON files and asserts they pass validation

If you add a new required field to a theme's JSON schema, add it to `validateTheme()` in `generate.js`, add a unit test here, and add the field to all 38 existing theme JSONs.

---

## Anchor file 8: `themes/eventide/eventide.md`

The design system guide for Eventide. Every theme has one. It documents:

- The atmospheric concept and why each color was chosen
- The four token contrast ratios against background (WCAG compliance table)
- The ANSI palette with design logic for named slots
- The prompt anatomy (layout, fill character, structural symbols)
- Install instructions for all 16 targets

When you change a theme's JSON, you must also update this file. The three-step change process: (1) edit `.json`, (2) `npm run generate`, (3) update `.md`.

---

## Putting it together

The contribution loop for a design change:

```
1. Edit themes/<name>/<name>.json
2. npm run generate          ← regenerates all 16 output files
3. npm test                  ← validates correctness
4. Update themes/<name>/<name>.md  ← contrast table, token descriptions
5. Commit all four sets of files together
```

For a code change (new generator, new installer, new validation):

```
1. Write failing test first (scripts/__tests__/<scope>.test.js)
2. Implement the change
3. npm test — all tests must pass
4. If the change affects theme JSON schema, also run npm run generate
```

---

## Where to go next

| Goal | File |
|---|---|
| Understand why four tokens | [docs/decisions/ADR-001.md](../decisions/ADR-001.md) |
| Understand contrast requirements | [docs/decisions/ADR-002.md](../decisions/ADR-002.md) |
| Understand the generator approach | [docs/decisions/ADR-003.md](../decisions/ADR-003.md) |
| Understand directory structure | [docs/decisions/ADR-004.md](../decisions/ADR-004.md) |
| Understand ANSI trade-offs | [docs/decisions/ADR-005.md](../decisions/ADR-005.md) |
| Understand full architecture | [docs/ARCHITECTURE.md](../ARCHITECTURE.md) |
| Contribute a theme or format | [CONTRIBUTING.md](../../CONTRIBUTING.md) |
