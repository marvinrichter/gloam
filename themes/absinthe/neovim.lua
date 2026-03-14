-- absinthe — Neovim colorscheme
-- Generated from absinthe.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/absinthe.lua
-- then :colorscheme absinthe

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "dark"
vim.g.colors_name = "absinthe"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#080D0A", fg = "#D8E8D4" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#182018", fg = "#D8E8D4" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#080D0A", fg = "#7A8A7A" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#101810", fg = "#D8E8D4" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#E8C848", fg = "#080D0A" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#182018" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#182018" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#7A8A7A" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D8E8D4", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#080D0A" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#182018" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#182018", fg = "#D8E8D4" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#080D0A", fg = "#7A8A7A" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7A8A7A" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#182018", fg = "#D8E8D4" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#101810", fg = "#D8E8D4" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#182018" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#7A8A7A" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#E8C848", fg = "#080D0A" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#70E0A0", fg = "#080D0A" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#E8C848", fg = "#080D0A", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#7A8A7A" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#7A8A7A" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#182018", fg = "#7A8A7A", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#080D0A", fg = "#7A8A7A" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#E8C848", fg = "#080D0A" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#7A8A7A", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#E8C848" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#E8C848" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#E8C848" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#E8C848" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#E8C848" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#7A8A7A" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#E05858" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#D8E8D4" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#70E0A0" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#70E0A0" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#70E0A0" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#70E0A0" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#70E0A0" })
  vim.api.nvim_set_hl(0, "String", { fg = "#70E0A0" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#70E0A0" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#E8C848" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#E8C848" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#E8C848" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#B898A8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#E8C848" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#70E0A0" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#E8C848" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#E8C848" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#E8C848" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#E05858" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#E8C848", fg = "#080D0A", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#E8C848", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E05858" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#A89040" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#70E0A0" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#7A8A7A" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#080D0A"
vim.g.terminal_color_1 = "#885848"
vim.g.terminal_color_2 = "#50986A"
vim.g.terminal_color_3 = "#A89040"
vim.g.terminal_color_4 = "#384858"
vim.g.terminal_color_5 = "#786888"
vim.g.terminal_color_6 = "#388070"
vim.g.terminal_color_7 = "#889878"
vim.g.terminal_color_8 = "#182018"
vim.g.terminal_color_9 = "#E05858"
vim.g.terminal_color_10 = "#70E0A0"
vim.g.terminal_color_11 = "#E8C848"
vim.g.terminal_color_12 = "#7A8A7A"
vim.g.terminal_color_13 = "#B898A8"
vim.g.terminal_color_14 = "#68C8A8"
vim.g.terminal_color_15 = "#D8E8D4"
