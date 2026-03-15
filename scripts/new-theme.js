#!/usr/bin/env node
/**
 * new-theme — interactive scaffold for a new gloam theme.
 *
 * Usage:
 *   node scripts/new-theme.js
 *   node scripts/new-theme.js --name <slug>
 *
 * Creates:
 *   themes/<name>/<name>.json   source of truth with placeholder values
 *   themes/<name>/<name>.md     design system guide stub
 *
 * After editing the JSON, run:
 *   npm run generate            regenerate all 16 output formats
 *   npm test                    verify WCAG AA contrast + schema
 */

import { createInterface } from "node:readline/promises";
import { existsSync, mkdirSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { fileURLToPath } from "node:url";
import { stdin as input, stdout as output } from "node:process";

// ── Template builders (exported for testing) ──────────────────────────────────

export function buildThemeJson(data) {
  return {
    name: data.name,
    displayName: data.displayName,
    type: data.type,
    background: data.background,
    foreground: data.foreground,
    tokens: {
      primary: data.primary,
      accent: data.accent,
      muted: data.muted,
      error: data.error,
    },
    ansi: [
      data.background, // 0  black = background
      "#602020", // 1  muted red
      "#206030", // 2  muted green
      "#604820", // 3  muted yellow
      "#202060", // 4  muted blue
      "#482060", // 5  muted magenta
      "#206060", // 6  muted cyan
      "#606060", // 7  muted white
      data.type === "dark" ? "#2A2A2A" : "#D0C8B8", // 8  bright-black = dim bg
      data.error, // 9  bright red ≈ error
      "#30A050", // 10 bright green (string color)
      data.primary, // 11 bright yellow = primary
      data.muted, // 12 bright blue = muted
      "#A070C0", // 13 bright magenta (constant)
      "#30A0A0", // 14 bright cyan
      data.foreground, // 15 bright white = foreground
    ],
    ui: {
      cursor: data.accent,
      cursorText: data.background,
      selection: data.type === "dark" ? "#2A2A3A" : "#D8CCA8",
      selectionText: data.foreground,
      bold: data.foreground,
      link: data.accent,
    },
    prompt: {
      layout: data.layout,
      showUsername: false,
      fill: data.fill,
      timePrefix: data.timePrefix,
      successSymbol: data.layout === "two-line-box" ? "❯" : "›",
      vimSymbol: data.layout === "two-line-box" ? "❮" : "‹",
    },
  };
}

export function buildThemeMd(data) {
  return `# ${data.displayName} — Design System

> ${data.concept}

---

## Concept

<!-- TODO: describe the specific atmospheric or material moment this theme captures -->
<!-- Every color choice should be defensible from the concept above -->

---

## Color System

### Semantic tokens

All tokens verified against background \`${data.background}\`.

\`\`\`
primary    ${data.primary}   TODO: describe the token role
accent     ${data.accent}   TODO: describe the token role
muted      ${data.muted}   TODO: describe the token role
error      ${data.error}   TODO: describe the token role
\`\`\`

---

## File Reference

\`\`\`
themes/${data.name}/
├── ${data.name}.json           source of truth
├── ${data.name}.md             this document
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
\`\`\`

## Install

\`\`\`bash
npx github:marvinrichter/gloam ${data.name} starship
\`\`\`
`;
}

// ── WCAG contrast (exported for testing) ──────────────────────────────────────

export function luminance(hex) {
  const c = hex.replace(/^#/, "");
  const toLinear = (v) => {
    const s = parseInt(c.slice(v, v + 2), 16) / 255;
    return s <= 0.04045 ? s / 12.92 : Math.pow((s + 0.055) / 1.055, 2.4);
  };
  return 0.2126 * toLinear(0) + 0.7152 * toLinear(2) + 0.0722 * toLinear(4);
}

export function contrast(hex1, hex2) {
  const l1 = luminance(hex1);
  const l2 = luminance(hex2);
  const lighter = Math.max(l1, l2);
  const darker = Math.min(l1, l2);
  return (lighter + 0.05) / (darker + 0.05);
}

// ── Scaffold (exported for testing) ───────────────────────────────────────────

/**
 * Write theme JSON + MD files and run the WCAG pre-check.
 * Returns { wcagResults, anyFail } so callers can format output however they like.
 */
export function scaffoldTheme(data, themesDir) {
  const tokenChecks = {
    primary: data.primary,
    accent: data.accent,
    muted: data.muted,
    error: data.error,
  };
  let anyFail = false;
  const wcagResults = [];
  for (const [token, hex] of Object.entries(tokenChecks)) {
    const ratio = contrast(hex, data.background);
    if (isNaN(ratio)) {
      wcagResults.push({ token, hex, pass: false, invalid: true });
      anyFail = true;
      continue;
    }
    const pass = ratio >= 4.5;
    if (!pass) anyFail = true;
    wcagResults.push({ token, hex, ratio, pass });
  }

  const themeDir = join(themesDir, data.name);
  mkdirSync(themeDir, { recursive: true });
  writeFileSync(
    join(themeDir, `${data.name}.json`),
    JSON.stringify(buildThemeJson(data), null, 2) + "\n",
    "utf8",
  );
  writeFileSync(join(themeDir, `${data.name}.md`), buildThemeMd(data), "utf8");

  return { wcagResults, anyFail };
}

// ── CLI (only runs when executed directly, not when imported as a module) ──────

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  const THEMES_DIR = join(import.meta.dirname, "../themes");

  // ── Prompt helpers ────────────────────────────────────────────────────────────

  const rl = createInterface({ input, output });

  async function ask(question, defaultVal) {
    const hint = defaultVal !== undefined ? ` [${defaultVal}]` : "";
    const answer = await rl.question(`${question}${hint}: `);
    return answer.trim() || defaultVal || "";
  }

  async function askChoice(question, choices, defaultVal) {
    const hint = `(${choices.join(" / ")})`;
    const answer = await ask(`${question} ${hint}`, defaultVal);
    if (!choices.includes(answer)) {
      console.log(`  Invalid choice. Using default: ${defaultVal}`);
      return defaultVal;
    }
    return answer;
  }

  // ── Main ──────────────────────────────────────────────────────────────────────

  const cliName = process.argv.find((a, i) => process.argv[i - 1] === "--name");

  console.log(`
gloam new-theme scaffold
─────────────────────────
`);

  const name = (cliName || (await ask("Theme slug (lowercase, no spaces)", "my-theme")))
    .toLowerCase()
    .replace(/\s+/g, "-");

  if (existsSync(join(THEMES_DIR, name))) {
    console.error(`\nError: themes/${name}/ already exists.`);
    rl.close();
    process.exit(1);
  }

  const displayName = await ask("Display name", name.charAt(0).toUpperCase() + name.slice(1));
  const concept = await ask("One-line concept (e.g. 'sunset over a volcanic coastline')");
  const type = await askChoice("Background type", ["dark", "light"], "dark");

  console.log(`\nBackground and foreground:`);
  const background = await ask("Background hex (#RRGGBB)", type === "dark" ? "#0D1020" : "#F5EDE0");
  const foreground = await ask("Foreground hex (#RRGGBB)", type === "dark" ? "#E0D8C8" : "#2A1C10");

  console.log(`\nSemantic tokens (must each achieve ≥4.5:1 against background ${background}):`);
  const primary = await ask(
    "primary hex (navigation — directory, languages)",
    type === "dark" ? "#80C0E0" : "#4A2010",
  );
  const accent = await ask(
    "accent hex  (action — git, cursor, prompt char)",
    type === "dark" ? "#E0A060" : "#1A3A70",
  );
  const muted = await ask(
    "muted hex   (chrome — time, fill, box corners)  ",
    type === "dark" ? "#7080A0" : "#6A5040",
  );
  const error = await ask(
    "error hex   (fail state only)                    ",
    type === "dark" ? "#E06060" : "#7A1820",
  );

  console.log(`\nPrompt personality:`);
  const layout = await askChoice("Layout", ["two-line-box", "single-line"], "two-line-box");
  const fill = await ask("Fill character between modules and time", "·");
  const timePrefix = await ask("Time prefix symbol", "◆");

  rl.close();

  const data = {
    name,
    displayName,
    concept,
    type,
    background,
    foreground,
    primary,
    accent,
    muted,
    error,
    layout,
    fill,
    timePrefix,
  };

  // ── WCAG pre-check + file writing (via exported scaffoldTheme) ────────────────

  console.log(`\nWCAG AA pre-check (≥4.5:1 vs ${background}):`);
  const { wcagResults, anyFail } = scaffoldTheme(data, THEMES_DIR);
  for (const r of wcagResults) {
    if (r.invalid) {
      console.log(`  ✗  tokens.${r.token} = ${r.hex} — invalid hex`);
    } else {
      console.log(
        `  ${r.pass ? "✓" : "✗"}  tokens.${r.token.padEnd(8)} ${r.hex}  ${r.ratio.toFixed(2)}:1  ${r.pass ? "AA" : "FAIL"}`,
      );
    }
  }

  if (anyFail) {
    console.log(
      `\nWarning: one or more tokens fail WCAG AA. Adjust token colors before running 'npm test'.`,
    );
  }

  console.log(`
Created:
  themes/${name}/${name}.json
  themes/${name}/${name}.md

Next steps:
  1. Edit themes/${name}/${name}.json — tune ANSI palette and UI slots
  2. Run: npm run generate          — produce all 16 format files
  3. Run: npm test                  — verify WCAG AA contrast + schema
  4. Run: npm run check-contrast    — view contrast ratios for the new theme
`);
}
