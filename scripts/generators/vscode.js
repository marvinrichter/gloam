import { hex } from "./utils.js";
import { syntaxColors } from "./syntax-map.js";

const h = (c) => `#${hex(c).toUpperCase()}`;

export function generateVscode(theme) {
  const { name, displayName, type, background, foreground, ansi, ui, tokens } = theme;
  const syn = syntaxColors(theme);

  const obj = {
    name: displayName || name,
    type,
    colors: {
      // Editor chrome
      "editor.background":                    h(background),
      "editor.foreground":                    h(foreground),
      "editor.lineHighlightBackground":       h(ansi[8]),
      "editor.selectionBackground":           h(ui.selection),
      "editor.selectionForeground":           h(ui.selectionText),
      "editorCursor.foreground":              h(ui.cursor),
      "editorCursor.background":              h(ui.cursorText),
      "editorLineNumber.foreground":          h(tokens.muted),
      "editorLineNumber.activeForeground":    h(foreground),

      // Sidebar / activity bar
      "sideBar.background":                   h(ansi[8]),
      "sideBar.foreground":                   h(foreground),
      "activityBar.background":               h(background),
      "activityBar.foreground":               h(foreground),

      // Status bar
      "statusBar.background":                 h(background),
      "statusBar.foreground":                 h(tokens.muted),
      "statusBar.noFolderBackground":         h(background),

      // Title bar
      "titleBar.activeBackground":            h(background),
      "titleBar.activeForeground":            h(foreground),

      // Input / dropdowns
      "input.background":                     h(ansi[8]),
      "input.foreground":                     h(foreground),
      "input.border":                         h(tokens.muted),
      "focusBorder":                          h(tokens.primary),

      // Tabs
      "tab.activeBackground":                 h(background),
      "tab.activeForeground":                 h(foreground),
      "tab.inactiveBackground":               h(ansi[8]),
      "tab.inactiveForeground":               h(tokens.muted),

      // Scrollbar / minimap
      "scrollbarSlider.background":           h(tokens.muted) + "40",
      "scrollbarSlider.hoverBackground":      h(tokens.muted) + "80",
      "minimap.background":                   h(background),

      // Diff
      "diffEditor.insertedTextBackground":    h(ansi[2]) + "30",
      "diffEditor.removedTextBackground":     h(ansi[1]) + "30",

      // Error / warning squiggles
      "editorError.foreground":               h(tokens.error),
      "editorWarning.foreground":             h(ansi[3]),

      // Terminal colors (16 ANSI)
      "terminal.background":                  h(background),
      "terminal.foreground":                  h(foreground),
      "terminalCursor.foreground":            h(ui.cursor),
      "terminal.ansiBlack":                   h(ansi[0]),
      "terminal.ansiRed":                     h(ansi[1]),
      "terminal.ansiGreen":                   h(ansi[2]),
      "terminal.ansiYellow":                  h(ansi[3]),
      "terminal.ansiBlue":                    h(ansi[4]),
      "terminal.ansiMagenta":                 h(ansi[5]),
      "terminal.ansiCyan":                    h(ansi[6]),
      "terminal.ansiWhite":                   h(ansi[7]),
      "terminal.ansiBrightBlack":             h(ansi[8]),
      "terminal.ansiBrightRed":               h(ansi[9]),
      "terminal.ansiBrightGreen":             h(ansi[10]),
      "terminal.ansiBrightYellow":            h(ansi[11]),
      "terminal.ansiBrightBlue":              h(ansi[12]),
      "terminal.ansiBrightMagenta":           h(ansi[13]),
      "terminal.ansiBrightCyan":              h(ansi[14]),
      "terminal.ansiBrightWhite":             h(ansi[15]),
    },
    tokenColors: [
      {
        name: "Comment",
        scope: ["comment", "punctuation.definition.comment"],
        settings: { foreground: h(syn.comment), fontStyle: "italic" },
      },
      {
        name: "Keyword",
        scope: [
          "keyword",
          "keyword.control",
          "keyword.operator.new",
          "storage.type",
          "storage.modifier",
        ],
        settings: { foreground: h(syn.keyword) },
      },
      {
        name: "Type / Class",
        scope: [
          "entity.name.type",
          "entity.name.class",
          "support.type",
          "support.class",
        ],
        settings: { foreground: h(syn.type) },
      },
      {
        name: "Function",
        scope: ["entity.name.function", "support.function", "meta.function-call"],
        settings: { foreground: h(syn.function) },
      },
      {
        name: "String",
        scope: ["string", "string.quoted", "string.template"],
        settings: { foreground: h(syn.string) },
      },
      {
        name: "Number / Boolean",
        scope: ["constant.numeric", "constant.language.boolean"],
        settings: { foreground: h(syn.number) },
      },
      {
        name: "Constant",
        scope: ["constant.language", "variable.other.constant", "support.constant"],
        settings: { foreground: h(syn.constant) },
      },
      {
        name: "Variable",
        scope: ["variable", "variable.other"],
        settings: { foreground: h(syn.variable) },
      },
      {
        name: "Operator / Punctuation",
        scope: ["keyword.operator", "punctuation"],
        settings: { foreground: h(syn.operator) },
      },
      {
        name: "Tag",
        scope: ["entity.name.tag", "meta.tag"],
        settings: { foreground: h(syn.tag) },
      },
      {
        name: "Attribute",
        scope: ["entity.other.attribute-name"],
        settings: { foreground: h(syn.attribute) },
      },
      {
        name: "Error",
        scope: ["invalid", "invalid.illegal"],
        settings: { foreground: h(syn.error) },
      },
    ],
  };

  return JSON.stringify(obj, null, 2) + "\n";
}
