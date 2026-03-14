# gloam — Architecture

## Why four semantic tokens?

Each theme exposes exactly four tokens: `primary`, `accent`, `muted`, `error`. Not ten, not twenty. The constraint is intentional.

A terminal prompt has three functional zones: navigation (where are you?), version control (what is the state?), and chrome (the structural furniture that frames the information). One color role per zone plus one error state is sufficient to express full semantic meaning. More tokens introduce ambiguity about what each role means and make it harder to port a theme to a new target without reinterpreting every decision.

The four tokens map directly to prompt elements: `primary` → directory, language badges; `accent` → git branch, prompt character, cursor; `muted` → username, time, box corners; `error` → fail state only. In editor targets (VS Code, Neovim, Zed, IntelliJ), these map to syntax roles via `syntax-map.js`.

## Why WCAG AA 4.5:1 as the baseline?

4.5:1 is the WCAG 2.1 AA threshold for normal text. It was chosen as the floor rather than 3:1 (large text) because terminal text is small, high-density, and frequently rendered at reduced contrast due to font anti-aliasing. A 4.5:1 measured contrast in a color picker translates to perceptible readability in a terminal at 12–14px.

3:1 would pass WCAG for large text (18px+ or 14px bold), but terminal prompts are not large text. The 4.5:1 baseline is the minimum that consistently reads clearly across typical display brightnesses (200–300 nits, sRGB).

## Why generator-over-manual?

Eleven target formats exist because eleven applications are in common use. Maintaining eleven hand-written files per theme across twelve themes (132 files) with no automation would make any token change a 132-file edit. Generators ensure that a single value change in `<name>.json` propagates correctly to every format in one `npm run generate` run.

The generator approach also enforces the constraint that every format derives from the same source of truth. Hand-written files diverge. Generated files cannot.

## How themes are evaluated for "distinct territory"

The twelve existing themes are distributed across: warm dark (Eventide, Ember, Cordovan, Tungsten), cool dark (Aether, Fjord, Umbra), green (Absinthe, Verdigris), neutral (Sable), purple (Amethyst), and light (Parchment). A new theme must occupy a hue territory not already represented, or a substantially different atmospheric concept within the same hue region. The hue territory table in `CONTRIBUTING.md` is authoritative for this evaluation.

## File structure decision

Each theme lives in its own directory (`themes/<name>/`) containing both the JSON source and all generated outputs. This keeps the source and its artifacts together, makes per-theme git diffs readable, and means `npx github:marvinrichter/gloam <theme> <target>` can discover and install any theme without a separate registry.

The generator writes outputs into `themes/<name>/` rather than `themes/<format>/` to maintain this per-theme locality. Flat format directories (`themes/alacritty/<name>.toml`) would scatter a single theme's files across the tree and make theme-level operations (delete, archive, inspect) harder.
