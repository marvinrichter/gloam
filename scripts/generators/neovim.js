import { hex } from "./utils.js";
import { syntaxColors } from "./syntax-map.js";

const h = (c) => `#${hex(c).toUpperCase()}`;

export function generateNeovim(theme) {
  const { name, background: bg, foreground: fg, ansi, ui, tokens } = theme;
  const syn = syntaxColors(theme);
  const vimBg = theme.type === "light" ? "light" : "dark";

  // Helper to build nvim_set_hl call
  const hl = (group, attrs) => {
    const parts = Object.entries(attrs)
      .map(([k, v]) => typeof v === "string" ? `${k} = "${v}"` : `${k} = ${v}`)
      .join(", ");
    return `  vim.api.nvim_set_hl(0, "${group}", { ${parts} })`;
  };

  const lines = [
    `-- ${name} — Neovim colorscheme`,
    `-- Generated from ${name}.json — do not edit by hand`,
    `--`,
    `-- Install: copy to ~/.config/nvim/colors/${name}.lua`,
    `-- then :colorscheme ${name}`,
    ``,
    `vim.cmd("highlight clear")`,
    `if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end`,
    ``,
    `vim.opt.background = "${vimBg}"`,
    `vim.g.colors_name = "${name}"`,
    ``,
    `-- ── Base groups ──────────────────────────────────────────────────────────────`,
    hl("Normal",       { bg: h(bg), fg: h(fg) }),
    hl("NormalFloat",  { bg: h(ansi[8]), fg: h(fg) }),
    hl("NormalNC",     { bg: h(bg), fg: h(tokens.muted) }),
    hl("Visual",       { bg: h(ui.selection), fg: h(ui.selectionText) }),
    hl("Cursor",       { bg: h(ui.cursor), fg: h(ui.cursorText) }),
    hl("CursorLine",   { bg: h(ansi[8]) }),
    hl("CursorColumn", { bg: h(ansi[8]) }),
    hl("LineNr",       { fg: h(tokens.muted) }),
    hl("CursorLineNr", { fg: h(fg), bold: true }),
    hl("SignColumn",   { bg: h(bg) }),
    hl("ColorColumn",  { bg: h(ansi[8]) }),
    hl("StatusLine",   { bg: h(ansi[8]), fg: h(fg) }),
    hl("StatusLineNC", { bg: h(bg), fg: h(tokens.muted) }),
    hl("VertSplit",    { fg: h(tokens.muted) }),
    hl("Pmenu",        { bg: h(ansi[8]), fg: h(fg) }),
    hl("PmenuSel",     { bg: h(ui.selection), fg: h(ui.selectionText) }),
    hl("PmenuSbar",    { bg: h(ansi[8]) }),
    hl("PmenuThumb",   { bg: h(tokens.muted) }),
    hl("Search",       { bg: h(tokens.accent), fg: h(bg) }),
    hl("IncSearch",    { bg: h(tokens.primary), fg: h(bg) }),
    hl("MatchParen",   { bg: h(tokens.accent), fg: h(bg), bold: true }),
    hl("NonText",      { fg: h(tokens.muted) }),
    hl("SpecialKey",   { fg: h(tokens.muted) }),
    hl("Folded",       { bg: h(ansi[8]), fg: h(tokens.muted), italic: true }),
    hl("FoldColumn",   { bg: h(bg), fg: h(tokens.muted) }),
    hl("WildMenu",     { bg: h(tokens.accent), fg: h(bg) }),
    ``,
    `-- ── Syntax groups ───────────────────────────────────────────────────────────`,
    hl("Comment",    { fg: h(syn.comment), italic: true }),
    hl("Keyword",    { fg: h(syn.keyword) }),
    hl("Statement",  { fg: h(syn.keyword) }),
    hl("Conditional",{ fg: h(syn.keyword) }),
    hl("Repeat",     { fg: h(syn.keyword) }),
    hl("Label",      { fg: h(syn.keyword) }),
    hl("Operator",   { fg: h(syn.operator) }),
    hl("Exception",  { fg: h(syn.error) }),
    hl("Identifier", { fg: h(syn.variable) }),
    hl("Function",   { fg: h(syn.function) }),
    hl("Type",       { fg: h(syn.type) }),
    hl("StorageClass",{ fg: h(syn.type) }),
    hl("Structure",  { fg: h(syn.type) }),
    hl("Typedef",    { fg: h(syn.type) }),
    hl("String",     { fg: h(syn.string) }),
    hl("Character",  { fg: h(syn.string) }),
    hl("Number",     { fg: h(syn.number) }),
    hl("Float",      { fg: h(syn.number) }),
    hl("Boolean",    { fg: h(syn.number) }),
    hl("Constant",   { fg: h(syn.constant) }),
    hl("Special",    { fg: h(tokens.accent) }),
    hl("PreProc",    { fg: h(tokens.primary) }),
    hl("Include",    { fg: h(syn.keyword) }),
    hl("Define",     { fg: h(syn.keyword) }),
    hl("Macro",      { fg: h(syn.keyword) }),
    hl("Error",      { fg: h(syn.error) }),
    hl("Todo",       { bg: h(tokens.accent), fg: h(bg), bold: true }),
    hl("Underlined", { fg: h(ui.link), underline: true }),
    ``,
    `-- ── Diagnostic ──────────────────────────────────────────────────────────────`,
    hl("DiagnosticError",   { fg: h(tokens.error) }),
    hl("DiagnosticWarn",    { fg: h(ansi[3]) }),
    hl("DiagnosticInfo",    { fg: h(tokens.primary) }),
    hl("DiagnosticHint",    { fg: h(tokens.muted) }),
    ``,
    `-- ── Terminal colors ─────────────────────────────────────────────────────────`,
    ...ansi.map((c, i) => `vim.g.terminal_color_${i} = "${h(c)}"`),
    ``,
  ];

  return lines.join("\n");
}
