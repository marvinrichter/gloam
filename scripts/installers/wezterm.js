import { join } from "node:path";
import { copy, upsertLine, capitalize } from "./_helpers.js";

export function create({ src, home }) {
  return function installWezterm(name) {
    const destTheme  = join(home, ".config", "wezterm", "colors", `${name}.lua`);
    const configPath = join(home, ".config", "wezterm", "wezterm.lua");
    const schemeLine = `config.color_scheme = "${capitalize(name)}"`;

    copy(join(src(name), "wezterm.lua"), destTheme);
    const result = upsertLine(configPath, /^config\.color_scheme\s*=\s*.*/m, schemeLine);

    return result === "updated"
      ? `copied → ${destTheme}\n  ~ updated color_scheme in ${configPath}`
      : `copied → ${destTheme}\n  + added color_scheme to ${configPath}`;
  };
}
