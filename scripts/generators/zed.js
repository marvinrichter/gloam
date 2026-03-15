import { hex } from "./utils.js";
import { syntaxColors } from "./syntax-map.js";

const h = (c) => `#${hex(c).toUpperCase()}`;

const ANSI_KEYS = [
  "black",
  "red",
  "green",
  "yellow",
  "blue",
  "magenta",
  "cyan",
  "white",
  "bright_black",
  "bright_red",
  "bright_green",
  "bright_yellow",
  "bright_blue",
  "bright_magenta",
  "bright_cyan",
  "bright_white",
];

export function generateZed(theme) {
  const { name, displayName, type, background: bg, foreground: fg, ansi, ui, tokens } = theme;
  const syn = syntaxColors(theme);

  const terminalAnsi = {};
  ANSI_KEYS.forEach((key, i) => {
    terminalAnsi[`terminal.ansi.${key}`] = h(ansi[i]);
  });

  const obj = {
    $schema: "https://zed.dev/schema/themes/v0.1.0.json",
    name: displayName || name,
    author: "gloam",
    themes: [
      {
        name: displayName || name,
        appearance: type,
        style: {
          // Editor
          background: h(bg),
          foreground: h(fg),
          "editor.background": h(bg),
          "editor.foreground": h(fg),
          "editor.line_number": h(tokens.muted),
          "editor.active_line_number": h(fg),
          "editor.selection.background": h(ui.selection),

          // Terminal
          "terminal.background": h(bg),
          "terminal.foreground": h(fg),
          "terminal.cursor": h(ui.cursor),
          "terminal.cursor_text": h(ui.cursorText),
          ...terminalAnsi,

          // UI elements
          border: h(tokens.muted),
          "border.focused": h(tokens.primary),
          "panel.background": h(ansi[8]),
          "element.hover": h(ui.selection),
          "ghost_element.hover": h(ui.selection),
          link_text_hover: h(ui.link),

          // Syntax
          syntax: {
            keyword: { color: h(syn.keyword) },
            type: { color: h(syn.type) },
            class: { color: h(syn.class) },
            function: { color: h(syn.function) },
            string: { color: h(syn.string) },
            number: { color: h(syn.number) },
            comment: { color: h(syn.comment), font_style: "italic" },
            variable: { color: h(syn.variable) },
            constant: { color: h(syn.constant) },
            operator: { color: h(syn.operator) },
            punctuation: { color: h(syn.punctuation) },
            tag: { color: h(syn.tag) },
            attribute: { color: h(syn.attribute) },
          },

          // Diagnostics
          "error.background": h(tokens.error),
          "warning.background": h(ansi[3]),
        },
      },
    ],
  };

  return JSON.stringify(obj, null, 2) + "\n";
}
