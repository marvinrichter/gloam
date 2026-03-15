import { syntaxColors } from "./syntax-map.js";

/**
 * Sublime Text color scheme generator.
 * Produces a .sublime-color-scheme JSON file.
 *
 * Install:
 *   Copy to ~/Library/Application Support/Sublime Text/Packages/User/<name>.sublime-color-scheme
 *   then Preferences › Color Scheme… › select "<name>"
 *
 * Sublime Text color scheme format:
 *   https://www.sublimetext.com/docs/color_schemes.html
 */
export function generateSublimeText(theme) {
  const { name, displayName, background: bg, foreground: fg, ansi, ui, tokens } = theme;
  const title = displayName || name;
  const syn = syntaxColors(theme);

  const scheme = {
    name: title,
    author: `gloam (generated from ${name}.json)`,
    variables: {
      background: bg,
      foreground: fg,
      primary: tokens.primary,
      accent: tokens.accent,
      muted: tokens.muted,
      error: tokens.error,
      string_col: syn.string,
      number_col: syn.number,
      constant_col: syn.constant,
      warning_col: syn.warning,
      dim_bg: ansi[8],
    },
    globals: {
      background: "var(background)",
      foreground: "var(foreground)",
      caret: ui.cursor,
      invisibles: `${tokens.muted}60`,
      line_highlight: `${ansi[8]}80`,
      selection: ui.selection,
      selection_foreground: ui.selectionText,
      selection_border: `${tokens.primary}40`,
      inactive_selection: `${ui.selection}80`,
      inactive_selection_foreground: `${fg}80`,
      find_highlight: `${tokens.primary}40`,
      find_highlight_foreground: fg,
      brackets_foreground: tokens.muted,
      brackets_options: "underline",
      bracket_contents_foreground: tokens.muted,
      bracket_contents_options: "stippled_underline",
      tags_foreground: tokens.accent,
      tags_options: "stippled_underline",
      highlight: `${tokens.primary}30`,
      active_guide: `${tokens.muted}80`,
      stack_guide: `${tokens.muted}50`,
      guide: `${tokens.muted}30`,
      gutter: bg,
      gutter_foreground: tokens.muted,
      gutter_foreground_highlight: fg,
      line_diff_added: syn.string,
      line_diff_modified: tokens.primary,
      line_diff_deleted: tokens.error,
    },
    rules: [
      // ── Comments ──────────────────────────────────────────────────────
      {
        name: "Comment",
        scope: "comment, punctuation.definition.comment",
        foreground: syn.comment,
        font_style: "italic",
      },
      // ── Keywords ──────────────────────────────────────────────────────
      {
        name: "Keyword",
        scope: ["keyword", "storage.type", "storage.modifier", "keyword.control"].join(", "),
        foreground: syn.keyword,
      },
      // ── Types & Classes ───────────────────────────────────────────────
      {
        name: "Type / Class",
        scope: [
          "entity.name.type",
          "entity.name.class",
          "entity.other.inherited-class",
          "support.type",
          "support.class",
        ].join(", "),
        foreground: syn.type,
      },
      // ── Functions ─────────────────────────────────────────────────────
      {
        name: "Function",
        scope: [
          "entity.name.function",
          "meta.function-call",
          "support.function",
          "variable.function",
        ].join(", "),
        foreground: syn.function,
      },
      // ── Strings ───────────────────────────────────────────────────────
      {
        name: "String",
        scope: ["string", "string.quoted", "string.template"].join(", "),
        foreground: syn.string,
      },
      {
        name: "String escape",
        scope: "constant.character.escape",
        foreground: tokens.accent,
      },
      // ── Numbers ───────────────────────────────────────────────────────
      {
        name: "Number",
        scope: "constant.numeric",
        foreground: syn.number,
      },
      // ── Constants ─────────────────────────────────────────────────────
      {
        name: "Built-in constant",
        scope: ["constant.language", "constant.character", "variable.language"].join(", "),
        foreground: syn.constant,
      },
      {
        name: "User-defined constant",
        scope: "constant.other, variable.other.constant",
        foreground: syn.constant,
      },
      // ── Variables ─────────────────────────────────────────────────────
      {
        name: "Variable",
        scope: "variable, variable.other.readwrite",
        foreground: fg,
      },
      {
        name: "Parameter",
        scope: "variable.parameter",
        foreground: fg,
        font_style: "italic",
      },
      // ── Operators & Punctuation ───────────────────────────────────────
      {
        name: "Operator",
        scope: "keyword.operator",
        foreground: syn.operator,
      },
      {
        name: "Punctuation",
        scope: [
          "punctuation",
          "punctuation.separator",
          "punctuation.terminator",
          "punctuation.accessor",
        ].join(", "),
        foreground: syn.punctuation,
      },
      // ── Attributes ────────────────────────────────────────────────────
      {
        name: "Attribute / Decorator",
        scope: ["entity.other.attribute-name", "meta.annotation", "variable.annotation"].join(", "),
        foreground: syn.attribute,
      },
      // ── Markup / HTML ─────────────────────────────────────────────────
      {
        name: "Tag name",
        scope: "entity.name.tag",
        foreground: syn.tag,
      },
      {
        name: "Tag attribute",
        scope: "entity.other.attribute-name.html, entity.other.attribute-name.xml",
        foreground: tokens.primary,
      },
      // ── Markdown ──────────────────────────────────────────────────────
      {
        name: "Markdown heading",
        scope: "markup.heading, entity.name.section",
        foreground: tokens.primary,
        font_style: "bold",
      },
      {
        name: "Markdown bold",
        scope: "markup.bold",
        font_style: "bold",
      },
      {
        name: "Markdown italic",
        scope: "markup.italic",
        font_style: "italic",
      },
      {
        name: "Markdown link",
        scope: "markup.underline.link",
        foreground: ui.link,
        font_style: "underline",
      },
      {
        name: "Markdown inline code",
        scope: "markup.raw.inline",
        foreground: syn.string,
      },
      {
        name: "Markdown fenced code",
        scope: "markup.raw.block, markup.fenced_code",
        foreground: syn.string,
      },
      {
        name: "Markdown list bullet",
        scope: "punctuation.definition.list_item",
        foreground: tokens.accent,
      },
      // ── Diff ──────────────────────────────────────────────────────────
      {
        name: "Diff — added",
        scope: "markup.inserted",
        foreground: syn.string,
      },
      {
        name: "Diff — removed",
        scope: "markup.deleted",
        foreground: tokens.error,
      },
      {
        name: "Diff — changed",
        scope: "markup.changed",
        foreground: tokens.primary,
      },
      // ── Errors & warnings ─────────────────────────────────────────────
      {
        name: "Error",
        scope: "invalid, invalid.illegal",
        foreground: tokens.error,
        font_style: "underline",
      },
      {
        name: "Deprecated",
        scope: "invalid.deprecated",
        foreground: syn.warning,
        font_style: "underline",
      },
    ],
  };

  return JSON.stringify(scheme, null, 2) + "\n";
}
