-- daybook — Neovim colorscheme
-- Generated from daybook.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/daybook.lua
-- then :colorscheme daybook

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "daybook"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#F2EEE6", fg = "#1E1A14" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#4A4030", fg = "#1E1A14" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#F2EEE6", fg = "#6A5E4E" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#D8CEB8", fg = "#1E1A14" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#884830", fg = "#F4EFE4" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#4A4030" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#4A4030" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#6A5E4E" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#1E1A14", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#F2EEE6" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#4A4030" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#4A4030", fg = "#1E1A14" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#F2EEE6", fg = "#6A5E4E" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#6A5E4E" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#4A4030", fg = "#1E1A14" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#D8CEB8", fg = "#1E1A14" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#4A4030" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#6A5E4E" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#884830", fg = "#F2EEE6" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#284878", fg = "#F2EEE6" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#884830", fg = "#F2EEE6", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#6A5E4E" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#6A5E4E" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#4A4030", fg = "#6A5E4E", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#F2EEE6", fg = "#6A5E4E" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#884830", fg = "#F2EEE6" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#6A5E4E", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#884830" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#884830" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#884830" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#884830" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#884830" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#6A5E4E" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#882020" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#1E1A14" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#284878" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#284878" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#284878" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#284878" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#284878" })
  vim.api.nvim_set_hl(0, "String", { fg = "#387038" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#387038" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#886028" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#886028" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#886028" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#884830" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#884830" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#284878" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#884830" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#884830" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#884830" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#882020" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#884830", fg = "#F2EEE6", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#284878", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#882020" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#604818" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#284878" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#6A5E4E" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0E0A08"
vim.g.terminal_color_1 = "#6A1E1E"
vim.g.terminal_color_2 = "#204828"
vim.g.terminal_color_3 = "#604818"
vim.g.terminal_color_4 = "#183060"
vim.g.terminal_color_5 = "#582858"
vim.g.terminal_color_6 = "#184848"
vim.g.terminal_color_7 = "#A09080"
vim.g.terminal_color_8 = "#4A4030"
vim.g.terminal_color_9 = "#882020"
vim.g.terminal_color_10 = "#387038"
vim.g.terminal_color_11 = "#886028"
vim.g.terminal_color_12 = "#6A5E4E"
vim.g.terminal_color_13 = "#884830"
vim.g.terminal_color_14 = "#286868"
vim.g.terminal_color_15 = "#F0EBE0"
