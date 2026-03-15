-- graphite — Neovim colorscheme
-- Generated from graphite.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/graphite.lua
-- then :colorscheme graphite

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "graphite"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0C0C0C", fg = "#E0E0E0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#202020", fg = "#E0E0E0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0C0C0C", fg = "#808888" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#1C1C1C", fg = "#E0E0E0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#D8C8A0", fg = "#0C0C0C" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#808888" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E0E0E0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0C0C0C" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#202020", fg = "#E0E0E0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0C0C0C", fg = "#808888" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#808888" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#202020", fg = "#E0E0E0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1C1C1C", fg = "#E0E0E0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#202020" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#808888" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#D8C8A0", fg = "#0C0C0C" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#C4B8C8", fg = "#0C0C0C" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#D8C8A0", fg = "#0C0C0C", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#808888" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#808888" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#202020", fg = "#808888", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0C0C0C", fg = "#808888" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#D8C8A0", fg = "#0C0C0C" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#808888", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#D8C8A0" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#D8C8A0" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#D8C8A0" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#D8C8A0" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#D8C8A0" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#808888" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#C86060" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#E0E0E0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#C4B8C8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#C4B8C8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#C4B8C8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#C4B8C8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#C4B8C8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#68A870" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#68A870" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#C4B8C8" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#C4B8C8" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#C4B8C8" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#9888A8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#D8C8A0" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#C4B8C8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#D8C8A0" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#D8C8A0" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#D8C8A0" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#C86060" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#D8C8A0", fg = "#0C0C0C", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#A898C0", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#C86060" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#988870" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#C4B8C8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#808888" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0C0C0C"
vim.g.terminal_color_1 = "#986868"
vim.g.terminal_color_2 = "#508858"
vim.g.terminal_color_3 = "#988870"
vim.g.terminal_color_4 = "#586878"
vim.g.terminal_color_5 = "#887888"
vim.g.terminal_color_6 = "#508088"
vim.g.terminal_color_7 = "#A0A0A0"
vim.g.terminal_color_8 = "#202020"
vim.g.terminal_color_9 = "#C86060"
vim.g.terminal_color_10 = "#68A870"
vim.g.terminal_color_11 = "#C4B8C8"
vim.g.terminal_color_12 = "#808888"
vim.g.terminal_color_13 = "#9888A8"
vim.g.terminal_color_14 = "#5898A0"
vim.g.terminal_color_15 = "#E0E0E0"
