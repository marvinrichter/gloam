-- cast — Neovim colorscheme
-- Generated from cast.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/cast.lua
-- then :colorscheme cast

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "cast"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#101010", fg = "#C8C8C0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#202020", fg = "#C8C8C0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#101010", fg = "#888880" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#1C1C1C", fg = "#C8C8C0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#D8C040", fg = "#101010" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#888880" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#C8C8C0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#101010" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#202020", fg = "#C8C8C0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#101010", fg = "#888880" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#888880" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#202020", fg = "#C8C8C0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1C1C1C", fg = "#C8C8C0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#888880" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#D8C040", fg = "#101010" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#C8C060", fg = "#101010" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#D8C040", fg = "#101010", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#888880" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#888880" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#202020", fg = "#888880", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#101010", fg = "#888880" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#D8C040", fg = "#101010" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#888880", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#D8C040" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#D8C040" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#D8C040" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#D8C040" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#D8C040" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#888880" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D85858" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#C8C8C0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#C8C060" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#C8C060" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#C8C060" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#C8C060" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#C8C060" })
  vim.api.nvim_set_hl(0, "String", { fg = "#68A068" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#68A068" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#C8C060" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#C8C060" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#C8C060" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#908090" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#D8C040" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#C8C060" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#D8C040" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#D8C040" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#D8C040" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D85858" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#D8C040", fg = "#101010", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#90A870", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D85858" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#909050" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#C8C060" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#888880" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#101010"
vim.g.terminal_color_1 = "#A06060"
vim.g.terminal_color_2 = "#508060"
vim.g.terminal_color_3 = "#909050"
vim.g.terminal_color_4 = "#506080"
vim.g.terminal_color_5 = "#786080"
vim.g.terminal_color_6 = "#407880"
vim.g.terminal_color_7 = "#909088"
vim.g.terminal_color_8 = "#202020"
vim.g.terminal_color_9 = "#D85858"
vim.g.terminal_color_10 = "#68A068"
vim.g.terminal_color_11 = "#C8C060"
vim.g.terminal_color_12 = "#888880"
vim.g.terminal_color_13 = "#908090"
vim.g.terminal_color_14 = "#50A0A8"
vim.g.terminal_color_15 = "#C8C8C0"
