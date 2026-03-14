import { hex } from "./utils.js";

export function generateKitty(theme) {
  const { name, background, foreground, ansi, ui } = theme;

  const ansiLines = ansi
    .map((c, i) => `${"color" + i}`.padEnd(7) + `  #${hex(c)}`)
    .join("\n");

  return [
    `# ${name} — Kitty color theme`,
    `# Generated from ${name}.json — do not edit by hand`,
    `#`,
    `# Install: copy to ~/.config/kitty/${name}.conf`,
    `# then add \`include ${name}.conf\` to kitty.conf`,
    ``,
    `background            #${hex(background)}`,
    `foreground            #${hex(foreground)}`,
    ``,
    `cursor                #${hex(ui.cursor)}`,
    `cursor_text_color     #${hex(ui.cursorText)}`,
    ``,
    `selection_background  #${hex(ui.selection)}`,
    `selection_foreground  #${hex(ui.selectionText)}`,
    ``,
    `url_color             #${hex(ui.link)}`,
    ``,
    `# ANSI colors 0–15`,
    ansiLines,
    ``,
  ].join("\n");
}
