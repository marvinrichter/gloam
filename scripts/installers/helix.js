import { join } from "node:path";
import { copy } from "./_helpers.js";

export function create({ src, home }) {
  return function installHelix(name) {
    const dest = join(home, ".config", "helix", "themes", `${name}.toml`);
    copy(join(src(name), "helix.toml"), dest);
    return `copied → ${dest}
  then set  theme = "${name}"  in ~/.config/helix/config.toml`;
  };
}
