import { existsSync, readFileSync } from "node:fs";
import { join } from "node:path";
import { readJson, writeJson } from "./_helpers.js";

export function create({ src, home, IS_WIN }) {
  return function installWindowsTerminal(name) {
    if (!IS_WIN) return "skipped (Windows only)";

    const localAppData = process.env.LOCALAPPDATA ?? join(home, "AppData", "Local");
    const candidates = [
      join(
        localAppData,
        "Packages",
        "Microsoft.WindowsTerminal_8wekyb3d8bbwe",
        "LocalState",
        "settings.json",
      ),
      join(
        localAppData,
        "Packages",
        "Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe",
        "LocalState",
        "settings.json",
      ),
    ];
    const settingsPath = candidates.find(existsSync);

    if (!settingsPath) return "skipped — could not find Windows Terminal settings.json";

    const scheme = JSON.parse(readFileSync(join(src(name), "windows-terminal.json"), "utf8"));
    const settings = readJson(settingsPath) ?? {};

    settings.schemes ??= [];
    const idx = settings.schemes.findIndex((s) => s.name === scheme.name);
    if (idx >= 0) {
      settings.schemes[idx] = scheme;
    } else {
      settings.schemes.push(scheme);
    }

    writeJson(settingsPath, settings);
    return `updated schemes in ${settingsPath}\n  Set "colorScheme": "${scheme.name}" on your profile to activate`;
  };
}
