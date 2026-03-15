#!/usr/bin/env node
/**
 * check-contrast — WCAG 2.1 contrast checker for gloam themes.
 *
 * Usage:
 *   node scripts/check-contrast.js              # check all themes
 *   node scripts/check-contrast.js eventide     # check one theme
 *   node scripts/check-contrast.js --min 7      # AAA threshold (default: 4.5)
 *   node scripts/check-contrast.js --json       # machine-readable output
 *
 * Exit code 0 = all pass, 1 = one or more fail.
 */

import { readFileSync, globSync } from "node:fs";
import { join } from "node:path";

const THEMES_DIR = join(import.meta.dirname, "../themes");

// ── WCAG 2.1 contrast calculation ────────────────────────────────────────────

function luminance(hex) {
  const c = hex.replace(/^#/, "");
  const toLinear = (v) => {
    const s = parseInt(c.slice(v, v + 2), 16) / 255;
    return s <= 0.04045 ? s / 12.92 : Math.pow((s + 0.055) / 1.055, 2.4);
  };
  return 0.2126 * toLinear(0) + 0.7152 * toLinear(2) + 0.0722 * toLinear(4);
}

function contrast(hex1, hex2) {
  const l1 = luminance(hex1);
  const l2 = luminance(hex2);
  const lighter = Math.max(l1, l2);
  const darker = Math.min(l1, l2);
  return (lighter + 0.05) / (darker + 0.05);
}

function wcagLevel(ratio) {
  if (ratio >= 7) return "AAA";
  if (ratio >= 4.5) return "AA";
  if (ratio >= 3) return "AA-Large";
  return "FAIL";
}

// ── CLI argument parsing ──────────────────────────────────────────────────────

const args = process.argv.slice(2);
let minRatio = 4.5;
let jsonMode = false;
const themeFilter = [];

for (let i = 0; i < args.length; i++) {
  if (args[i] === "--min" && args[i + 1]) {
    minRatio = parseFloat(args[++i]);
  } else if (args[i] === "--json") {
    jsonMode = true;
  } else if (!args[i].startsWith("--")) {
    themeFilter.push(args[i]);
  }
}

// ── Discover themes ───────────────────────────────────────────────────────────

const allNames = globSync("*/", { cwd: THEMES_DIR }).map((d) => d.replace(/\/$/, ""));
const names = themeFilter.length > 0 ? themeFilter : allNames;

const TOKEN_NAMES = ["primary", "accent", "muted", "error"];

const results = [];
let anyFail = false;

for (const name of names) {
  const jsonPath = join(THEMES_DIR, name, `${name}.json`);
  let theme;
  try {
    theme = JSON.parse(readFileSync(jsonPath, "utf8"));
  } catch (err) {
    results.push({ name, error: err.message });
    anyFail = true;
    continue;
  }

  const themeResults = { name, type: theme.type, background: theme.background, tokens: [] };

  for (const token of TOKEN_NAMES) {
    const hex = theme.tokens?.[token];
    if (!hex) continue;

    const ratio = contrast(hex, theme.background);
    const level = wcagLevel(ratio);
    const pass = ratio >= minRatio;
    if (!pass) anyFail = true;

    themeResults.tokens.push({
      token,
      hex,
      ratio: Math.round(ratio * 100) / 100,
      level,
      pass,
    });
  }
  results.push(themeResults);
}

// ── Output ────────────────────────────────────────────────────────────────────

if (jsonMode) {
  console.log(JSON.stringify(results, null, 2));
} else {
  const PASS = "✓";
  const FAIL = "✗";

  for (const r of results) {
    if (r.error) {
      console.error(`${FAIL}  ${r.name}: ${r.error}`);
      continue;
    }

    const allPass = r.tokens.every((t) => t.pass);
    const header = `${allPass ? PASS : FAIL}  ${r.name} (${r.type}) — bg ${r.background}`;
    console.log(header);

    for (const t of r.tokens) {
      const mark = t.pass ? PASS : FAIL;
      const line = `     ${mark}  tokens.${t.token.padEnd(8)} ${t.hex}  ${t.ratio.toFixed(2).padStart(5)}:1  ${t.level}`;
      console.log(line);
    }
  }

  const total = results.reduce((sum, r) => sum + (r.tokens?.length ?? 0), 0);
  const passed = results.reduce((sum, r) => sum + (r.tokens?.filter((t) => t.pass).length ?? 0), 0);
  const failed = total - passed;

  console.log(
    `\n${passed}/${total} checks passed (min ${minRatio}:1)${failed > 0 ? ` — ${failed} FAILED` : ""}`,
  );
}

process.exitCode = anyFail ? 1 : 0;
