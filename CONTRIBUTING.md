# Contributing to gloam

gloam is a collection of twelve terminal and editor theme design systems. Contributions are welcome — new themes, new target formats, and fixes to existing ones.

---

## Development setup

**Prerequisites:** Node.js 20+, JetBrains Mono Nerd Font

```bash
git clone https://github.com/marvinrichter/gloam.git
cd gloam
npm install

# Run the test suite (166 tests, node:test)
npm test

# Regenerate all eleven formats from the theme JSON source files
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
2. **WCAG AA contrast** — all four tokens must achieve ≥ 4.5:1 against the background. Include the luminance calculations in `<name>.md`
3. **Coherent ANSI palette** — ANSI slots must derive from the semantic tokens, not be chosen independently. Syntax highlighting will use these — they must harmonise with the prompt
4. **Distinct territory** — the theme must occupy a different hue family or atmospheric concept from the existing twelve. See the "What to avoid" section in the README
5. **A concept** — the theme derives from a specific atmospheric or material reference. Color choices must be defensible from that concept, not arbitrary
6. **Design guide** — `<name>.md` must follow the structure of any existing guide, including the contrast compliance table with luminance calculations

Once both files exist, run:

```bash
npm run generate   # produces all 11 format files in themes/<name>/
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

---

## Modifying an existing theme

- Edit `themes/<name>/<name>.json` — the single source of truth
- Re-verify all contrast ratios if any token changes
- Update the `<name>.md` contrast table to match
- Run `npm run generate` to regenerate all format files
- Run `npm test` — tests verify output correctness

---

## Adding a new target format

New formats require:

1. A generator module at `scripts/generators/<format>.js` — follow the pattern of an existing generator
2. Registration in `scripts/generate.js`
3. Tests in `scripts/__tests__/` — at minimum one test per theme
4. Documentation in the README install section and `docs/index.html`

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
