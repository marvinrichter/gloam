-- cordovan — Neovim colorscheme
-- Generated from cordovan.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/cordovan.lua
-- then :colorscheme cordovan

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "cordovan"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#120A06", fg = "#EAE0D4" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#281810", fg = "#EAE0D4" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#120A06", fg = "#9A7D6A" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#241408", fg = "#EAE0D4" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#6B9AB8", fg = "#120A06" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#281810" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#281810" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#9A7D6A" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#EAE0D4", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#120A06" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#281810" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#281810", fg = "#EAE0D4" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#120A06", fg = "#9A7D6A" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#9A7D6A" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#281810", fg = "#EAE0D4" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#241408", fg = "#EAE0D4" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#281810" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#9A7D6A" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#6B9AB8", fg = "#120A06" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#C49A6A", fg = "#120A06" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#6B9AB8", fg = "#120A06", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#9A7D6A" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#9A7D6A" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#281810", fg = "#9A7D6A", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#120A06", fg = "#9A7D6A" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#6B9AB8", fg = "#120A06" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#9A7D6A", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#6B9AB8" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#6B9AB8" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#6B9AB8" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#6B9AB8" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#6B9AB8" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#9A7D6A" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D06060" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#EAE0D4" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#C49A6A" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#C49A6A" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#C49A6A" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#C49A6A" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#C49A6A" })
  vim.api.nvim_set_hl(0, "String", { fg = "#608858" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#608858" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#C49A6A" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#C49A6A" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#C49A6A" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#9880A8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#6B9AB8" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#C49A6A" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#6B9AB8" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#6B9AB8" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#6B9AB8" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D06060" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#6B9AB8", fg = "#120A06", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#6B9AB8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D06060" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#B08840" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#C49A6A" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#9A7D6A" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#120A06"
vim.g.terminal_color_1 = "#A83030"
vim.g.terminal_color_2 = "#507840"
vim.g.terminal_color_3 = "#B08840"
vim.g.terminal_color_4 = "#386898"
vim.g.terminal_color_5 = "#7A5080"
vim.g.terminal_color_6 = "#3A7878"
vim.g.terminal_color_7 = "#887868"
vim.g.terminal_color_8 = "#281810"
vim.g.terminal_color_9 = "#D06060"
vim.g.terminal_color_10 = "#608858"
vim.g.terminal_color_11 = "#C49A6A"
vim.g.terminal_color_12 = "#6B9AB8"
vim.g.terminal_color_13 = "#9880A8"
vim.g.terminal_color_14 = "#508898"
vim.g.terminal_color_15 = "#EAE0D4"
