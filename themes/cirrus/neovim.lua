-- cirrus — Neovim colorscheme
-- Generated from cirrus.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/cirrus.lua
-- then :colorscheme cirrus

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "cirrus"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#EEF1F6", fg = "#181C28" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#505870", fg = "#181C28" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#EEF1F6", fg = "#506098" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#D8E0EC", fg = "#181C28" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#1A7060", fg = "#EEF1F6" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#505870" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#505870" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#506098" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#181C28", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#EEF1F6" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#505870" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#505870", fg = "#181C28" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#EEF1F6", fg = "#506098" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#506098" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#505870", fg = "#181C28" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#D8E0EC", fg = "#181C28" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#505870" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#506098" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#1A7060", fg = "#EEF1F6" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#1E4888", fg = "#EEF1F6" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#1A7060", fg = "#EEF1F6", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#506098" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#506098" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#505870", fg = "#506098", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#EEF1F6", fg = "#506098" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#1A7060", fg = "#EEF1F6" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#506098", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#1A7060" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#1A7060" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#1A7060" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#1A7060" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#1A7060" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#506098" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#882028" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#181C28" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#1E4888" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#1E4888" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#1E4888" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#1E4888" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#1E4888" })
  vim.api.nvim_set_hl(0, "String", { fg = "#287038" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#287038" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#785820" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#785820" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#785820" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#1A7060" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#1A7060" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#1E4888" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#1A7060" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#1A7060" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#1A7060" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#882028" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#1A7060", fg = "#EEF1F6", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#1E4888", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#882028" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#504818" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#1E4888" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#506098" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#080C18"
vim.g.terminal_color_1 = "#702020"
vim.g.terminal_color_2 = "#205428"
vim.g.terminal_color_3 = "#504818"
vim.g.terminal_color_4 = "#182858"
vim.g.terminal_color_5 = "#482858"
vim.g.terminal_color_6 = "#184050"
vim.g.terminal_color_7 = "#9098B8"
vim.g.terminal_color_8 = "#505870"
vim.g.terminal_color_9 = "#882028"
vim.g.terminal_color_10 = "#287038"
vim.g.terminal_color_11 = "#785820"
vim.g.terminal_color_12 = "#506098"
vim.g.terminal_color_13 = "#1A7060"
vim.g.terminal_color_14 = "#288080"
vim.g.terminal_color_15 = "#F0F4F8"
