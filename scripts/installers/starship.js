import { join } from "node:path";
import { copy } from "./_helpers.js";

export function create({ src, home }) {
  return function installStarship(name) {
    const dest = join(home, ".config", "starship.toml");
    copy(join(src(name), "starship.toml"), dest);
    return `copied → ${dest}`;
  };
}
