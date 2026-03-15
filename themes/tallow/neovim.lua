-- tallow — Neovim colorscheme
-- Generated from tallow.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/tallow.lua
-- then :colorscheme tallow

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "tallow"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#120E08", fg = "#F0E8D8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282018", fg = "#F0E8D8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#120E08", fg = "#9A8870" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#201808", fg = "#F0E8D8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#D4905A", fg = "#120E08" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282018" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#282018" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#9A8870" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F0E8D8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#120E08" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#282018" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#282018", fg = "#F0E8D8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#120E08", fg = "#9A8870" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#9A8870" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#282018", fg = "#F0E8D8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#201808", fg = "#F0E8D8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#282018" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#9A8870" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#D4905A", fg = "#120E08" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#E8C888", fg = "#120E08" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#D4905A", fg = "#120E08", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#9A8870" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#9A8870" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#282018", fg = "#9A8870", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#120E08", fg = "#9A8870" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#D4905A", fg = "#120E08" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#9A8870", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#D4905A" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#D4905A" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#D4905A" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#D4905A" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#D4905A" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#9A8870" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D86060" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#F0E8D8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#E8C888" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#E8C888" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#E8C888" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#E8C888" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#E8C888" })
  vim.api.nvim_set_hl(0, "String", { fg = "#70A860" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#70A860" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#E8C888" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#E8C888" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#E8C888" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#B088A0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#D4905A" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#E8C888" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#D4905A" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#D4905A" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#D4905A" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D86060" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#D4905A", fg = "#120E08", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#C8A870", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D86060" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#C09858" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#E8C888" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#9A8870" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#120E08"
vim.g.terminal_color_1 = "#B06050"
vim.g.terminal_color_2 = "#608050"
vim.g.terminal_color_3 = "#C09858"
vim.g.terminal_color_4 = "#606870"
vim.g.terminal_color_5 = "#907868"
vim.g.terminal_color_6 = "#488078"
vim.g.terminal_color_7 = "#B0A088"
vim.g.terminal_color_8 = "#282018"
vim.g.terminal_color_9 = "#D86060"
vim.g.terminal_color_10 = "#70A860"
vim.g.terminal_color_11 = "#E8C888"
vim.g.terminal_color_12 = "#9A8870"
vim.g.terminal_color_13 = "#B088A0"
vim.g.terminal_color_14 = "#5898A8"
vim.g.terminal_color_15 = "#F0E8D8"
