-- parchment — Neovim colorscheme
-- Generated from parchment.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/parchment.lua
-- then :colorscheme parchment

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "parchment"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#EDE0C8", fg = "#2A1E12" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#4A3828", fg = "#2A1E12" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#EDE0C8", fg = "#6B5A48" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#D8C8A8", fg = "#2A1E12" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#7A3A10", fg = "#EDE0C8" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#4A3828" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#4A3828" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#6B5A48" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#2A1E12", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#EDE0C8" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#4A3828" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#4A3828", fg = "#2A1E12" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#EDE0C8", fg = "#6B5A48" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#6B5A48" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#4A3828", fg = "#2A1E12" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#D8C8A8", fg = "#2A1E12" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#4A3828" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#6B5A48" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#7A3A10", fg = "#EDE0C8" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#4A2E12", fg = "#EDE0C8" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#7A3A10", fg = "#EDE0C8", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#6B5A48" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#6B5A48" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#4A3828", fg = "#6B5A48", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#EDE0C8", fg = "#6B5A48" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#7A3A10", fg = "#EDE0C8" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#6B5A48", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#7A3A10" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#7A3A10" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#7A3A10" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#7A3A10" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#7A3A10" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#6B5A48" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#8B2020" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#2A1E12" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#4A2E12" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#4A2E12" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#4A2E12" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#4A2E12" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#4A2E12" })
  vim.api.nvim_set_hl(0, "String", { fg = "#387830" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#387830" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#7A3A10" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#7A3A10" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#7A3A10" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#784890" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#7A3A10" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#4A2E12" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#7A3A10" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#7A3A10" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#7A3A10" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#8B2020" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#7A3A10", fg = "#EDE0C8", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#28407A", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#8B2020" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#785A10" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#4A2E12" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#6B5A48" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#1A0E08"
vim.g.terminal_color_1 = "#7A2020"
vim.g.terminal_color_2 = "#285820"
vim.g.terminal_color_3 = "#785A10"
vim.g.terminal_color_4 = "#28407A"
vim.g.terminal_color_5 = "#58285A"
vim.g.terminal_color_6 = "#1A5050"
vim.g.terminal_color_7 = "#C0A888"
vim.g.terminal_color_8 = "#4A3828"
vim.g.terminal_color_9 = "#9A3030"
vim.g.terminal_color_10 = "#387830"
vim.g.terminal_color_11 = "#7A3A10"
vim.g.terminal_color_12 = "#6B5A48"
vim.g.terminal_color_13 = "#784890"
vim.g.terminal_color_14 = "#287878"
vim.g.terminal_color_15 = "#F0E8D8"
