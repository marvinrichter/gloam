-- damson — Neovim colorscheme
-- Generated from damson.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/damson.lua
-- then :colorscheme damson

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "damson"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#090610", fg = "#E8D8F8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#382848", fg = "#E8D8F8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#090610", fg = "#887898" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#201030", fg = "#E8D8F8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#D428BC", fg = "#090610" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#382848" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#382848" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#887898" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E8D8F8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#090610" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#382848" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#382848", fg = "#E8D8F8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#090610", fg = "#887898" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#887898" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#382848", fg = "#E8D8F8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#201030", fg = "#E8D8F8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#382848" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#887898" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#FF60D8", fg = "#090610" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#D428BC", fg = "#090610" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#FF60D8", fg = "#090610", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#887898" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#887898" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#382848", fg = "#887898", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#090610", fg = "#887898" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#FF60D8", fg = "#090610" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#887898", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#FF60D8" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#FF60D8" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#FF60D8" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#FF60D8" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#FF60D8" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#887898" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#C86060" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#E8D8F8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#D428BC" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#D428BC" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#D428BC" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#D428BC" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#D428BC" })
  vim.api.nvim_set_hl(0, "String", { fg = "#68C880" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#68C880" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#C8A050" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#C8A050" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#C8A050" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#C840B0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#FF60D8" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#D428BC" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#FF60D8" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#FF60D8" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#FF60D8" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#C86060" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#FF60D8", fg = "#090610", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#FF60D8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#C86060" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#604018" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#D428BC" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#887898" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#130B18"
vim.g.terminal_color_1 = "#601828"
vim.g.terminal_color_2 = "#285030"
vim.g.terminal_color_3 = "#604018"
vim.g.terminal_color_4 = "#202860"
vim.g.terminal_color_5 = "#602060"
vim.g.terminal_color_6 = "#204848"
vim.g.terminal_color_7 = "#A898B8"
vim.g.terminal_color_8 = "#382848"
vim.g.terminal_color_9 = "#E06070"
vim.g.terminal_color_10 = "#68C880"
vim.g.terminal_color_11 = "#C8A050"
vim.g.terminal_color_12 = "#6878D0"
vim.g.terminal_color_13 = "#C840B0"
vim.g.terminal_color_14 = "#70B8D8"
vim.g.terminal_color_15 = "#F0E8FF"
