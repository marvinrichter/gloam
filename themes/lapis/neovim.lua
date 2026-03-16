-- lapis — Neovim colorscheme
-- Generated from lapis.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/lapis.lua
-- then :colorscheme lapis

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "lapis"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#060810", fg = "#D0D8F0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#151C38", fg = "#D0D8F0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#060810", fg = "#6878A8" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#101828", fg = "#D0D8F0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#6090FF", fg = "#060810" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#151C38" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#151C38" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#6878A8" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D0D8F0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#060810" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#151C38" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#151C38", fg = "#D0D8F0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#060810", fg = "#6878A8" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#6878A8" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#151C38", fg = "#D0D8F0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#101828", fg = "#D0D8F0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#151C38" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#6878A8" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#6090FF", fg = "#060810" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#5078F0", fg = "#060810" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#6090FF", fg = "#060810", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#6878A8" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#6878A8" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#151C38", fg = "#6878A8", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#060810", fg = "#6878A8" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#6090FF", fg = "#060810" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#6878A8", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#6090FF" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#6090FF" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#6090FF" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#6090FF" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#6090FF" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#6878A8" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#E84040" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#D0D8F0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#5078F0" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#5078F0" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#5078F0" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#5078F0" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#5078F0" })
  vim.api.nvim_set_hl(0, "String", { fg = "#48A8C8" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#48A8C8" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#5078F0" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#5078F0" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#5078F0" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#8868D0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#6090FF" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#5078F0" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#6090FF" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#6090FF" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#6090FF" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#E84040" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#6090FF", fg = "#060810", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#90B0FF", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E84040" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#4870C0" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#5078F0" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#6878A8" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#060810"
vim.g.terminal_color_1 = "#A83838"
vim.g.terminal_color_2 = "#3080A0"
vim.g.terminal_color_3 = "#4870C0"
vim.g.terminal_color_4 = "#304898"
vim.g.terminal_color_5 = "#6048A8"
vim.g.terminal_color_6 = "#3890B8"
vim.g.terminal_color_7 = "#A0B0E0"
vim.g.terminal_color_8 = "#151C38"
vim.g.terminal_color_9 = "#E84040"
vim.g.terminal_color_10 = "#48A8C8"
vim.g.terminal_color_11 = "#5078F0"
vim.g.terminal_color_12 = "#6878A8"
vim.g.terminal_color_13 = "#8868D0"
vim.g.terminal_color_14 = "#60B8E0"
vim.g.terminal_color_15 = "#D0D8F0"
