import { join } from "node:path";
import { upsertLine } from "./_helpers.js";

export function create({ src, home }) {
  return function installTmux(name) {
    const snippet = join(src(name), "tmux.conf");
    const tmuxConf = join(home, ".tmux.conf");
    const result = upsertLine(
      tmuxConf,
      new RegExp(`source-file.*${name}\\.conf`),
      `source-file "${snippet}"`,
    );
    return `${result} source-file line in ${tmuxConf}
  reload with:  tmux source-file ~/.tmux.conf`;
  };
}
