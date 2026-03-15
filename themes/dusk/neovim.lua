-- dusk — Neovim colorscheme
-- Generated from dusk.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/dusk.lua
-- then :colorscheme dusk

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "dusk"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#282834", fg = "#C8C4BC" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3A3A48", fg = "#C8C4BC" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#282834", fg = "#9098A8" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#363648", fg = "#C8C4BC" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#E8A860", fg = "#282834" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3A3A48" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#3A3A48" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#9098A8" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#C8C4BC", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#282834" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#3A3A48" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#3A3A48", fg = "#C8C4BC" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#282834", fg = "#9098A8" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#9098A8" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#3A3A48", fg = "#C8C4BC" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#363648", fg = "#C8C4BC" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#3A3A48" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#9098A8" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#E8A860", fg = "#282834" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#C490C8", fg = "#282834" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#E8A860", fg = "#282834", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#9098A8" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#9098A8" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#3A3A48", fg = "#9098A8", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#282834", fg = "#9098A8" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#E8A860", fg = "#282834" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#9098A8", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#E8A860" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#E8A860" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#E8A860" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#E8A860" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#E8A860" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#9098A8" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#DC7878" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#C8C4BC" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#C490C8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#C490C8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#C490C8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#C490C8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#C490C8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#70B878" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#70B878" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#C490C8" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#C490C8" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#C490C8" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#A880C0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#E8A860" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#C490C8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#E8A860" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#E8A860" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#E8A860" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#DC7878" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#E8A860", fg = "#282834", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#B898D0", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#DC7878" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#A89868" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#C490C8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#9098A8" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#282834"
vim.g.terminal_color_1 = "#A87070"
vim.g.terminal_color_2 = "#608870"
vim.g.terminal_color_3 = "#A89868"
vim.g.terminal_color_4 = "#6880A8"
vim.g.terminal_color_5 = "#9068A0"
vim.g.terminal_color_6 = "#488898"
vim.g.terminal_color_7 = "#A0A0A0"
vim.g.terminal_color_8 = "#3A3A48"
vim.g.terminal_color_9 = "#DC7878"
vim.g.terminal_color_10 = "#70B878"
vim.g.terminal_color_11 = "#C490C8"
vim.g.terminal_color_12 = "#9098A8"
vim.g.terminal_color_13 = "#A880C0"
vim.g.terminal_color_14 = "#60A8C0"
vim.g.terminal_color_15 = "#C8C4BC"
