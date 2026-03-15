import { join } from "node:path";
import { copy, upsertLine } from "./_helpers.js";

export function create({ src, home }) {
  return function installKitty(name) {
    const destTheme = join(home, ".config", "kitty", `${name}.conf`);
    const configPath = join(home, ".config", "kitty", "kitty.conf");
    // Write a "# gloam" marker on the include line so future re-installs can
    // identify it. Also match lines without the marker to handle upgrades from
    // older gloam versions or manual installs of the same theme file.
    const includeLine = `include ${name}.conf  # gloam`;
    const pattern = new RegExp(`^include\\s+${name}\\.conf(?:\\s.*)?$`, "m");

    copy(join(src(name), "kitty.conf"), destTheme);
    const result = upsertLine(configPath, pattern, includeLine);

    return result === "updated"
      ? `copied → ${destTheme}\n  ~ updated include in ${configPath}`
      : `copied → ${destTheme}\n  + added include to ${configPath}`;
  };
}
