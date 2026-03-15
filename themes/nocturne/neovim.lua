-- nocturne — Neovim colorscheme
-- Generated from nocturne.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/nocturne.lua
-- then :colorscheme nocturne

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "nocturne"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#100A0C", fg = "#EEE8E0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#201820", fg = "#EEE8E0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#100A0C", fg = "#848080" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#201820", fg = "#EEE8E0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#D05A6A", fg = "#0C0A0C" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#201820" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#201820" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#848080" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#EEE8E0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#100A0C" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#201820" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#201820", fg = "#EEE8E0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#100A0C", fg = "#848080" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#848080" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#201820", fg = "#EEE8E0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#201820", fg = "#EEE8E0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#201820" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#848080" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#D05A6A", fg = "#100A0C" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#E0D0A8", fg = "#100A0C" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#D05A6A", fg = "#100A0C", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#848080" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#848080" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#201820", fg = "#848080", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#100A0C", fg = "#848080" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#D05A6A", fg = "#100A0C" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#848080", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#D05A6A" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#D05A6A" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#D05A6A" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#D05A6A" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#D05A6A" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#848080" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#E04848" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#EEE8E0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#E0D0A8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#E0D0A8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#E0D0A8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#E0D0A8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#E0D0A8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#60B870" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#60B870" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#E0D0A8" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#E0D0A8" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#E0D0A8" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#D05A6A" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#D05A6A" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#E0D0A8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#D05A6A" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#D05A6A" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#D05A6A" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#E04848" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#D05A6A", fg = "#100A0C", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#E0D0A8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E04848" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#B09040" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#E0D0A8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#848080" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#100A0C"
vim.g.terminal_color_1 = "#883040"
vim.g.terminal_color_2 = "#406840"
vim.g.terminal_color_3 = "#B09040"
vim.g.terminal_color_4 = "#484880"
vim.g.terminal_color_5 = "#784878"
vim.g.terminal_color_6 = "#387878"
vim.g.terminal_color_7 = "#848080"
vim.g.terminal_color_8 = "#201820"
vim.g.terminal_color_9 = "#E04848"
vim.g.terminal_color_10 = "#60B870"
vim.g.terminal_color_11 = "#E0D0A8"
vim.g.terminal_color_12 = "#9880A0"
vim.g.terminal_color_13 = "#D05A6A"
vim.g.terminal_color_14 = "#50A8A8"
vim.g.terminal_color_15 = "#EEE8E0"
