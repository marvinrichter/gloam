-- solano — Neovim colorscheme
-- Generated from solano.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/solano.lua
-- then :colorscheme solano

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "solano"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#F5EDE0", fg = "#2A1C10" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#4A3828", fg = "#2A1C10" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#F5EDE0", fg = "#7A5C40" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#DDD0BC", fg = "#2A1C10" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#1A4A7A", fg = "#F5EDE0" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#4A3828" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#4A3828" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#7A5C40" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#2A1C10", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#F5EDE0" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#4A3828" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#4A3828", fg = "#2A1C10" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#F5EDE0", fg = "#7A5C40" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7A5C40" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#4A3828", fg = "#2A1C10" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#DDD0BC", fg = "#2A1C10" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#4A3828" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#7A5C40" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#1A4A7A", fg = "#F5EDE0" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#782010", fg = "#F5EDE0" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#1A4A7A", fg = "#F5EDE0", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#7A5C40" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#7A5C40" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#4A3828", fg = "#7A5C40", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#F5EDE0", fg = "#7A5C40" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#1A4A7A", fg = "#F5EDE0" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#7A5C40", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#1A4A7A" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#1A4A7A" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#1A4A7A" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#1A4A7A" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#1A4A7A" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#7A5C40" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#8B1A2A" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#2A1C10" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#782010" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#782010" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#782010" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#782010" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#782010" })
  vim.api.nvim_set_hl(0, "String", { fg = "#2C7038" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#2C7038" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#782010" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#782010" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#782010" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#1A4A7A" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#1A4A7A" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#782010" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#1A4A7A" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#1A4A7A" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#1A4A7A" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#8B1A2A" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#1A4A7A", fg = "#F5EDE0", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#1A4A7A", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#8B1A2A" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#5A3008" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#782010" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#7A5C40" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#180A04"
vim.g.terminal_color_1 = "#642020"
vim.g.terminal_color_2 = "#1C5024"
vim.g.terminal_color_3 = "#5A3008"
vim.g.terminal_color_4 = "#183070"
vim.g.terminal_color_5 = "#482860"
vim.g.terminal_color_6 = "#185060"
vim.g.terminal_color_7 = "#706050"
vim.g.terminal_color_8 = "#4A3828"
vim.g.terminal_color_9 = "#8B1A2A"
vim.g.terminal_color_10 = "#2C7038"
vim.g.terminal_color_11 = "#782010"
vim.g.terminal_color_12 = "#7A5C40"
vim.g.terminal_color_13 = "#1A4A7A"
vim.g.terminal_color_14 = "#2C7080"
vim.g.terminal_color_15 = "#F8F0E8"
