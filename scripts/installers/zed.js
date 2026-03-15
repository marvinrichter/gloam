import { join } from "node:path";
import { copy, readJson, writeJson, capitalize } from "./_helpers.js";

export function create({ src, home }) {
  return function installZed(name) {
    const destTheme = join(home, ".config", "zed", "themes", `${name}.json`);
    const settingsPath = join(home, ".config", "zed", "settings.json");

    copy(join(src(name), "zed.json"), destTheme);

    let settings = {};
    try {
      settings = readJson(settingsPath) ?? {};
    } catch {
      return `copied → ${destTheme}\n  ! skipped updating ${settingsPath} — it may contain JSONC comments which are not supported. Set "theme": "${capitalize(name)}" manually.`;
    }
    settings.theme = capitalize(name);
    writeJson(settingsPath, settings);

    return `copied → ${destTheme}\n  ~ set theme in ${settingsPath}`;
  };
}
