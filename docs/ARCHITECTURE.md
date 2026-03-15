# gloam — Architecture

## Why four semantic tokens?

Each theme exposes exactly four tokens: `primary`, `accent`, `muted`, `error`. Not ten, not twenty. The constraint is intentional.

A terminal prompt has three functional zones: navigation (where are you?), version control (what is the state?), and chrome (the structural furniture that frames the information). One color role per zone plus one error state is sufficient to express full semantic meaning. More tokens introduce ambiguity about what each role means and make it harder to port a theme to a new target without reinterpreting every decision.

The four tokens map directly to prompt elements: `primary` → directory, language badges; `accent` → git branch, prompt character, cursor; `muted` → username, time, box corners; `error` → fail state only. In editor targets (VS Code, Neovim, Zed, IntelliJ), these map to syntax roles via `syntax-map.js`.

## Why WCAG AA 4.5:1 as the baseline?

4.5:1 is the WCAG 2.1 AA threshold for normal text. It was chosen as the floor rather than 3:1 (large text) because terminal text is small, high-density, and frequently rendered at reduced contrast due to font anti-aliasing. A 4.5:1 measured contrast in a color picker translates to perceptible readability in a terminal at 12–14px.

3:1 would pass WCAG for large text (18px+ or 14px bold), but terminal prompts are not large text. The 4.5:1 baseline is the minimum that consistently reads clearly across typical display brightnesses (200–300 nits, sRGB).

## Why generator-over-manual?

Sixteen target formats exist because sixteen applications are in common use. Maintaining sixteen hand-written files per theme across thirty-eight themes (608 files) with no automation would make any token change a 608-file edit. Generators ensure that a single value change in `<name>.json` propagates correctly to every format in one `npm run generate` run.

The generator approach also enforces the constraint that every format derives from the same source of truth. Hand-written files diverge. Generated files cannot.

## How themes are evaluated for "distinct territory"

The thirty-eight themes are distributed across: warm dark (Eventide, Ember, Cordovan, Tungsten, Nocturne, Tallow, Bamboo, Carmine, Rosewater), cool dark (Aether, Fjord, Umbra, Cobalt, Ironcast, Sumi, Synthwave, Dusk), green dark (Absinthe, Verdigris, Petrichor, Canopy), teal dark (Nacreous, Basalt), neutral dark (Sable, Graphite, Cast, Noir, Weld), purple dark (Amethyst), and light (Parchment, Daybook, Cirrus, Solano, Saffron, Ochre, Bloom, Fern, Stark). A new theme must occupy a hue territory not already represented, or a substantially different atmospheric concept within the same hue region. The hue territory table in `CONTRIBUTING.md` is authoritative for this evaluation.

## Why prompt configuration is shared between Starship and Oh My Posh

The `prompt` section in each theme's JSON (`layout`, `fill`, `timePrefix`, `successSymbol`, `vimSymbol`) is consumed by both the Starship generator (`scripts/generators/starship.js`) and the Oh My Posh generator (`scripts/generators/oh-my-posh.js`). Terminal emulators receive only the color palette; editors receive only the syntax token mapping.

The two prompt tools share the same `prompt` key because they expose the same conceptual controls: prompt layout, fill character, time prefix symbol, and vim mode indicator. The mapping is direct enough that a single flat structure works for both. If a future prompt tool requires fields that conflict with Starship or Oh My Posh, the `prompt` key should be refactored to a keyed object: `"prompt": { "starship": { ... }, "oh-my-posh": { ... } }`.

## ANSI palette design: visual harmony over role-name correctness

The 16-color ANSI palette in each theme is mapped by visual harmony with the semantic tokens, not by ANSI role names. For example, a warm gray-green may be placed in slot 12 ("bright blue") because it complements the primary and muted tokens perceptually, even though a strict reading of ANSI role semantics would expect blue-family colors there.

**The trade-off:** Tools that read ANSI colors by role name rather than by index — some `man` page renderers, file managers, system status tools — may display unexpected colors. A theme that places a teal in the "bright magenta" slot will look wrong to a `man` renderer that maps `manpage headers → bright magenta`. This is a known and accepted consequence of the design approach.

**Why this is correct for gloam:** gloam themes are designed for the Starship prompt and for editor syntax highlighting. Both use colors by index, not by role name. The Starship generator assigns specific ANSI slots to specific prompt elements; VS Code and Neovim generators map ANSI slots to syntax roles via `syntax-map.js`. In these contexts, visual harmony is more important than role-name correctness. The semantic tokens (`primary`, `accent`, `muted`, `error`) carry the authoritative role mapping; the ANSI palette is a harmonized extension of those tokens for syntax contexts.

**Documentation:** This decision is formally recorded in `docs/decisions/ADR-005.md`. Theme guides document the ANSI design logic individually in each `themes/<name>/<name>.md`.

## File structure decision

Each theme lives in its own directory (`themes/<name>/`) containing both the JSON source and all generated outputs. This keeps the source and its artifacts together, makes per-theme git diffs readable, and means `npx github:marvinrichter/gloam <theme> <target>` can discover and install any theme without a separate registry.

The generator writes outputs into `themes/<name>/` rather than `themes/<format>/` to maintain this per-theme locality. Flat format directories (`themes/alacritty/<name>.toml`) would scatter a single theme's files across the tree and make theme-level operations (delete, archive, inspect) harder.
