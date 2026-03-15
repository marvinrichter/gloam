import { copyFileSync, existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname } from "node:path";

export function ensureDir(p) {
  mkdirSync(p, { recursive: true });
}

export function copy(src, dest) {
  ensureDir(dirname(dest));
  copyFileSync(src, dest);
}

export function readText(p) {
  return existsSync(p) ? readFileSync(p, "utf8") : null;
}

export function writeText(p, content) {
  ensureDir(dirname(p));
  writeFileSync(p, content, "utf8");
}

export function readJson(p) {
  const raw = readText(p);
  return raw ? JSON.parse(raw) : null;
}

export function writeJson(p, obj) {
  ensureDir(dirname(p));
  writeFileSync(p, JSON.stringify(obj, null, 2) + "\n", "utf8");
}

export function capitalize(s) {
  return s.charAt(0).toUpperCase() + s.slice(1);
}

/**
 * Find a line matching `pattern` and replace it with `line`.
 * If no match, append `line` at the end.
 * If the file doesn't exist, create it containing only `line`.
 * Returns "created" | "updated" | "appended".
 */
export function upsertLine(filePath, pattern, line) {
  const existing = readText(filePath);
  if (existing === null) {
    writeText(filePath, line + "\n");
    return "created";
  }
  if (pattern.test(existing)) {
    // Use a global version of the pattern so all matching occurrences are replaced,
    // preventing duplicates if a user config has multiple matching lines.
    let globalPattern;
    try {
      globalPattern = new RegExp(pattern.source, pattern.flags.includes("g") ? pattern.flags : `${pattern.flags}g`);
    } catch (err) {
      throw new Error(`upsertLine: invalid regex pattern (${pattern}): ${err.message}`);
    }
    writeText(filePath, existing.replace(globalPattern, line));
    return "updated";
  }
  writeText(filePath, existing.trimEnd() + "\n" + line + "\n");
  return "appended";
}
