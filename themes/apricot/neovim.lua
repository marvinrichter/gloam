-- apricot — Neovim colorscheme
-- Generated from apricot.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/apricot.lua
-- then :colorscheme apricot

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "apricot"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#FDF6ED", fg = "#200E06" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#EDD8B8", fg = "#200E06" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#FDF6ED", fg = "#806050" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#F0D8B8", fg = "#200E06" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#904018", fg = "#FDF6ED" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#EDD8B8" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#EDD8B8" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#806050" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#200E06", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#FDF6ED" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#EDD8B8" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#EDD8B8", fg = "#200E06" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#FDF6ED", fg = "#806050" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#806050" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#EDD8B8", fg = "#200E06" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#F0D8B8", fg = "#200E06" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#EDD8B8" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#806050" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#904018", fg = "#FDF6ED" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#7A5810", fg = "#FDF6ED" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#904018", fg = "#FDF6ED", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#806050" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#806050" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#EDD8B8", fg = "#806050", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#FDF6ED", fg = "#806050" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#904018", fg = "#FDF6ED" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#806050", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#904018" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#904018" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#904018" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#904018" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#904018" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#806050" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#B01818" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#200E06" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#7A5810" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#7A5810" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#7A5810" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#7A5810" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#7A5810" })
  vim.api.nvim_set_hl(0, "String", { fg = "#487840" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#487840" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#A86030" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#A86030" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#A86030" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#A05060" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#904018" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#7A5810" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#904018" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#904018" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#904018" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#B01818" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#904018", fg = "#FDF6ED", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#A04820", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#B01818" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#804010" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#7A5810" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#806050" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#FDF6ED"
vim.g.terminal_color_1 = "#781808"
vim.g.terminal_color_2 = "#386030"
vim.g.terminal_color_3 = "#804010"
vim.g.terminal_color_4 = "#7A5810"
vim.g.terminal_color_5 = "#7A3838"
vim.g.terminal_color_6 = "#904018"
vim.g.terminal_color_7 = "#806050"
vim.g.terminal_color_8 = "#EDD8B8"
vim.g.terminal_color_9 = "#B01818"
vim.g.terminal_color_10 = "#487840"
vim.g.terminal_color_11 = "#A86030"
vim.g.terminal_color_12 = "#A86038"
vim.g.terminal_color_13 = "#A05060"
vim.g.terminal_color_14 = "#507880"
vim.g.terminal_color_15 = "#200E06"
