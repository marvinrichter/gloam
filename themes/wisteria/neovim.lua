-- wisteria — Neovim colorscheme
-- Generated from wisteria.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/wisteria.lua
-- then :colorscheme wisteria

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "wisteria"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#F4F0F8", fg = "#2A1A40" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#C8B8D8", fg = "#2A1A40" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#F4F0F8", fg = "#4A3868" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#D8C8F0", fg = "#2A1A40" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#4828A0", fg = "#F4F0F8" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#C8B8D8" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#C8B8D8" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#4A3868" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#2A1A40", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#F4F0F8" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#C8B8D8" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#C8B8D8", fg = "#2A1A40" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#F4F0F8", fg = "#4A3868" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#4A3868" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#C8B8D8", fg = "#2A1A40" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#D8C8F0", fg = "#2A1A40" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#C8B8D8" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#4A3868" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#782870", fg = "#F4F0F8" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#4828A0", fg = "#F4F0F8" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#782870", fg = "#F4F0F8", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#4A3868" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#4A3868" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#C8B8D8", fg = "#4A3868", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#F4F0F8", fg = "#4A3868" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#782870", fg = "#F4F0F8" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#4A3868", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#782870" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#782870" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#782870" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#782870" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#782870" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#4A3868" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#882020" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#2A1A40" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#4828A0" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#4828A0" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#4828A0" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#4828A0" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#4828A0" })
  vim.api.nvim_set_hl(0, "String", { fg = "#287840" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#287840" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#906820" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#906820" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#906820" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#6838C0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#782870" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#4828A0" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#782870" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#782870" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#782870" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#882020" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#782870", fg = "#F4F0F8", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#782870", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#882020" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#705010" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#4828A0" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#4A3868" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#F4F0F8"
vim.g.terminal_color_1 = "#882020"
vim.g.terminal_color_2 = "#1A5028"
vim.g.terminal_color_3 = "#705010"
vim.g.terminal_color_4 = "#2A3888"
vim.g.terminal_color_5 = "#4828A0"
vim.g.terminal_color_6 = "#286080"
vim.g.terminal_color_7 = "#4A3868"
vim.g.terminal_color_8 = "#C8B8D8"
vim.g.terminal_color_9 = "#C04848"
vim.g.terminal_color_10 = "#287840"
vim.g.terminal_color_11 = "#906820"
vim.g.terminal_color_12 = "#3850B8"
vim.g.terminal_color_13 = "#6838C0"
vim.g.terminal_color_14 = "#30809A"
vim.g.terminal_color_15 = "#2A1A40"
