-- phosphor — Neovim colorscheme
-- Generated from phosphor.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/phosphor.lua
-- then :colorscheme phosphor

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "phosphor"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#040804", fg = "#C0E8B8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#182818", fg = "#C0E8B8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#040804", fg = "#50A860" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#102010", fg = "#C0E8B8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#40FF80", fg = "#040804" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#182818" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#182818" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#50A860" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#C0E8B8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#040804" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#182818" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#182818", fg = "#C0E8B8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#040804", fg = "#50A860" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#50A860" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#182818", fg = "#C0E8B8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#102010", fg = "#C0E8B8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#182818" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#50A860" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#40FF80", fg = "#040804" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#00D848", fg = "#040804" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#40FF80", fg = "#040804", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#50A860" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#50A860" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#182818", fg = "#50A860", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#040804", fg = "#50A860" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#40FF80", fg = "#040804" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#50A860", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#40FF80" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#40FF80" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#40FF80" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#40FF80" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#40FF80" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#50A860" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#FF4040" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#C0E8B8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#00D848" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#00D848" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#00D848" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#00D848" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#00D848" })
  vim.api.nvim_set_hl(0, "String", { fg = "#00D848" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#00D848" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#50E060" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#50E060" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#50E060" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#60C060" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#40FF80" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#00D848" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#40FF80" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#40FF80" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#40FF80" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#FF4040" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#40FF80", fg = "#040804", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#70F8A8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF4040" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#38A040" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#00D848" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#50A860" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#040804"
vim.g.terminal_color_1 = "#A83030"
vim.g.terminal_color_2 = "#209040"
vim.g.terminal_color_3 = "#38A040"
vim.g.terminal_color_4 = "#208840"
vim.g.terminal_color_5 = "#508040"
vim.g.terminal_color_6 = "#28C878"
vim.g.terminal_color_7 = "#80C090"
vim.g.terminal_color_8 = "#182818"
vim.g.terminal_color_9 = "#FF4040"
vim.g.terminal_color_10 = "#00D848"
vim.g.terminal_color_11 = "#50E060"
vim.g.terminal_color_12 = "#50A860"
vim.g.terminal_color_13 = "#60C060"
vim.g.terminal_color_14 = "#40FF80"
vim.g.terminal_color_15 = "#C0E8B8"
