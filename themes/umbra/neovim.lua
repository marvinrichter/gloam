-- umbra — Neovim colorscheme
-- Generated from umbra.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/umbra.lua
-- then :colorscheme umbra

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "dark"
vim.g.colors_name = "umbra"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#070708", fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1A1C20", fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#070708", fg = "#728090" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#121420", fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#8B6CF0", fg = "#070708" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1A1C20" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#1A1C20" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#728090" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E4E8F0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#070708" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1A1C20" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1A1C20", fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#070708", fg = "#728090" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#728090" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1A1C20", fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#121420", fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1A1C20" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#728090" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#8B6CF0", fg = "#070708" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#A0B4C8", fg = "#070708" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#8B6CF0", fg = "#070708", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#728090" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#728090" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#1A1C20", fg = "#728090", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#070708", fg = "#728090" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#8B6CF0", fg = "#070708" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#728090", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#8B6CF0" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#8B6CF0" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#8B6CF0" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#8B6CF0" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#8B6CF0" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#728090" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#DC5858" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#A0B4C8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#A0B4C8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#A0B4C8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#A0B4C8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#A0B4C8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#607870" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#607870" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#A09060" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#A09060" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#A09060" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#8B6CF0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#8B6CF0" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#A0B4C8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#8B6CF0" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#8B6CF0" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#8B6CF0" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#DC5858" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#8B6CF0", fg = "#070708", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#A0B4C8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#DC5858" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#907840" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#A0B4C8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#728090" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#070708"
vim.g.terminal_color_1 = "#9A3838"
vim.g.terminal_color_2 = "#487850"
vim.g.terminal_color_3 = "#907840"
vim.g.terminal_color_4 = "#3858A0"
vim.g.terminal_color_5 = "#7858A8"
vim.g.terminal_color_6 = "#387880"
vim.g.terminal_color_7 = "#707880"
vim.g.terminal_color_8 = "#1A1C20"
vim.g.terminal_color_9 = "#DC5858"
vim.g.terminal_color_10 = "#607870"
vim.g.terminal_color_11 = "#A09060"
vim.g.terminal_color_12 = "#728090"
vim.g.terminal_color_13 = "#8B6CF0"
vim.g.terminal_color_14 = "#507878"
vim.g.terminal_color_15 = "#E4E8F0"
