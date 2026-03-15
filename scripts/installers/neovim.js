import { join } from "node:path";
import { copy } from "./_helpers.js";

export function create({ src, home }) {
  return function installNeovim(name) {
    const dest = join(home, ".config", "nvim", "colors", `${name}.lua`);
    copy(join(src(name), "neovim.lua"), dest);
    return `copied → ${dest}\n  ! add vim.cmd("colorscheme ${name}") to your init.lua`;
  };
}
