-- ember — Neovim colorscheme
-- Generated from ember.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/ember.lua
-- then :colorscheme ember

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "dark"
vim.g.colors_name = "ember"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#111008", fg = "#F5EDD4" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282418", fg = "#F5EDD4" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#111008", fg = "#9E8E78" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#201C10", fg = "#F5EDD4" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#FF6D00", fg = "#111008" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282418" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#282418" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#9E8E78" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F5EDD4", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#111008" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#282418" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#282418", fg = "#F5EDD4" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#111008", fg = "#9E8E78" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#9E8E78" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#282418", fg = "#F5EDD4" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#201C10", fg = "#F5EDD4" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#282418" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#9E8E78" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#FF6D00", fg = "#111008" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#FFAB40", fg = "#111008" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#FF6D00", fg = "#111008", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#9E8E78" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#9E8E78" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#282418", fg = "#9E8E78", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#111008", fg = "#9E8E78" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#FF6D00", fg = "#111008" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#9E8E78", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#FF6D00" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#FF6D00" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#FF6D00" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#FF6D00" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#FF6D00" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#9E8E78" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#FF4040" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#F5EDD4" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#FFAB40" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#FFAB40" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#FFAB40" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#FFAB40" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#FFAB40" })
  vim.api.nvim_set_hl(0, "String", { fg = "#68A858" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#68A858" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#FFAB40" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#FFAB40" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#FFAB40" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#E87868" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#FF6D00" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#FFAB40" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#FF6D00" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#FF6D00" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#FF6D00" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#FF4040" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#FF6D00", fg = "#111008", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#FFAB40", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF4040" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#C87C28" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#FFAB40" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#9E8E78" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#111008"
vim.g.terminal_color_1 = "#8B2828"
vim.g.terminal_color_2 = "#4A7840"
vim.g.terminal_color_3 = "#C87C28"
vim.g.terminal_color_4 = "#384868"
vim.g.terminal_color_5 = "#784868"
vim.g.terminal_color_6 = "#386068"
vim.g.terminal_color_7 = "#A89880"
vim.g.terminal_color_8 = "#282418"
vim.g.terminal_color_9 = "#FF4040"
vim.g.terminal_color_10 = "#68A858"
vim.g.terminal_color_11 = "#FFAB40"
vim.g.terminal_color_12 = "#9E8E78"
vim.g.terminal_color_13 = "#E87868"
vim.g.terminal_color_14 = "#88A888"
vim.g.terminal_color_15 = "#F5EDD4"
