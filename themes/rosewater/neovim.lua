-- rosewater — Neovim colorscheme
-- Generated from rosewater.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/rosewater.lua
-- then :colorscheme rosewater

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "rosewater"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#100A0F", fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2A1828", fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#100A0F", fg = "#9A7890" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#201018", fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#C8A0D8", fg = "#100A0F" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2A1828" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#2A1828" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#9A7890" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F0E0E8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#100A0F" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#2A1828" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#2A1828", fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#100A0F", fg = "#9A7890" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#9A7890" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#2A1828", fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#201018", fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#2A1828" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#9A7890" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#C8A0D8", fg = "#100A0F" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#E868A0", fg = "#100A0F" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#C8A0D8", fg = "#100A0F", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#9A7890" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#9A7890" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#2A1828", fg = "#9A7890", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#100A0F", fg = "#9A7890" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#C8A0D8", fg = "#100A0F" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#9A7890", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#C8A0D8" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#C8A0D8" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#C8A0D8" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#C8A0D8" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#C8A0D8" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#9A7890" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#E05A5A" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#E868A0" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#E868A0" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#E868A0" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#E868A0" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#E868A0" })
  vim.api.nvim_set_hl(0, "String", { fg = "#70B880" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#70B880" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#E868A0" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#E868A0" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#E868A0" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#D080C8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#C8A0D8" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#E868A0" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#C8A0D8" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#C8A0D8" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#C8A0D8" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#E05A5A" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#C8A0D8", fg = "#100A0F", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#C0A0E8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E05A5A" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#C09068" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#E868A0" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#9A7890" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#100A0F"
vim.g.terminal_color_1 = "#C86070"
vim.g.terminal_color_2 = "#5A9068"
vim.g.terminal_color_3 = "#C09068"
vim.g.terminal_color_4 = "#6858A0"
vim.g.terminal_color_5 = "#B06090"
vim.g.terminal_color_6 = "#508098"
vim.g.terminal_color_7 = "#B09898"
vim.g.terminal_color_8 = "#2A1828"
vim.g.terminal_color_9 = "#E05A5A"
vim.g.terminal_color_10 = "#70B880"
vim.g.terminal_color_11 = "#E868A0"
vim.g.terminal_color_12 = "#9A7890"
vim.g.terminal_color_13 = "#D080C8"
vim.g.terminal_color_14 = "#60A8C0"
vim.g.terminal_color_15 = "#F0E0E8"
