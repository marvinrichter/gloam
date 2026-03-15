import { hex } from "./utils.js";

export function generateWezterm(theme) {
  const { name, background, foreground, ansi, ui } = theme;

  const ansiNormal = ansi
    .slice(0, 8)
    .map((c) => `    "#${hex(c)}"`)
    .join(",\n");
  const ansiBrights = ansi
    .slice(8, 16)
    .map((c) => `    "#${hex(c)}"`)
    .join(",\n");

  return [
    `-- ${name} — WezTerm color scheme`,
    `-- Generated from ${name}.json — do not edit by hand`,
    `--`,
    `-- Install: place in ~/.config/wezterm/colors/${name}.lua`,
    `-- then set color_scheme = "${name}" in wezterm.lua`,
    ``,
    `return {`,
    `  foreground    = "#${hex(foreground)}",`,
    `  background    = "#${hex(background)}",`,
    ``,
    `  cursor_bg     = "#${hex(ui.cursor)}",`,
    `  cursor_fg     = "#${hex(ui.cursorText)}",`,
    `  cursor_border = "#${hex(ui.cursor)}",`,
    ``,
    `  selection_bg  = "#${hex(ui.selection)}",`,
    `  selection_fg  = "#${hex(ui.selectionText)}",`,
    ``,
    `  ansi = {`,
    ansiNormal,
    `  },`,
    ``,
    `  brights = {`,
    ansiBrights,
    `  },`,
    `}`,
    ``,
  ].join("\n");
}
