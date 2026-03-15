#!/usr/bin/env node
/**
 * validate-schemas.js — Validate all theme JSON source files against
 * docs/specifications/theme-schema.json (JSON Schema draft-07).
 *
 * Usage:
 *   node scripts/ci/validate-schemas.js
 *
 * Exit code 0 = all valid, 1 = one or more invalid.
 */

import { readFileSync, globSync } from "node:fs";
import { join } from "node:path";
import Ajv from "ajv";
import addFormats from "ajv-formats";

const ROOT = join(import.meta.dirname, "../..");
const THEMES_DIR = join(ROOT, "themes");
const SCHEMA_PATH = join(ROOT, "docs/specifications/theme-schema.json");

const schema = JSON.parse(readFileSync(SCHEMA_PATH, "utf8"));

const ajv = new Ajv({ strict: false, allErrors: true });
addFormats(ajv);
const validate = ajv.compile(schema);

const themeFiles = globSync("*/*.json", { cwd: THEMES_DIR });
// Only the source-of-truth files: themes/<name>/<name>.json
const sourceFiles = themeFiles.filter((f) => {
  const parts = f.split("/");
  return parts.length === 2 && parts[0] === parts[1].replace(".json", "");
});

let anyFail = false;
const PASS = "✓";
const FAIL = "✗";

for (const rel of sourceFiles.sort()) {
  const abs = join(THEMES_DIR, rel);
  let data;
  try {
    data = JSON.parse(readFileSync(abs, "utf8"));
  } catch (err) {
    console.error(`${FAIL}  ${rel}: JSON parse error — ${err.message}`);
    anyFail = true;
    continue;
  }

  const valid = validate(data);
  if (valid) {
    console.log(`${PASS}  ${rel}`);
  } else {
    anyFail = true;
    console.error(`${FAIL}  ${rel}`);
    for (const err of validate.errors) {
      console.error(`       ${err.instancePath || "/"} ${err.message}`);
    }
  }
}

const total = sourceFiles.length;
console.log(
  `\n${total} theme${total !== 1 ? "s" : ""} validated${anyFail ? " — FAILURES FOUND" : " — all valid"}`,
);

process.exitCode = anyFail ? 1 : 0;
