-- fern — Neovim colorscheme
-- Generated from fern.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/fern.lua
-- then :colorscheme fern

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "fern"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#EEF2EC", fg = "#1A2E1A" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#30403A", fg = "#1A2E1A" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#EEF2EC", fg = "#4A5E50" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#D4DED0", fg = "#1A2E1A" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#604A10", fg = "#EEF2EC" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#30403A" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#30403A" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#4A5E50" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#1A2E1A", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#EEF2EC" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#30403A" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#30403A", fg = "#1A2E1A" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#EEF2EC", fg = "#4A5E50" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#4A5E50" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#30403A", fg = "#1A2E1A" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#D4DED0", fg = "#1A2E1A" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#30403A" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#4A5E50" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#604A10", fg = "#EEF2EC" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#1A4A2A", fg = "#EEF2EC" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#604A10", fg = "#EEF2EC", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#4A5E50" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#4A5E50" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#30403A", fg = "#4A5E50", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#EEF2EC", fg = "#4A5E50" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#604A10", fg = "#EEF2EC" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#4A5E50", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#604A10" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#604A10" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#604A10" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#604A10" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#604A10" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#4A5E50" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#6A1818" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#1A2E1A" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#1A4A2A" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#1A4A2A" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#1A4A2A" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#1A4A2A" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#1A4A2A" })
  vim.api.nvim_set_hl(0, "String", { fg = "#3A6828" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#3A6828" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#1A4A2A" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#1A4A2A" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#1A4A2A" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#584878" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#604A10" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#1A4A2A" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#604A10" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#604A10" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#604A10" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#6A1818" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#604A10", fg = "#EEF2EC", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#284068", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#6A1818" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#684A10" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#1A4A2A" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#4A5E50" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0E1A0E"
vim.g.terminal_color_1 = "#6A2020"
vim.g.terminal_color_2 = "#2A5828"
vim.g.terminal_color_3 = "#684A10"
vim.g.terminal_color_4 = "#284068"
vim.g.terminal_color_5 = "#505270"
vim.g.terminal_color_6 = "#1A5048"
vim.g.terminal_color_7 = "#C8D4C0"
vim.g.terminal_color_8 = "#30403A"
vim.g.terminal_color_9 = "#6A1818"
vim.g.terminal_color_10 = "#3A6828"
vim.g.terminal_color_11 = "#1A4A2A"
vim.g.terminal_color_12 = "#4A5E50"
vim.g.terminal_color_13 = "#584878"
vim.g.terminal_color_14 = "#287858"
vim.g.terminal_color_15 = "#F0F4EE"
