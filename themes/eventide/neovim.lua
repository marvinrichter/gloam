-- eventide — Neovim colorscheme
-- Generated from eventide.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/eventide.lua
-- then :colorscheme eventide

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "dark"
vim.g.colors_name = "eventide"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0D0F1A", fg = "#F0EAD6" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2A2D3E", fg = "#F0EAD6" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0D0F1A", fg = "#8B84C4" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#1E2040", fg = "#F0EAD6" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#FF7F57", fg = "#0D0F1A" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2A2D3E" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#2A2D3E" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#8B84C4" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F0EAD6", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0D0F1A" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#2A2D3E" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#2A2D3E", fg = "#F0EAD6" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0D0F1A", fg = "#8B84C4" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#8B84C4" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#2A2D3E", fg = "#F0EAD6" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1E2040", fg = "#F0EAD6" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#2A2D3E" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#8B84C4" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#FF7F57", fg = "#0D0F1A" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#E8B86D", fg = "#0D0F1A" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#FF7F57", fg = "#0D0F1A", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#8B84C4" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#8B84C4" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#2A2D3E", fg = "#8B84C4", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0D0F1A", fg = "#8B84C4" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#FF7F57", fg = "#0D0F1A" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#8B84C4", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#FF7F57" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#FF7F57" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#FF7F57" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#FF7F57" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#FF7F57" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#8B84C4" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#E85D5D" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#F0EAD6" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#E8B86D" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#E8B86D" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#E8B86D" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#E8B86D" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#E8B86D" })
  vim.api.nvim_set_hl(0, "String", { fg = "#7EC99A" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#7EC99A" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#E8B86D" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#E8B86D" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#E8B86D" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#C490D1" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#FF7F57" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#E8B86D" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#FF7F57" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#FF7F57" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#FF7F57" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#E85D5D" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#FF7F57", fg = "#0D0F1A", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#B8B4E8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E85D5D" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#C4983A" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#E8B86D" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#8B84C4" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0D0F1A"
vim.g.terminal_color_1 = "#C85A5A"
vim.g.terminal_color_2 = "#6BAF8A"
vim.g.terminal_color_3 = "#C4983A"
vim.g.terminal_color_4 = "#6B64A8"
vim.g.terminal_color_5 = "#A870BC"
vim.g.terminal_color_6 = "#4A9CA8"
vim.g.terminal_color_7 = "#B8AFCC"
vim.g.terminal_color_8 = "#2A2D3E"
vim.g.terminal_color_9 = "#E87070"
vim.g.terminal_color_10 = "#7EC99A"
vim.g.terminal_color_11 = "#E8B86D"
vim.g.terminal_color_12 = "#8B84C4"
vim.g.terminal_color_13 = "#C490D1"
vim.g.terminal_color_14 = "#5FB8C0"
vim.g.terminal_color_15 = "#F0EAD6"
