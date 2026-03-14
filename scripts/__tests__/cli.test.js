import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { spawn } from "node:child_process";
import { join } from "node:path";

const ROOT = join(import.meta.dirname, "../..");

function run(script, args = []) {
  return new Promise((resolve, reject) => {
    const child = spawn(process.execPath, [script, ...args], { cwd: ROOT });
    let stdout = "";
    let stderr = "";
    child.stdout.on("data", (d) => (stdout += d));
    child.stderr.on("data", (d) => (stderr += d));
    child.on("close", (code) => resolve({ code, stdout, stderr }));
    child.on("error", reject);
  });
}

describe("generate.js CLI", () => {
  it("exits 0 when themes directory exists and is populated", async () => {
    const { code, stderr } = await run("scripts/generate.js");
    assert.strictEqual(code, 0, `expected exit 0, got ${code}. stderr: ${stderr}`);
  });

  it("prints 'Done.' on success", async () => {
    const { stdout } = await run("scripts/generate.js");
    assert.ok(stdout.includes("Done."), `expected 'Done.' in stdout: ${stdout}`);
  });

  it("prints a line per theme on success", async () => {
    const { stdout } = await run("scripts/generate.js");
    assert.ok(stdout.includes("themes/eventide/"), `expected eventide in stdout: ${stdout}`);
  });
});

describe("install.js CLI", () => {
  it("exits 1 and prints usage when called with no arguments", async () => {
    const { code, stdout } = await run("scripts/install.js");
    assert.strictEqual(code, 1, `expected exit 1, got ${code}`);
    assert.ok(stdout.includes("Usage"), `expected 'Usage' in stdout: ${stdout}`);
  });

  it("usage output lists known themes", async () => {
    const { stdout } = await run("scripts/install.js");
    assert.ok(stdout.includes("eventide"), `expected 'eventide' in stdout: ${stdout}`);
  });

  it("usage output lists known targets", async () => {
    const { stdout } = await run("scripts/install.js");
    assert.ok(stdout.includes("starship"), `expected 'starship' in stdout: ${stdout}`);
  });
});
