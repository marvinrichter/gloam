-- cobalt — Neovim colorscheme
-- Generated from cobalt.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/cobalt.lua
-- then :colorscheme cobalt

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "cobalt"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#080C18", fg = "#D8E0F0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#182038", fg = "#D8E0F0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#080C18", fg = "#7888B8" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#101828", fg = "#D8E0F0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#70D8F0", fg = "#080C18" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#182038" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#182038" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#7888B8" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D8E0F0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#080C18" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#182038" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#182038", fg = "#D8E0F0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#080C18", fg = "#7888B8" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7888B8" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#182038", fg = "#D8E0F0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#101828", fg = "#D8E0F0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#182038" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#7888B8" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#70D8F0", fg = "#080C18" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#6878F0", fg = "#080C18" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#70D8F0", fg = "#080C18", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#7888B8" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#7888B8" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#182038", fg = "#7888B8", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#080C18", fg = "#7888B8" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#70D8F0", fg = "#080C18" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#7888B8", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#70D8F0" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#70D8F0" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#70D8F0" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#70D8F0" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#70D8F0" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#7888B8" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D05860" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#D8E0F0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#6878F0" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#6878F0" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#6878F0" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#6878F0" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#6878F0" })
  vim.api.nvim_set_hl(0, "String", { fg = "#4898A8" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#4898A8" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#6878F0" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#6878F0" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#6878F0" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#9080D0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#70D8F0" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#6878F0" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#70D8F0" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#70D8F0" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#70D8F0" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D05860" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#70D8F0", fg = "#080C18", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#80C0F0", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D05860" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#8098C8" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#6878F0" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#7888B8" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#080C18"
vim.g.terminal_color_1 = "#B05060"
vim.g.terminal_color_2 = "#3878A0"
vim.g.terminal_color_3 = "#8098C8"
vim.g.terminal_color_4 = "#4858C8"
vim.g.terminal_color_5 = "#8068B0"
vim.g.terminal_color_6 = "#3898C0"
vim.g.terminal_color_7 = "#8898C0"
vim.g.terminal_color_8 = "#182038"
vim.g.terminal_color_9 = "#D05860"
vim.g.terminal_color_10 = "#4898A8"
vim.g.terminal_color_11 = "#6878F0"
vim.g.terminal_color_12 = "#7888B8"
vim.g.terminal_color_13 = "#9080D0"
vim.g.terminal_color_14 = "#40B8D8"
vim.g.terminal_color_15 = "#D8E0F0"
