-- madder — Neovim colorscheme
-- Generated from madder.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/madder.lua
-- then :colorscheme madder

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "madder"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0E0608", fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#38182A", fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0E0608", fg = "#B08098" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#301020", fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#E04060", fg = "#0E0608" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#38182A" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#38182A" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#B08098" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F0E0E8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0E0608" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#38182A" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#38182A", fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0E0608", fg = "#B08098" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#B08098" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#38182A", fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#301020", fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#38182A" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#B08098" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#F07898", fg = "#0E0608" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#E04060", fg = "#0E0608" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#F07898", fg = "#0E0608", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#B08098" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#B08098" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#38182A", fg = "#B08098", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0E0608", fg = "#B08098" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#F07898", fg = "#0E0608" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#B08098", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#F07898" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#F07898" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#F07898" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#F07898" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#F07898" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#B08098" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#E04848" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#F0E0E8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#E04060" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#E04060" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#E04060" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#E04060" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#E04060" })
  vim.api.nvim_set_hl(0, "String", { fg = "#70A878" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#70A878" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#D8B888" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#D8B888" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#D8B888" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#F090C0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#F07898" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#E04060" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#F07898" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#F07898" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#F07898" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#E04848" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#F07898", fg = "#0E0608", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#F07898", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E04848" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#C09868" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#E04060" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#B08098" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#180810"
vim.g.terminal_color_1 = "#E04848"
vim.g.terminal_color_2 = "#508058"
vim.g.terminal_color_3 = "#C09868"
vim.g.terminal_color_4 = "#6868B0"
vim.g.terminal_color_5 = "#E04060"
vim.g.terminal_color_6 = "#809080"
vim.g.terminal_color_7 = "#C08898"
vim.g.terminal_color_8 = "#38182A"
vim.g.terminal_color_9 = "#F06878"
vim.g.terminal_color_10 = "#70A878"
vim.g.terminal_color_11 = "#D8B888"
vim.g.terminal_color_12 = "#8898C8"
vim.g.terminal_color_13 = "#F090C0"
vim.g.terminal_color_14 = "#90A888"
vim.g.terminal_color_15 = "#F8E8F0"
