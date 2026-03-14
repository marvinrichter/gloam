-- verdigris — Neovim colorscheme
-- Generated from verdigris.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/verdigris.lua
-- then :colorscheme verdigris

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "verdigris"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0D1210", fg = "#D4E0D8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1A2820", fg = "#D4E0D8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0D1210", fg = "#7A9490" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#182420", fg = "#D4E0D8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#CD8B4A", fg = "#0D1210" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1A2820" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#1A2820" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#7A9490" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D4E0D8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0D1210" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1A2820" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1A2820", fg = "#D4E0D8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0D1210", fg = "#7A9490" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7A9490" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1A2820", fg = "#D4E0D8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#182420", fg = "#D4E0D8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1A2820" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#7A9490" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#CD8B4A", fg = "#0D1210" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#52C4A8", fg = "#0D1210" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#CD8B4A", fg = "#0D1210", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#7A9490" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#7A9490" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#1A2820", fg = "#7A9490", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0D1210", fg = "#7A9490" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#CD8B4A", fg = "#0D1210" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#7A9490", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#CD8B4A" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#CD8B4A" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#CD8B4A" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#CD8B4A" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#CD8B4A" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#7A9490" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D46060" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#D4E0D8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#52C4A8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#52C4A8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#52C4A8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#52C4A8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#52C4A8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#52C4A8" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#52C4A8" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#CD8B4A" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#CD8B4A" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#CD8B4A" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#A87888" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#CD8B4A" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#52C4A8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#CD8B4A" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#CD8B4A" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#CD8B4A" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D46060" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#CD8B4A", fg = "#0D1210", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#52C4A8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D46060" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#887840" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#52C4A8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#7A9490" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0D1210"
vim.g.terminal_color_1 = "#884448"
vim.g.terminal_color_2 = "#408068"
vim.g.terminal_color_3 = "#887840"
vim.g.terminal_color_4 = "#386068"
vim.g.terminal_color_5 = "#785868"
vim.g.terminal_color_6 = "#3A7870"
vim.g.terminal_color_7 = "#789488"
vim.g.terminal_color_8 = "#1A2820"
vim.g.terminal_color_9 = "#D46060"
vim.g.terminal_color_10 = "#52C4A8"
vim.g.terminal_color_11 = "#CD8B4A"
vim.g.terminal_color_12 = "#7A9490"
vim.g.terminal_color_13 = "#A87888"
vim.g.terminal_color_14 = "#60B8A8"
vim.g.terminal_color_15 = "#D4E0D8"
