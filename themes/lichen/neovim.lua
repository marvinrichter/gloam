-- lichen — Neovim colorscheme
-- Generated from lichen.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/lichen.lua
-- then :colorscheme lichen

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "lichen"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0A0D0B", fg = "#D8E0D4" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1C2A20", fg = "#D8E0D4" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0A0D0B", fg = "#708868" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#182820", fg = "#D8E0D4" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#90B878", fg = "#0A0D0B" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1C2A20" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#1C2A20" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#708868" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D8E0D4", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0A0D0B" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1C2A20" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1C2A20", fg = "#D8E0D4" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0A0D0B", fg = "#708868" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#708868" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1C2A20", fg = "#D8E0D4" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#182820", fg = "#D8E0D4" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1C2A20" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#708868" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#90B878", fg = "#0A0D0B" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#759075", fg = "#0A0D0B" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#90B878", fg = "#0A0D0B", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#708868" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#708868" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#1C2A20", fg = "#708868", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0A0D0B", fg = "#708868" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#90B878", fg = "#0A0D0B" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#708868", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#90B878" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#90B878" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#90B878" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#90B878" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#90B878" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#708868" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#C07060" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#D8E0D4" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#759075" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#759075" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#759075" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#759075" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#759075" })
  vim.api.nvim_set_hl(0, "String", { fg = "#759075" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#759075" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#A0A860" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#A0A860" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#A0A860" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#A89080" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#90B878" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#759075" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#90B878" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#90B878" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#90B878" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#C07060" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#90B878", fg = "#0A0D0B", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#A8C890", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#C07060" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#888050" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#759075" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#708868" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0A0D0B"
vim.g.terminal_color_1 = "#886058"
vim.g.terminal_color_2 = "#508050"
vim.g.terminal_color_3 = "#888050"
vim.g.terminal_color_4 = "#507878"
vim.g.terminal_color_5 = "#786868"
vim.g.terminal_color_6 = "#509888"
vim.g.terminal_color_7 = "#A8B8A4"
vim.g.terminal_color_8 = "#1C2A20"
vim.g.terminal_color_9 = "#C07060"
vim.g.terminal_color_10 = "#759075"
vim.g.terminal_color_11 = "#A0A860"
vim.g.terminal_color_12 = "#708868"
vim.g.terminal_color_13 = "#A89080"
vim.g.terminal_color_14 = "#70C0A0"
vim.g.terminal_color_15 = "#D8E0D4"
