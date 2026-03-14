-- amethyst — Neovim colorscheme
-- Generated from amethyst.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/amethyst.lua
-- then :colorscheme amethyst

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "amethyst"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0C0811", fg = "#EAD8F8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#201428", fg = "#EAD8F8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0C0811", fg = "#9080A8" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#180E28", fg = "#EAD8F8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#E8B84A", fg = "#0C0811" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#201428" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#201428" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#9080A8" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#EAD8F8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0C0811" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#201428" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#201428", fg = "#EAD8F8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0C0811", fg = "#9080A8" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#9080A8" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#201428", fg = "#EAD8F8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#180E28", fg = "#EAD8F8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#201428" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#9080A8" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#E8B84A", fg = "#0C0811" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#C084F0", fg = "#0C0811" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#E8B84A", fg = "#0C0811", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#9080A8" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#9080A8" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#201428", fg = "#9080A8", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0C0811", fg = "#9080A8" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#E8B84A", fg = "#0C0811" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#9080A8", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#E8B84A" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#E8B84A" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#E8B84A" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#E8B84A" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#E8B84A" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#9080A8" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#E05858" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#EAD8F8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#C084F0" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#C084F0" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#C084F0" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#C084F0" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#C084F0" })
  vim.api.nvim_set_hl(0, "String", { fg = "#68A870" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#68A870" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#E8B84A" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#E8B84A" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#E8B84A" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#C084F0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#E8B84A" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#C084F0" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#E8B84A" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#E8B84A" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#E8B84A" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#E05858" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#E8B84A", fg = "#0C0811", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#C084F0", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E05858" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#C09840" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#C084F0" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#9080A8" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0C0811"
vim.g.terminal_color_1 = "#B04040"
vim.g.terminal_color_2 = "#508058"
vim.g.terminal_color_3 = "#C09840"
vim.g.terminal_color_4 = "#5068B0"
vim.g.terminal_color_5 = "#9060B0"
vim.g.terminal_color_6 = "#4080A8"
vim.g.terminal_color_7 = "#8870A0"
vim.g.terminal_color_8 = "#201428"
vim.g.terminal_color_9 = "#E05858"
vim.g.terminal_color_10 = "#68A870"
vim.g.terminal_color_11 = "#E8B84A"
vim.g.terminal_color_12 = "#9080A8"
vim.g.terminal_color_13 = "#C084F0"
vim.g.terminal_color_14 = "#60A8C0"
vim.g.terminal_color_15 = "#EAD8F8"
