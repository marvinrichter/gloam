-- sumi — Neovim colorscheme
-- Generated from sumi.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/sumi.lua
-- then :colorscheme sumi

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "sumi"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0A0B0D", fg = "#D8D0C0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#202428", fg = "#D8D0C0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0A0B0D", fg = "#788090" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#181A20", fg = "#D8D0C0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#7898B8", fg = "#0A0B0D" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#202428" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#202428" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#788090" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D8D0C0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0A0B0D" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#202428" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#202428", fg = "#D8D0C0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0A0B0D", fg = "#788090" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#788090" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#202428", fg = "#D8D0C0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#181A20", fg = "#D8D0C0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#202428" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#788090" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#7898B8", fg = "#0A0B0D" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#8878C8", fg = "#0A0B0D" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#7898B8", fg = "#0A0B0D", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#788090" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#788090" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#202428", fg = "#788090", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0A0B0D", fg = "#788090" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#7898B8", fg = "#0A0B0D" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#788090", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#7898B8" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#7898B8" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#7898B8" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#7898B8" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#7898B8" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#788090" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#B86868" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#D8D0C0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#8878C8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#8878C8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#8878C8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#8878C8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#8878C8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#60A870" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#60A870" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#8878C8" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#8878C8" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#8878C8" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#9078A0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#7898B8" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#8878C8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#7898B8" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#7898B8" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#7898B8" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#B86868" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#7898B8", fg = "#0A0B0D", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#8AB0C8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#B86868" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#A09060" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#8878C8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#788090" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0A0B0D"
vim.g.terminal_color_1 = "#9A5050"
vim.g.terminal_color_2 = "#4A8860"
vim.g.terminal_color_3 = "#A09060"
vim.g.terminal_color_4 = "#587080"
vim.g.terminal_color_5 = "#806878"
vim.g.terminal_color_6 = "#407880"
vim.g.terminal_color_7 = "#909090"
vim.g.terminal_color_8 = "#202428"
vim.g.terminal_color_9 = "#B86868"
vim.g.terminal_color_10 = "#60A870"
vim.g.terminal_color_11 = "#8878C8"
vim.g.terminal_color_12 = "#788090"
vim.g.terminal_color_13 = "#9078A0"
vim.g.terminal_color_14 = "#5898A8"
vim.g.terminal_color_15 = "#D8D0C0"
