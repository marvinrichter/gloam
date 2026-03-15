import { join } from "node:path";
import { copy, upsertLine } from "./_helpers.js";

export function create({ src, home }) {
  return function installGhostty(name) {
    const destTheme = join(home, ".config", "ghostty", "themes", name);
    const configPath = join(home, ".config", "ghostty", "config");
    const themeLine = `theme = ${name}`;

    copy(join(src(name), "ghostty"), destTheme);
    const result = upsertLine(configPath, /^theme\s*=\s*.*/m, themeLine);

    return result === "updated"
      ? `copied → ${destTheme}\n  ~ updated theme in ${configPath}`
      : `copied → ${destTheme}\n  + added theme to ${configPath}`;
  };
}
