/**
 * Meta-tests that verify version pinning is consistent across all project
 * config files. These fail intentionally when a version upgrade is needed
 * and act as a checklist that every location has been updated.
 */

import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { join } from "node:path";

const REPO = join(import.meta.dirname, "../..");
const TARGET_NODE = 22;

describe("Node version pinning", () => {
  it(`package.json engines.node requires >=${TARGET_NODE}`, () => {
    const pkg = JSON.parse(readFileSync(join(REPO, "package.json"), "utf8"));
    assert.ok(pkg.engines?.node, "engines.node field is missing from package.json");
    const required = parseInt(pkg.engines.node.match(/\d+/)?.[0] ?? "0", 10);
    assert.ok(
      required >= TARGET_NODE,
      `engines.node is "${pkg.engines.node}", expected >=${TARGET_NODE}`,
    );
  });

  it(`CI workflow includes node-version ${TARGET_NODE} in matrix`, () => {
    const ci = readFileSync(join(REPO, ".github/workflows/ci.yml"), "utf8");
    assert.match(
      ci,
      new RegExp(`\\b${TARGET_NODE}\\b`),
      `CI workflow does not include node-version ${TARGET_NODE}`,
    );
  });

  it(`.nvmrc exists and contains >=${TARGET_NODE}`, () => {
    let content;
    try {
      content = readFileSync(join(REPO, ".nvmrc"), "utf8").trim();
    } catch {
      assert.fail(".nvmrc does not exist");
    }
    assert.ok(
      parseInt(content, 10) >= TARGET_NODE,
      `.nvmrc contains "${content}", expected >=${TARGET_NODE}`,
    );
  });
});
