-- carmine — Neovim colorscheme
-- Generated from carmine.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/carmine.lua
-- then :colorscheme carmine

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "carmine"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#100808", fg = "#F2E4E0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2A1818", fg = "#F2E4E0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#100808", fg = "#9A7880" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#281010", fg = "#F2E4E0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#FFAA70", fg = "#100808" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2A1818" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#2A1818" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#9A7880" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F2E4E0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#100808" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#2A1818" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#2A1818", fg = "#F2E4E0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#100808", fg = "#9A7880" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#9A7880" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#2A1818", fg = "#F2E4E0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#281010", fg = "#F2E4E0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#2A1818" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#9A7880" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#FFAA70", fg = "#100808" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#E87070", fg = "#100808" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#FFAA70", fg = "#100808", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#9A7880" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#9A7880" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#2A1818", fg = "#9A7880", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#100808", fg = "#9A7880" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#FFAA70", fg = "#100808" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#9A7880", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#FFAA70" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#FFAA70" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#FFAA70" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#FFAA70" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#FFAA70" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#9A7880" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#FF4A4A" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#F2E4E0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#E87070" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#E87070" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#E87070" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#E87070" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#E87070" })
  vim.api.nvim_set_hl(0, "String", { fg = "#78C878" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#78C878" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#E87070" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#E87070" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#E87070" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#D08090" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#FFAA70" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#E87070" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#FFAA70" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#FFAA70" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#FFAA70" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#FF4A4A" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#FFAA70", fg = "#100808", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#E890A0", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF4A4A" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#C08040" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#E87070" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#9A7880" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#100808"
vim.g.terminal_color_1 = "#C85858"
vim.g.terminal_color_2 = "#5A8A60"
vim.g.terminal_color_3 = "#C08040"
vim.g.terminal_color_4 = "#705870"
vim.g.terminal_color_5 = "#A85878"
vim.g.terminal_color_6 = "#407888"
vim.g.terminal_color_7 = "#B8A0A0"
vim.g.terminal_color_8 = "#2A1818"
vim.g.terminal_color_9 = "#FF4A4A"
vim.g.terminal_color_10 = "#78C878"
vim.g.terminal_color_11 = "#E87070"
vim.g.terminal_color_12 = "#9A7880"
vim.g.terminal_color_13 = "#D08090"
vim.g.terminal_color_14 = "#58A8B8"
vim.g.terminal_color_15 = "#F2E4E0"
