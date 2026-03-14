-- sable — Neovim colorscheme
-- Generated from sable.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/sable.lua
-- then :colorscheme sable

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "dark"
vim.g.colors_name = "sable"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#080808", fg = "#E8E8E8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#202020", fg = "#E8E8E8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#080808", fg = "#7A8294" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#181818", fg = "#E8E8E8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#D4AA6A", fg = "#080808" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#7A8294" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E8E8E8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#080808" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#202020", fg = "#E8E8E8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#080808", fg = "#7A8294" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7A8294" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#202020", fg = "#E8E8E8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#181818", fg = "#E8E8E8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#7A8294" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#D4AA6A", fg = "#080808" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#C0C8D4", fg = "#080808" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#D4AA6A", fg = "#080808", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#7A8294" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#7A8294" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#202020", fg = "#7A8294", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#080808", fg = "#7A8294" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#D4AA6A", fg = "#080808" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#7A8294", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#D4AA6A" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#D4AA6A" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#D4AA6A" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#D4AA6A" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#D4AA6A" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#7A8294" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D44848" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#E8E8E8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#C0C8D4" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#C0C8D4" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#C0C8D4" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#C0C8D4" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#C0C8D4" })
  vim.api.nvim_set_hl(0, "String", { fg = "#58A858" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#58A858" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#D4AA6A" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#D4AA6A" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#D4AA6A" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#A868A8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#D4AA6A" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#C0C8D4" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#D4AA6A" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#D4AA6A" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#D4AA6A" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D44848" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#D4AA6A", fg = "#080808", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#D4AA6A", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D44848" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#886820" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#C0C8D4" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#7A8294" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#080808"
vim.g.terminal_color_1 = "#804040"
vim.g.terminal_color_2 = "#407840"
vim.g.terminal_color_3 = "#886820"
vim.g.terminal_color_4 = "#384870"
vim.g.terminal_color_5 = "#704870"
vim.g.terminal_color_6 = "#387878"
vim.g.terminal_color_7 = "#C0C8D4"
vim.g.terminal_color_8 = "#202020"
vim.g.terminal_color_9 = "#D44848"
vim.g.terminal_color_10 = "#58A858"
vim.g.terminal_color_11 = "#D4AA6A"
vim.g.terminal_color_12 = "#7A8294"
vim.g.terminal_color_13 = "#A868A8"
vim.g.terminal_color_14 = "#60A8A8"
vim.g.terminal_color_15 = "#E8E8E8"
