-- iris — Neovim colorscheme
-- Generated from iris.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/iris.lua
-- then :colorscheme iris

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "iris"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#08060E", fg = "#E0D8F8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#281838", fg = "#E0D8F8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#08060E", fg = "#8070B0" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#201030", fg = "#E0D8F8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#9060E0", fg = "#08060E" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#281838" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#281838" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#8070B0" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E0D8F8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#08060E" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#281838" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#281838", fg = "#E0D8F8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#08060E", fg = "#8070B0" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#8070B0" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#281838", fg = "#E0D8F8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#201030", fg = "#E0D8F8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#281838" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#8070B0" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#B088F8", fg = "#08060E" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#9060E0", fg = "#08060E" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#B088F8", fg = "#08060E", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#8070B0" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#8070B0" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#281838", fg = "#8070B0", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#08060E", fg = "#8070B0" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#B088F8", fg = "#08060E" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#8070B0", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#B088F8" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#B088F8" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#B088F8" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#B088F8" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#B088F8" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#8070B0" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D06868" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#E0D8F8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#9060E0" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#9060E0" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#9060E0" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#9060E0" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#9060E0" })
  vim.api.nvim_set_hl(0, "String", { fg = "#70B098" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#70B098" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#D8C068" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#D8C068" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#D8C068" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#B088F8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#B088F8" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#9060E0" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#B088F8" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#B088F8" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#B088F8" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D06868" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#B088F8", fg = "#08060E", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#B088F8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D06868" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#C0A048" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#9060E0" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#8070B0" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#100810"
vim.g.terminal_color_1 = "#D06868"
vim.g.terminal_color_2 = "#508878"
vim.g.terminal_color_3 = "#C0A048"
vim.g.terminal_color_4 = "#5870C8"
vim.g.terminal_color_5 = "#9060E0"
vim.g.terminal_color_6 = "#7898D0"
vim.g.terminal_color_7 = "#9088B0"
vim.g.terminal_color_8 = "#281838"
vim.g.terminal_color_9 = "#E08888"
vim.g.terminal_color_10 = "#70B098"
vim.g.terminal_color_11 = "#D8C068"
vim.g.terminal_color_12 = "#7898E0"
vim.g.terminal_color_13 = "#B088F8"
vim.g.terminal_color_14 = "#98C0E0"
vim.g.terminal_color_15 = "#F0E8FF"
