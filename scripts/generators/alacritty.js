import { hex } from "./utils.js";

export function generateAlacritty(theme) {
  const { name, background, foreground, ansi, ui } = theme;

  const lines = [
    `# ${name} — Alacritty color theme`,
    `# Generated from ${name}.json — do not edit by hand`,
    `#`,
    `# Install: copy this file to ~/.config/alacritty/themes/${name}.toml`,
    `# then add \`import = ["~/.config/alacritty/themes/${name}.toml"]\` to alacritty.toml`,
    ``,
    `[colors.primary]`,
    `background = "#${hex(background)}"`,
    `foreground = "#${hex(foreground)}"`,
    ``,
    `[colors.cursor]`,
    `cursor = "#${hex(ui.cursor)}"`,
    `text   = "#${hex(ui.cursorText)}"`,
    ``,
    `[colors.selection]`,
    `background = "#${hex(ui.selection)}"`,
    `text       = "#${hex(ui.selectionText)}"`,
    ``,
    `[colors.normal]`,
    `black   = "#${hex(ansi[0])}"`,
    `red     = "#${hex(ansi[1])}"`,
    `green   = "#${hex(ansi[2])}"`,
    `yellow  = "#${hex(ansi[3])}"`,
    `blue    = "#${hex(ansi[4])}"`,
    `magenta = "#${hex(ansi[5])}"`,
    `cyan    = "#${hex(ansi[6])}"`,
    `white   = "#${hex(ansi[7])}"`,
    ``,
    `[colors.bright]`,
    `black   = "#${hex(ansi[8])}"`,
    `red     = "#${hex(ansi[9])}"`,
    `green   = "#${hex(ansi[10])}"`,
    `yellow  = "#${hex(ansi[11])}"`,
    `blue    = "#${hex(ansi[12])}"`,
    `magenta = "#${hex(ansi[13])}"`,
    `cyan    = "#${hex(ansi[14])}"`,
    `white   = "#${hex(ansi[15])}"`,
  ];

  return lines.join("\n") + "\n";
}
