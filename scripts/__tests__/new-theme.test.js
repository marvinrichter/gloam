import { describe, it, before, after } from "node:test";
import assert from "node:assert/strict";
import { spawnSync, spawn } from "node:child_process";
import { mkdirSync, rmSync, existsSync, readFileSync } from "node:fs";
import { join } from "node:path";
import { tmpdir } from "node:os";
import { fileURLToPath } from "node:url";
import { buildThemeJson, buildThemeMd, luminance, contrast, scaffoldTheme } from "../new-theme.js";

const SCRIPT = join(fileURLToPath(import.meta.url), "..", "..", "new-theme.js");

// ── Shared test data ──────────────────────────────────────────────────────────

const DATA = {
  name: "testtheme",
  displayName: "Test Theme",
  concept: "a violet sky at dusk",
  type: "dark",
  background: "#0D1020",
  foreground: "#E0D8C8",
  primary: "#80C0E0",
  accent: "#E0A060",
  muted: "#7080A0",
  error: "#E06060",
  layout: "two-line-box",
  fill: "─",
  timePrefix: "◆",
};

const LIGHT_DATA = { ...DATA, name: "lighttest", type: "light" };

// ── buildThemeJson ────────────────────────────────────────────────────────────

describe("buildThemeJson", () => {
  it("returns an object", () => {
    assert.strictEqual(typeof buildThemeJson(DATA), "object");
  });

  it("sets name and displayName", () => {
    const obj = buildThemeJson(DATA);
    assert.strictEqual(obj.name, "testtheme");
    assert.strictEqual(obj.displayName, "Test Theme");
  });

  it("sets type", () => {
    assert.strictEqual(buildThemeJson(DATA).type, "dark");
    assert.strictEqual(buildThemeJson(LIGHT_DATA).type, "light");
  });

  it("sets background and foreground", () => {
    const obj = buildThemeJson(DATA);
    assert.strictEqual(obj.background, "#0D1020");
    assert.strictEqual(obj.foreground, "#E0D8C8");
  });

  it("tokens block has all 4 semantic colors", () => {
    const { tokens } = buildThemeJson(DATA);
    assert.strictEqual(tokens.primary, "#80C0E0");
    assert.strictEqual(tokens.accent, "#E0A060");
    assert.strictEqual(tokens.muted, "#7080A0");
    assert.strictEqual(tokens.error, "#E06060");
  });

  it("ansi array has exactly 16 entries", () => {
    const obj = buildThemeJson(DATA);
    assert.ok(Array.isArray(obj.ansi));
    assert.strictEqual(obj.ansi.length, 16);
  });

  it("ansi[0] is background (black = background)", () => {
    assert.strictEqual(buildThemeJson(DATA).ansi[0], "#0D1020");
  });

  it("ansi[15] is foreground (bright white = foreground)", () => {
    assert.strictEqual(buildThemeJson(DATA).ansi[15], "#E0D8C8");
  });

  it("dark theme uses dark bright-black value", () => {
    assert.strictEqual(buildThemeJson(DATA).ansi[8], "#2A2A2A");
  });

  it("light theme uses light bright-black value", () => {
    assert.strictEqual(buildThemeJson(LIGHT_DATA).ansi[8], "#D0C8B8");
  });

  it("ui.cursor is accent color", () => {
    assert.strictEqual(buildThemeJson(DATA).ui.cursor, "#E0A060");
  });

  it("ui.cursorText is background", () => {
    assert.strictEqual(buildThemeJson(DATA).ui.cursorText, "#0D1020");
  });

  it("prompt block has layout and symbols", () => {
    const { prompt } = buildThemeJson(DATA);
    assert.strictEqual(prompt.layout, "two-line-box");
    assert.strictEqual(prompt.successSymbol, "❯");
    assert.strictEqual(prompt.vimSymbol, "❮");
  });

  it("single-line layout uses › and ‹ symbols", () => {
    const obj = buildThemeJson({ ...DATA, layout: "single-line" });
    assert.strictEqual(obj.prompt.successSymbol, "›");
    assert.strictEqual(obj.prompt.vimSymbol, "‹");
  });

  it("dark theme selection uses dark selection color", () => {
    assert.strictEqual(buildThemeJson(DATA).ui.selection, "#2A2A3A");
  });

  it("light theme selection uses light selection color", () => {
    assert.strictEqual(buildThemeJson(LIGHT_DATA).ui.selection, "#D8CCA8");
  });
});

// ── buildThemeMd ──────────────────────────────────────────────────────────────

describe("buildThemeMd", () => {
  it("returns a string", () => {
    assert.strictEqual(typeof buildThemeMd(DATA), "string");
  });

  it("starts with an H1 heading containing displayName", () => {
    assert.match(buildThemeMd(DATA), /^# Test Theme/);
  });

  it("includes the concept line", () => {
    assert.match(buildThemeMd(DATA), /a violet sky at dusk/);
  });

  it("includes all 4 token hex values", () => {
    const md = buildThemeMd(DATA);
    assert.match(md, /#80C0E0/);
    assert.match(md, /#E0A060/);
    assert.match(md, /#7080A0/);
    assert.match(md, /#E06060/);
  });

  it("has Color System section", () => {
    assert.match(buildThemeMd(DATA), /## Color System/);
  });

  it("has File Reference section listing all output files", () => {
    const md = buildThemeMd(DATA);
    assert.match(md, /## File Reference/);
    assert.match(md, /starship\.toml/);
    assert.match(md, /vscode\.json/);
    assert.match(md, /neovim\.lua/);
  });

  it("has Install section with npx command", () => {
    const md = buildThemeMd(DATA);
    assert.match(md, /## Install/);
    assert.match(md, /npx.*testtheme/);
  });
});

// ── luminance ─────────────────────────────────────────────────────────────────

describe("luminance", () => {
  it("black returns 0", () => {
    assert.strictEqual(luminance("#000000"), 0);
  });

  it("white returns 1", () => {
    assert.ok(Math.abs(luminance("#FFFFFF") - 1) < 0.0001);
  });

  it("mid-gray returns ~0.2158", () => {
    assert.ok(Math.abs(luminance("#808080") - 0.2158) < 0.001);
  });

  it("works without leading #", () => {
    assert.strictEqual(luminance("000000"), 0);
  });

  it("red channel contributes 0.2126 weight", () => {
    // Pure red #FF0000: sRGB linear ≈ 0.2126 * 1 = 0.2126
    assert.ok(Math.abs(luminance("#FF0000") - 0.2126) < 0.0001);
  });
});

// ── contrast ──────────────────────────────────────────────────────────────────

describe("contrast", () => {
  it("black on white returns 21", () => {
    assert.ok(Math.abs(contrast("#000000", "#FFFFFF") - 21) < 0.01);
  });

  it("white on black returns 21 (symmetric)", () => {
    assert.ok(Math.abs(contrast("#FFFFFF", "#000000") - 21) < 0.01);
  });

  it("same color returns 1", () => {
    assert.ok(Math.abs(contrast("#808080", "#808080") - 1) < 0.001);
  });

  it("gloam dark primary clears WCAG AA (≥4.5:1)", () => {
    // eventide: primary #E8B86D on background #0D0F1A
    assert.ok(contrast("#E8B86D", "#0D0F1A") >= 4.5);
  });

  it("very low contrast pair is below 4.5:1", () => {
    // #505050 on #0D1020 is ~2.5:1
    assert.ok(contrast("#505050", "#0D1020") < 4.5);
  });
});

// ── CLI — error paths (no stdin required) ─────────────────────────────────────

describe("new-theme.js CLI — error paths", () => {
  it("exits 1 and reports error when theme directory already exists", () => {
    const slug = "test-scaffold-exists-tmp";
    const realDir = join(fileURLToPath(import.meta.url), "..", "..", "..", "themes", slug);
    mkdirSync(realDir, { recursive: true });
    try {
      const result = spawnSync(process.execPath, [SCRIPT, "--name", slug], {
        input: "\n",
        encoding: "utf8",
        timeout: 5_000,
      });
      assert.strictEqual(result.status, 1);
      assert.match(result.stderr, /already exists/i);
    } finally {
      rmSync(realDir, { recursive: true, force: true });
    }
  });
});

// ── scaffoldTheme ─────────────────────────────────────────────────────────────

describe("scaffoldTheme", () => {
  const TMP = join(tmpdir(), `scaffold-test-${Date.now()}`);

  before(() => mkdirSync(TMP, { recursive: true }));
  after(() => rmSync(TMP, { recursive: true, force: true }));

  it("creates the theme directory", () => {
    scaffoldTheme(DATA, TMP);
    assert.ok(existsSync(join(TMP, DATA.name)));
  });

  it("writes a valid JSON file", () => {
    const content = readFileSync(join(TMP, DATA.name, `${DATA.name}.json`), "utf8");
    assert.doesNotThrow(() => JSON.parse(content));
    const obj = JSON.parse(content);
    assert.strictEqual(obj.name, DATA.name);
    assert.ok(Array.isArray(obj.ansi) && obj.ansi.length === 16);
  });

  it("writes an MD file", () => {
    const content = readFileSync(join(TMP, DATA.name, `${DATA.name}.md`), "utf8");
    assert.match(content, /## Color System/);
  });

  it("returns wcagResults array with one entry per token", () => {
    const { wcagResults } = scaffoldTheme(DATA, TMP);
    assert.strictEqual(wcagResults.length, 4);
    assert.ok(wcagResults.every((r) => "token" in r && "hex" in r && "pass" in r));
  });

  it("returns anyFail=false when all tokens pass WCAG AA", () => {
    const { anyFail } = scaffoldTheme(DATA, TMP);
    assert.strictEqual(anyFail, false);
  });

  it("all tokens pass for default dark DATA", () => {
    const { wcagResults } = scaffoldTheme(DATA, TMP);
    assert.ok(wcagResults.every((r) => r.pass));
  });

  it("returns anyFail=true when a token fails WCAG AA", () => {
    const failData = { ...DATA, name: "scaffold-fail-tmp", primary: "#505050" };
    const { anyFail, wcagResults } = scaffoldTheme(failData, TMP);
    assert.strictEqual(anyFail, true);
    const primary = wcagResults.find((r) => r.token === "primary");
    assert.strictEqual(primary.pass, false);
    rmSync(join(TMP, failData.name), { recursive: true, force: true });
  });

  it("marks token as invalid when hex is malformed", () => {
    const badData = { ...DATA, name: "scaffold-bad-hex-tmp", primary: "notahex" };
    const { wcagResults, anyFail } = scaffoldTheme(badData, TMP);
    const primary = wcagResults.find((r) => r.token === "primary");
    assert.ok(primary.invalid);
    assert.strictEqual(anyFail, true);
    rmSync(join(TMP, badData.name), { recursive: true, force: true });
  });
});

// ── CLI — happy path (spawn, delayed stdin so readline initialises first) ──────

describe("new-theme.js CLI — happy path", () => {
  // Answers for each readline prompt (all defaults, except concept which has no default)
  const ANSWERS = ["", "test concept", "", "", "", "", "", "", "", "", "", ""];

  function runCli(slug, answers) {
    return new Promise((resolve, reject) => {
      const realDir = join(fileURLToPath(import.meta.url), "..", "..", "..", "themes", slug);
      const child = spawn(process.execPath, [SCRIPT, "--name", slug], {
        stdio: ["pipe", "pipe", "pipe"],
      });

      let stdout = "";
      child.stdout.on("data", (d) => (stdout += d));

      // Write answers one at a time with a gap between each so the async chain
      // has time to call rl.question() before the next answer arrives.
      // Sending all answers at once causes readline to fire all 'line' events
      // before later question() calls can register their listeners.
      const INTERVAL_MS = 60;
      const timers = [];
      const initial = setTimeout(() => {
        answers.forEach((answer, i) => {
          const t = setTimeout(() => child.stdin.write(answer + "\n"), i * INTERVAL_MS);
          timers.push(t);
        });
      }, 100);
      timers.push(initial);

      child.on("close", (code) => {
        timers.forEach(clearTimeout);
        resolve({ code, stdout, realDir });
      });

      child.on("error", (err) => {
        timers.forEach(clearTimeout);
        reject(err);
      });
    });
  }

  it("exits 0 and creates JSON + MD files", async () => {
    const slug = "test-cli-happy-tmp";
    const { code, realDir } = await runCli(slug, ANSWERS);
    try {
      assert.strictEqual(code, 0);
      assert.ok(existsSync(join(realDir, `${slug}.json`)));
      assert.ok(existsSync(join(realDir, `${slug}.md`)));
      const obj = JSON.parse(readFileSync(join(realDir, `${slug}.json`), "utf8"));
      assert.strictEqual(obj.name, slug);
      assert.ok(Array.isArray(obj.ansi) && obj.ansi.length === 16);
    } finally {
      rmSync(realDir, { recursive: true, force: true });
    }
  });

  it("stdout includes 'Created:' summary", async () => {
    const slug = "test-cli-created-tmp";
    const { stdout, realDir } = await runCli(slug, ANSWERS);
    try {
      assert.match(stdout, /Created:/);
    } finally {
      rmSync(realDir, { recursive: true, force: true });
    }
  });

  it("stdout includes WCAG AA check output", async () => {
    const slug = "test-cli-wcag-pass-tmp";
    const { stdout, realDir } = await runCli(slug, ANSWERS);
    try {
      assert.match(stdout, /WCAG AA pre-check/);
    } finally {
      rmSync(realDir, { recursive: true, force: true });
    }
  });
});
