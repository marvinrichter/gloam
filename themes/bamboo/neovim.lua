-- bamboo — Neovim colorscheme
-- Generated from bamboo.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/bamboo.lua
-- then :colorscheme bamboo

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "bamboo"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#090C08", fg = "#E0DDD4" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#182018", fg = "#E0DDD4" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#090C08", fg = "#888A90" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#141A12", fg = "#E0DDD4" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#80B8A0", fg = "#090C08" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#182018" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#182018" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#888A90" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E0DDD4", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#090C08" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#182018" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#182018", fg = "#E0DDD4" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#090C08", fg = "#888A90" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#888A90" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#182018", fg = "#E0DDD4" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#141A12", fg = "#E0DDD4" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#182018" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#888A90" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#80B8A0", fg = "#090C08" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#E06848", fg = "#090C08" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#80B8A0", fg = "#090C08", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#888A90" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#888A90" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#182018", fg = "#888A90", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#090C08", fg = "#888A90" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#80B8A0", fg = "#090C08" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#888A90", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#80B8A0" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#80B8A0" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#80B8A0" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#80B8A0" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#80B8A0" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#888A90" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#C86868" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#E0DDD4" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#E06848" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#E06848" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#E06848" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#E06848" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#E06848" })
  vim.api.nvim_set_hl(0, "String", { fg = "#68A870" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#68A870" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#E06848" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#E06848" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#E06848" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#A878A8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#80B8A0" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#E06848" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#80B8A0" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#80B8A0" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#80B8A0" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#C86868" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#80B8A0", fg = "#090C08", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#98D0B8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#C86868" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#A89050" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#E06848" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#888A90" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#090C08"
vim.g.terminal_color_1 = "#A85858"
vim.g.terminal_color_2 = "#508060"
vim.g.terminal_color_3 = "#A89050"
vim.g.terminal_color_4 = "#507090"
vim.g.terminal_color_5 = "#90607A"
vim.g.terminal_color_6 = "#407880"
vim.g.terminal_color_7 = "#909888"
vim.g.terminal_color_8 = "#182018"
vim.g.terminal_color_9 = "#C86868"
vim.g.terminal_color_10 = "#68A870"
vim.g.terminal_color_11 = "#E06848"
vim.g.terminal_color_12 = "#888A90"
vim.g.terminal_color_13 = "#A878A8"
vim.g.terminal_color_14 = "#5898A8"
vim.g.terminal_color_15 = "#E0DDD4"
