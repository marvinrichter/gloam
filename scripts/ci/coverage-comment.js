#!/usr/bin/env node
/**
 * coverage-comment.js — Parse node:test coverage output and emit a GitHub Markdown
 * PR comment body (zero dependencies).
 *
 * Usage:
 *   node scripts/ci/coverage-comment.js <test-output-file>
 *
 * Output: Markdown to stdout — pipe to `gh pr comment --body-file -`
 *
 * node:test coverage lines are prefixed with "ℹ " (U+2139 + space).
 * The coverage block runs from "start of coverage report" to "end of coverage report".
 */

import { readFileSync } from "node:fs";

const file = process.argv[2];
if (!file) {
  process.stderr.write("Usage: coverage-comment.js <test-output-file>\n");
  process.exit(1);
}

const text = readFileSync(file, "utf8");

const START = "start of coverage report";
const END = "end of coverage report";

const startIdx = text.indexOf(START);
const endIdx = text.indexOf(END);

if (startIdx === -1 || endIdx === -1) {
  process.stdout.write("_No coverage data found in test output._\n");
  process.exit(0);
}

const block = text.slice(startIdx + START.length, endIdx);

// Strip the "ℹ " info prefix that node:test prepends to every coverage line
const stripPrefix = (l) => {
  const m = l.match(/ℹ\s+(.*)/);
  return m ? m[1] : null;
};

const infoLines = block.split("\n").map(stripPrefix).filter(Boolean);

// Parse a pipe-delimited row into { file, lines, branches, funcs, uncovered }
const parseRow = (line) => {
  if (!line.includes("|")) return null;
  if (line.trimStart().startsWith("-")) return null;
  const parts = line.split("|").map((p) => p.trim());
  if (parts.length < 4) return null;
  return {
    file: parts[0],
    lines: parts[1],
    branches: parts[2],
    funcs: parts[3],
    uncovered: parts[4] ?? "",
  };
};

const rows = infoLines.map(parseRow).filter(Boolean);

const summary = rows.find((r) => r.file === "all files");
// File rows: have a "." in the name (i.e. have an extension) and aren't the header
const fileRows = rows.filter(
  (r) => r.file !== "all files" && r.file !== "file" && r.file.includes("."),
);

// Colour-code coverage percentages with emoji
const badge = (numStr) => {
  const n = parseFloat(numStr);
  if (isNaN(n)) return "";
  if (n >= 90) return "🟢";
  if (n >= 80) return "🟡";
  return "🔴";
};

const out = [];

out.push("## 📊 Test Coverage");
out.push("");

if (summary) {
  out.push("| Metric | Coverage | |");
  out.push("|--------|----------|-|");
  out.push(`| Lines | \`${summary.lines}%\` | ${badge(summary.lines)} |`);
  out.push(`| Branches | \`${summary.branches}%\` | ${badge(summary.branches)} |`);
  out.push(`| Functions | \`${summary.funcs}%\` | ${badge(summary.funcs)} |`);
  out.push("");
}

if (fileRows.length > 0) {
  out.push("<details><summary>Per-file breakdown</summary>");
  out.push("");
  out.push("| File | Lines | Branches | Functions | Uncovered lines |");
  out.push("|------|-------|----------|-----------|-----------------|");
  for (const r of fileRows) {
    const unc = r.uncovered.trim() ? `\`${r.uncovered.trim()}\`` : "—";
    out.push(
      `| \`${r.file}\` | ${badge(r.lines)} \`${r.lines}%\` | ${badge(r.branches)} \`${r.branches}%\` | ${badge(r.funcs)} \`${r.funcs}%\` | ${unc} |`,
    );
  }
  out.push("");
  out.push("</details>");
}

process.stdout.write(out.join("\n") + "\n");
