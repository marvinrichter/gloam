import { hex } from "./utils.js";

const h = (c) => `#${hex(c).toUpperCase()}`;

export function generateWindowsTerminal(theme) {
  const { name, displayName, background, foreground, ansi, ui } = theme;

  const obj = {
    name: displayName || name,
    background:          h(background),
    foreground:          h(foreground),
    cursorColor:         h(ui.cursor),
    selectionBackground: h(ui.selection),
    // ANSI normal 0–7
    black:   h(ansi[0]),
    red:     h(ansi[1]),
    green:   h(ansi[2]),
    yellow:  h(ansi[3]),
    blue:    h(ansi[4]),
    purple:  h(ansi[5]),
    cyan:    h(ansi[6]),
    white:   h(ansi[7]),
    // ANSI bright 8–15
    brightBlack:   h(ansi[8]),
    brightRed:     h(ansi[9]),
    brightGreen:   h(ansi[10]),
    brightYellow:  h(ansi[11]),
    brightBlue:    h(ansi[12]),
    brightPurple:  h(ansi[13]),
    brightCyan:    h(ansi[14]),
    brightWhite:   h(ansi[15]),
  };

  return JSON.stringify(obj, null, 2) + "\n";
}
