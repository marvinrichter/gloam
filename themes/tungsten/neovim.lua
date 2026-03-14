-- tungsten — Neovim colorscheme
-- Generated from tungsten.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/tungsten.lua
-- then :colorscheme tungsten

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "dark"
vim.g.colors_name = "tungsten"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0E0C09", fg = "#F4EED8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1E1A14", fg = "#F4EED8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0E0C09", fg = "#887A60" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#1C1810", fg = "#F4EED8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#5A90C8", fg = "#0E0C09" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1E1A14" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#1E1A14" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#887A60" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F4EED8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0E0C09" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1E1A14" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1E1A14", fg = "#F4EED8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0E0C09", fg = "#887A60" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#887A60" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1E1A14", fg = "#F4EED8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1C1810", fg = "#F4EED8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1E1A14" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#887A60" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#5A90C8", fg = "#0E0C09" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#F0D890", fg = "#0E0C09" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#5A90C8", fg = "#0E0C09", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#887A60" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#887A60" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#1E1A14", fg = "#887A60", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0E0C09", fg = "#887A60" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#5A90C8", fg = "#0E0C09" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#887A60", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#5A90C8" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#5A90C8" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#5A90C8" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#5A90C8" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#5A90C8" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#887A60" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#E05858" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#F4EED8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#F0D890" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#F0D890" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#F0D890" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#F0D890" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#F0D890" })
  vim.api.nvim_set_hl(0, "String", { fg = "#68A860" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#68A860" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#F0D890" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#F0D890" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#F0D890" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#A078C8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#5A90C8" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#F0D890" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#5A90C8" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#5A90C8" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#5A90C8" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#E05858" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#5A90C8", fg = "#0E0C09", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#5A90C8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E05858" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#C0A840" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#F0D890" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#887A60" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0E0C09"
vim.g.terminal_color_1 = "#B03838"
vim.g.terminal_color_2 = "#508048"
vim.g.terminal_color_3 = "#C0A840"
vim.g.terminal_color_4 = "#4068A8"
vim.g.terminal_color_5 = "#8050A8"
vim.g.terminal_color_6 = "#308898"
vim.g.terminal_color_7 = "#907868"
vim.g.terminal_color_8 = "#1E1A14"
vim.g.terminal_color_9 = "#E05858"
vim.g.terminal_color_10 = "#68A860"
vim.g.terminal_color_11 = "#F0D890"
vim.g.terminal_color_12 = "#5A90C8"
vim.g.terminal_color_13 = "#A078C8"
vim.g.terminal_color_14 = "#50A0B0"
vim.g.terminal_color_15 = "#F4EED8"
