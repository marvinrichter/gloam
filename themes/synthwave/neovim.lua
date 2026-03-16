-- synthwave — Neovim colorscheme
-- Generated from synthwave.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/synthwave.lua
-- then :colorscheme synthwave

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "synthwave"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0D0818", fg = "#F0E8FF" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#281848", fg = "#F0E8FF" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0D0818", fg = "#9070C8" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#1A1030", fg = "#F0E8FF" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#40E8E0", fg = "#0D0818" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#281848" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#281848" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#9070C8" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F0E8FF", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0D0818" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#281848" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#281848", fg = "#F0E8FF" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0D0818", fg = "#9070C8" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#9070C8" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#281848", fg = "#F0E8FF" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1A1030", fg = "#F0E8FF" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#281848" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#9070C8" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#40E8E0", fg = "#0D0818" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#FF60C8", fg = "#0D0818" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#40E8E0", fg = "#0D0818", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#9070C8" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#9070C8" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#281848", fg = "#9070C8", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0D0818", fg = "#9070C8" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#40E8E0", fg = "#0D0818" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#9070C8", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#40E8E0" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#40E8E0" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#40E8E0" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#40E8E0" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#40E8E0" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#9070C8" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#FF4070" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#F0E8FF" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#FF60C8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#FF60C8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#FF60C8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#FF60C8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#FF60C8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#50E890" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#50E890" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#FF60C8" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#FF60C8" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#FF60C8" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#E060F0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#40E8E0" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#FF60C8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#40E8E0" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#40E8E0" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#40E8E0" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#FF4070" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#40E8E0", fg = "#0D0818", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#60C8FF", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF4070" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#D080C0" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#FF60C8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#9070C8" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0D0818"
vim.g.terminal_color_1 = "#C84060"
vim.g.terminal_color_2 = "#40C890"
vim.g.terminal_color_3 = "#D080C0"
vim.g.terminal_color_4 = "#6050D0"
vim.g.terminal_color_5 = "#C040C8"
vim.g.terminal_color_6 = "#40C0D8"
vim.g.terminal_color_7 = "#B0A0D0"
vim.g.terminal_color_8 = "#281848"
vim.g.terminal_color_9 = "#FF4070"
vim.g.terminal_color_10 = "#50E890"
vim.g.terminal_color_11 = "#FF60C8"
vim.g.terminal_color_12 = "#9070C8"
vim.g.terminal_color_13 = "#E060F0"
vim.g.terminal_color_14 = "#40E8E0"
vim.g.terminal_color_15 = "#F0E8FF"
