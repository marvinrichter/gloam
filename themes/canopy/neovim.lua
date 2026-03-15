-- canopy — Neovim colorscheme
-- Generated from canopy.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/canopy.lua
-- then :colorscheme canopy

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "canopy"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#080E0A", fg = "#D4E0C8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#182018", fg = "#D4E0C8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#080E0A", fg = "#709068" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#101A12", fg = "#D4E0C8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#C8A060", fg = "#080E0A" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#182018" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#182018" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#709068" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D4E0C8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#080E0A" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#182018" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#182018", fg = "#D4E0C8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#080E0A", fg = "#709068" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#709068" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#182018", fg = "#D4E0C8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#101A12", fg = "#D4E0C8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#182018" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#709068" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#C8A060", fg = "#080E0A" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#90C860", fg = "#080E0A" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#C8A060", fg = "#080E0A", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#709068" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#709068" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#182018", fg = "#709068", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#080E0A", fg = "#709068" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#C8A060", fg = "#080E0A" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#709068", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#C8A060" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#C8A060" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#C8A060" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#C8A060" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#C8A060" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#709068" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D06868" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#D4E0C8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#90C860" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#90C860" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#90C860" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#90C860" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#90C860" })
  vim.api.nvim_set_hl(0, "String", { fg = "#60C870" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#60C870" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#90C860" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#90C860" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#90C860" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#A070B8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#C8A060" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#90C860" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#C8A060" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#C8A060" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#C8A060" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D06868" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#C8A060", fg = "#080E0A", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#70C898", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D06868" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#A88840" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#90C860" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#709068" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#080E0A"
vim.g.terminal_color_1 = "#A05858"
vim.g.terminal_color_2 = "#4EA858"
vim.g.terminal_color_3 = "#A88840"
vim.g.terminal_color_4 = "#406080"
vim.g.terminal_color_5 = "#8058A0"
vim.g.terminal_color_6 = "#3A8878"
vim.g.terminal_color_7 = "#909880"
vim.g.terminal_color_8 = "#182018"
vim.g.terminal_color_9 = "#D06868"
vim.g.terminal_color_10 = "#60C870"
vim.g.terminal_color_11 = "#90C860"
vim.g.terminal_color_12 = "#709068"
vim.g.terminal_color_13 = "#A070B8"
vim.g.terminal_color_14 = "#50A890"
vim.g.terminal_color_15 = "#D4E0C8"
