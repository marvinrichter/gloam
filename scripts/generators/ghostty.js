import { hex } from "./utils.js";

export function generateGhostty(theme) {
  const { name, background, foreground, ansi, ui } = theme;

  const paletteLines = ansi.map((c, i) => `palette = ${i}=${hex(c)}`).join("\n");

  return [
    `# ${name} — Ghostty color theme`,
    `# Generated from ${name}.json — do not edit by hand`,
    `#`,
    `# Install: copy to ~/.config/ghostty/themes/${name}`,
    `# then set theme = ${name} in ~/.config/ghostty/config`,
    ``,
    `background         = ${hex(background)}`,
    `foreground         = ${hex(foreground)}`,
    ``,
    `cursor-color       = ${hex(ui.cursor)}`,
    `cursor-text        = ${hex(ui.cursorText)}`,
    ``,
    `selection-background = ${hex(ui.selection)}`,
    `selection-foreground = ${hex(ui.selectionText)}`,
    ``,
    `# ANSI palette (0–15)`,
    paletteLines,
    ``,
  ].join("\n");
}
