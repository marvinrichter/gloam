import { hex } from "./utils.js";
import { syntaxColors } from "./syntax-map.js";

/**
 * Helix editor theme generator.
 * Produces a .toml file for ~/.config/helix/themes/<name>.toml
 *
 * Helix theme format:
 *   [palette]   — named colors referenced by style rules
 *   "ui.*"      — editor chrome, cursor, statusbar, menus
 *   keyword/type/string/… — syntax highlighting scopes
 */
export function generateHelix(theme) {
  const { name, displayName, background: bg, foreground: fg, ansi, ui, tokens } = theme;
  const title = displayName || name;
  const syn = syntaxColors(theme);
  const h = (c) => c; // colors are already #RRGGBB strings

  // Helix inline style helper
  const style = (attrs) => {
    const parts = [];
    if (attrs.fg) parts.push(`fg = "${attrs.fg}"`);
    if (attrs.bg) parts.push(`bg = "${attrs.bg}"`);
    if (attrs.modifiers?.length) {
      parts.push(`modifiers = [${attrs.modifiers.map((m) => `"${m}"`).join(", ")}]`);
    }
    return `{ ${parts.join(", ")} }`;
  };

  return `# ${title} — Helix colorscheme
# Generated from ${name}.json — do not edit by hand
#
# Install: copy to ~/.config/helix/themes/${name}.toml
#          then set theme = "${name}" in ~/.config/helix/config.toml

# ── Palette ───────────────────────────────────────────────────────────────────

[palette]
bg        = "${h(bg)}"
fg        = "${h(fg)}"
primary   = "${h(tokens.primary)}"
accent    = "${h(tokens.accent)}"
muted     = "${h(tokens.muted)}"
error     = "${h(tokens.error)}"
dim_bg    = "${h(ansi[8])}"
string    = "${h(syn.string)}"
number    = "${h(syn.number)}"
constant  = "${h(syn.constant)}"
warning   = "${h(syn.warning)}"
cursor    = "${h(ui.cursor)}"
selection = "${h(ui.selection)}"

# ── UI ────────────────────────────────────────────────────────────────────────

"ui.background"         = ${style({ bg: "bg" })}
"ui.text"               = ${style({ fg: "fg" })}
"ui.text.focus"         = ${style({ fg: "fg", modifiers: ["bold"] })}

"ui.cursor"             = ${style({ bg: "cursor", fg: "bg" })}
"ui.cursor.primary"     = ${style({ bg: "cursor", fg: "bg" })}
"ui.cursor.insert"      = ${style({ bg: "fg", fg: "bg" })}
"ui.cursor.select"      = ${style({ bg: "accent", fg: "bg" })}
"ui.cursor.match"       = ${style({ bg: "dim_bg", modifiers: ["bold"] })}

"ui.selection"          = ${style({ bg: "selection" })}
"ui.selection.primary"  = ${style({ bg: "selection" })}

"ui.linenr"             = ${style({ fg: "muted" })}
"ui.linenr.selected"    = ${style({ fg: "fg", modifiers: ["bold"] })}

"ui.statusbar"          = ${style({ bg: "dim_bg", fg: "fg" })}
"ui.statusbar.normal"   = ${style({ bg: "dim_bg", fg: "fg" })}
"ui.statusbar.insert"   = ${style({ bg: "accent", fg: "bg" })}
"ui.statusbar.select"   = ${style({ bg: "primary", fg: "bg" })}
"ui.statusbar.separator" = ${style({ fg: "muted" })}

"ui.popup"              = ${style({ bg: "dim_bg", fg: "fg" })}
"ui.window"             = ${style({ fg: "muted" })}
"ui.help"               = ${style({ bg: "dim_bg", fg: "fg" })}

"ui.menu"               = ${style({ bg: "dim_bg", fg: "fg" })}
"ui.menu.selected"      = ${style({ bg: "selection", fg: "fg" })}
"ui.menu.scroll"        = ${style({ fg: "muted" })}

"ui.gutter"             = ${style({ bg: "bg" })}
"ui.gutter.selected"    = ${style({ bg: "dim_bg" })}
"ui.highlight"          = ${style({ bg: "selection" })}

"ui.virtual.whitespace"  = ${style({ fg: "muted", modifiers: ["dim"] })}
"ui.virtual.ruler"       = ${style({ bg: "dim_bg" })}
"ui.virtual.inlay-hint"  = ${style({ fg: "muted", modifiers: ["italic"] })}
"ui.virtual.jump-label"  = ${style({ fg: "accent", modifiers: ["bold"] })}

# ── Syntax ────────────────────────────────────────────────────────────────────

"attribute"             = ${style({ fg: "primary" })}
"comment"               = ${style({ fg: "muted", modifiers: ["italic"] })}
"comment.line"          = ${style({ fg: "muted", modifiers: ["italic"] })}
"comment.block"         = ${style({ fg: "muted", modifiers: ["italic"] })}

"constant"              = ${style({ fg: "constant" })}
"constant.numeric"      = ${style({ fg: "number" })}
"constant.builtin"      = ${style({ fg: "accent" })}
"constant.character.escape" = ${style({ fg: "accent" })}

"string"                = ${style({ fg: "string" })}
"string.special"        = ${style({ fg: "accent" })}
"string.regexp"         = ${style({ fg: "accent" })}

"keyword"               = ${style({ fg: "accent" })}
"keyword.control"       = ${style({ fg: "accent" })}
"keyword.control.return"= ${style({ fg: "accent" })}
"keyword.function"      = ${style({ fg: "accent" })}
"keyword.operator"      = ${style({ fg: "muted" })}
"keyword.storage"       = ${style({ fg: "accent" })}
"keyword.directive"     = ${style({ fg: "primary" })}

"type"                  = ${style({ fg: "primary" })}
"type.builtin"          = ${style({ fg: "primary" })}
"type.enum.variant"     = ${style({ fg: "constant" })}

"constructor"           = ${style({ fg: "primary" })}

"function"              = ${style({ fg: "primary" })}
"function.builtin"      = ${style({ fg: "primary" })}
"function.method"       = ${style({ fg: "primary" })}
"function.macro"        = ${style({ fg: "accent" })}
"function.special"      = ${style({ fg: "accent" })}

"namespace"             = ${style({ fg: "fg" })}
"module"                = ${style({ fg: "primary" })}

"variable"              = ${style({ fg: "fg" })}
"variable.builtin"      = ${style({ fg: "accent" })}
"variable.parameter"    = ${style({ fg: "fg" })}
"variable.other.member" = ${style({ fg: "fg" })}

"label"                 = ${style({ fg: "accent" })}
"operator"              = ${style({ fg: "muted" })}
"punctuation"           = ${style({ fg: "muted" })}
"punctuation.delimiter" = ${style({ fg: "muted" })}
"punctuation.bracket"   = ${style({ fg: "muted" })}
"punctuation.special"   = ${style({ fg: "accent" })}

"tag"                   = ${style({ fg: "accent" })}
"tag.attribute"         = ${style({ fg: "primary" })}
"tag.error"             = ${style({ fg: "error" })}

# ── Markup (Markdown, etc.) ───────────────────────────────────────────────────

"markup.heading"        = ${style({ fg: "primary", modifiers: ["bold"] })}
"markup.heading.marker" = ${style({ fg: "muted" })}
"markup.bold"           = ${style({ fg: "fg", modifiers: ["bold"] })}
"markup.italic"         = ${style({ fg: "fg", modifiers: ["italic"] })}
"markup.strikethrough"  = ${style({ fg: "muted", modifiers: ["crossed_out"] })}
"markup.link.url"       = ${style({ fg: "accent", modifiers: ["underlined"] })}
"markup.link.label"     = ${style({ fg: "primary" })}
"markup.link.text"      = ${style({ fg: "fg" })}
"markup.quote"          = ${style({ fg: "muted", modifiers: ["italic"] })}
"markup.raw"            = ${style({ fg: "string" })}
"markup.raw.block"      = ${style({ fg: "string" })}
"markup.list"           = ${style({ fg: "accent" })}

# ── Diff ──────────────────────────────────────────────────────────────────────

"diff.plus"             = ${style({ fg: "string" })}
"diff.minus"            = ${style({ fg: "error" })}
"diff.delta"            = ${style({ fg: "warning" })}
"diff.plus.gutter"      = ${style({ fg: "string" })}
"diff.minus.gutter"     = ${style({ fg: "error" })}
"diff.delta.gutter"     = ${style({ fg: "warning" })}

# ── Diagnostic ────────────────────────────────────────────────────────────────

"diagnostic.error"      = ${style({ modifiers: ["underlined"] })}
"diagnostic.warning"    = ${style({ modifiers: ["underlined"] })}
"diagnostic.info"       = ${style({ modifiers: ["underlined"] })}
"diagnostic.hint"       = ${style({ modifiers: ["underlined"] })}
"error"                 = ${style({ fg: "error" })}
"warning"               = ${style({ fg: "warning" })}
"info"                  = ${style({ fg: "primary" })}
"hint"                  = ${style({ fg: "muted" })}
`;
}
