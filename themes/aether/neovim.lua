-- aether — Neovim colorscheme
-- Generated from aether.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/aether.lua
-- then :colorscheme aether

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "dark"
vim.g.colors_name = "aether"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0C0B1A", fg = "#D4D8F0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#252448", fg = "#D4D8F0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0C0B1A", fg = "#8886B0" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#1C1B3A", fg = "#D4D8F0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#C084FC", fg = "#0C0B1A" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#252448" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#252448" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#8886B0" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D4D8F0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0C0B1A" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#252448" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#252448", fg = "#D4D8F0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0C0B1A", fg = "#8886B0" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#8886B0" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#252448", fg = "#D4D8F0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1C1B3A", fg = "#D4D8F0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#252448" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#8886B0" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#C084FC", fg = "#0C0B1A" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#5EE8B8", fg = "#0C0B1A" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#C084FC", fg = "#0C0B1A", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#8886B0" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#8886B0" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#252448", fg = "#8886B0", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0C0B1A", fg = "#8886B0" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#C084FC", fg = "#0C0B1A" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#8886B0", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#C084FC" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#C084FC" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#C084FC" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#C084FC" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#C084FC" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#8886B0" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#FF6B6B" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#D4D8F0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#5EE8B8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#5EE8B8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#5EE8B8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#5EE8B8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#5EE8B8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#5EE8B8" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#5EE8B8" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#9EE878" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#9EE878" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#9EE878" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#C084FC" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#C084FC" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#5EE8B8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#C084FC" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#C084FC" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#C084FC" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#FF6B6B" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#C084FC", fg = "#0C0B1A", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#9EE878", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF6B6B" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#A8B870" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#5EE8B8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#8886B0" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0C0B1A"
vim.g.terminal_color_1 = "#9B4F6C"
vim.g.terminal_color_2 = "#4AC88A"
vim.g.terminal_color_3 = "#A8B870"
vim.g.terminal_color_4 = "#6B5ED8"
vim.g.terminal_color_5 = "#B060C8"
vim.g.terminal_color_6 = "#48A8CC"
vim.g.terminal_color_7 = "#9098C0"
vim.g.terminal_color_8 = "#252448"
vim.g.terminal_color_9 = "#E87090"
vim.g.terminal_color_10 = "#5EE8B8"
vim.g.terminal_color_11 = "#9EE878"
vim.g.terminal_color_12 = "#8886B0"
vim.g.terminal_color_13 = "#C084FC"
vim.g.terminal_color_14 = "#58C8E8"
vim.g.terminal_color_15 = "#D4D8F0"
