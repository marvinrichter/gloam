-- kiln — Neovim colorscheme
-- Generated from kiln.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/kiln.lua
-- then :colorscheme kiln

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "kiln"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#100908", fg = "#F2E0D0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#281410", fg = "#F2E0D0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#100908", fg = "#A87060" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#281410", fg = "#F2E0D0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#F08040", fg = "#100908" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#281410" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#281410" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#A87060" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F2E0D0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#100908" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#281410" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#281410", fg = "#F2E0D0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#100908", fg = "#A87060" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#A87060" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#281410", fg = "#F2E0D0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#281410", fg = "#F2E0D0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#281410" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#A87060" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#F08040", fg = "#100908" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#E05830", fg = "#100908" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#F08040", fg = "#100908", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#A87060" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#A87060" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#281410", fg = "#A87060", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#100908", fg = "#A87060" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#F08040", fg = "#100908" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#A87060", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#F08040" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#F08040" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#F08040" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#F08040" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#F08040" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#A87060" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#DC4030" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#F2E0D0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#E05830" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#E05830" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#E05830" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#E05830" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#E05830" })
  vim.api.nvim_set_hl(0, "String", { fg = "#72A860" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#72A860" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#E05830" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#E05830" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#E05830" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#C08080" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#F08040" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#E05830" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#F08040" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#F08040" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#F08040" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#DC4030" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#F08040", fg = "#100908", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#F0B080", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#DC4030" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#C04820" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#E05830" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#A87060" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#100908"
vim.g.terminal_color_1 = "#A03028"
vim.g.terminal_color_2 = "#508050"
vim.g.terminal_color_3 = "#C04820"
vim.g.terminal_color_4 = "#6880A0"
vim.g.terminal_color_5 = "#906060"
vim.g.terminal_color_6 = "#507870"
vim.g.terminal_color_7 = "#C8B0A0"
vim.g.terminal_color_8 = "#281410"
vim.g.terminal_color_9 = "#DC4030"
vim.g.terminal_color_10 = "#72A860"
vim.g.terminal_color_11 = "#E05830"
vim.g.terminal_color_12 = "#A87060"
vim.g.terminal_color_13 = "#C08080"
vim.g.terminal_color_14 = "#709088"
vim.g.terminal_color_15 = "#F2E0D0"
