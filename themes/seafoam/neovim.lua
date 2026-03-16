-- seafoam — Neovim colorscheme
-- Generated from seafoam.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/seafoam.lua
-- then :colorscheme seafoam

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "seafoam"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#EEF5F2", fg = "#101E18" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#C0D8D0", fg = "#101E18" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#EEF5F2", fg = "#406060" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#C0E8E0", fg = "#101E18" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#166870", fg = "#EEF5F2" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#C0D8D0" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#C0D8D0" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#406060" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#101E18", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#EEF5F2" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#C0D8D0" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#C0D8D0", fg = "#101E18" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#EEF5F2", fg = "#406060" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#406060" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#C0D8D0", fg = "#101E18" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#C0E8E0", fg = "#101E18" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#C0D8D0" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#406060" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#166870", fg = "#EEF5F2" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#1A7858", fg = "#EEF5F2" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#166870", fg = "#EEF5F2", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#406060" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#406060" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#C0D8D0", fg = "#406060", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#EEF5F2", fg = "#406060" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#166870", fg = "#EEF5F2" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#406060", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#166870" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#166870" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#166870" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#166870" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#166870" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#406060" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#C83820" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#101E18" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#1A7858" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#1A7858" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#1A7858" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#1A7858" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#1A7858" })
  vim.api.nvim_set_hl(0, "String", { fg = "#207850" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#207850" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#508040" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#508040" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#508040" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#604878" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#166870" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#1A7858" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#166870" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#166870" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#166870" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#C83820" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#166870", fg = "#EEF5F2", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#1A7858", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#C83820" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#706020" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#1A7858" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#406060" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#EEF5F2"
vim.g.terminal_color_1 = "#7A2828"
vim.g.terminal_color_2 = "#1A5040"
vim.g.terminal_color_3 = "#706020"
vim.g.terminal_color_4 = "#1A7858"
vim.g.terminal_color_5 = "#583060"
vim.g.terminal_color_6 = "#166870"
vim.g.terminal_color_7 = "#406060"
vim.g.terminal_color_8 = "#C0D8D0"
vim.g.terminal_color_9 = "#C83820"
vim.g.terminal_color_10 = "#207850"
vim.g.terminal_color_11 = "#508040"
vim.g.terminal_color_12 = "#207888"
vim.g.terminal_color_13 = "#604878"
vim.g.terminal_color_14 = "#1A9080"
vim.g.terminal_color_15 = "#101E18"
