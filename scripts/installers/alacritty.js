import { join } from "node:path";
import { copy, upsertLine } from "./_helpers.js";

export function create({ src, home }) {
  return function installAlacritty(name) {
    const destTheme  = join(home, ".config", "alacritty", "themes", `${name}.toml`);
    const configPath = join(home, ".config", "alacritty", "alacritty.toml");
    const importLine = `import = ["~/.config/alacritty/themes/${name}.toml"]`;

    copy(join(src(name), "alacritty.toml"), destTheme);
    const result = upsertLine(configPath, /^import\s*=\s*\["~\/\.config\/alacritty\/themes\/[^"]+"\]/m, importLine);

    return result === "updated"
      ? `copied → ${destTheme}\n  ~ updated import in ${configPath}`
      : `copied → ${destTheme}\n  + added import to ${configPath}`;
  };
}
