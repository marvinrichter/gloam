-- fjord — Neovim colorscheme
-- Generated from fjord.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/fjord.lua
-- then :colorscheme fjord

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "dark"
vim.g.colors_name = "fjord"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0A0F18", fg = "#D4E0E8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1E2A38", fg = "#D4E0E8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0A0F18", fg = "#688EAA" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#0E1828", fg = "#D4E0E8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#E8C46A", fg = "#0A0F18" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1E2A38" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#1E2A38" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#688EAA" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D4E0E8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0A0F18" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1E2A38" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1E2A38", fg = "#D4E0E8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0A0F18", fg = "#688EAA" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#688EAA" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1E2A38", fg = "#D4E0E8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#0E1828", fg = "#D4E0E8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1E2A38" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#688EAA" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#E8C46A", fg = "#0A0F18" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#6EB5E0", fg = "#0A0F18" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#E8C46A", fg = "#0A0F18", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#688EAA" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#688EAA" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#1E2A38", fg = "#688EAA", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0A0F18", fg = "#688EAA" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#E8C46A", fg = "#0A0F18" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#688EAA", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#E8C46A" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#E8C46A" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#E8C46A" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#E8C46A" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#E8C46A" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#688EAA" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#E06060" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#D4E0E8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#6EB5E0" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#6EB5E0" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#6EB5E0" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#6EB5E0" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#6EB5E0" })
  vim.api.nvim_set_hl(0, "String", { fg = "#60B878" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#60B878" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#E8C46A" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#E8C46A" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#E8C46A" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#B090C8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#E8C46A" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#6EB5E0" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#E8C46A" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#E8C46A" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#E8C46A" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#E06060" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#E8C46A", fg = "#0A0F18", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#6EB5E0", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E06060" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#B09040" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#6EB5E0" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#688EAA" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0A0F18"
vim.g.terminal_color_1 = "#B84040"
vim.g.terminal_color_2 = "#4A9860"
vim.g.terminal_color_3 = "#B09040"
vim.g.terminal_color_4 = "#3868A8"
vim.g.terminal_color_5 = "#8060A0"
vim.g.terminal_color_6 = "#3A8898"
vim.g.terminal_color_7 = "#788898"
vim.g.terminal_color_8 = "#1E2A38"
vim.g.terminal_color_9 = "#E06060"
vim.g.terminal_color_10 = "#60B878"
vim.g.terminal_color_11 = "#E8C46A"
vim.g.terminal_color_12 = "#6EB5E0"
vim.g.terminal_color_13 = "#B090C8"
vim.g.terminal_color_14 = "#60C0C8"
vim.g.terminal_color_15 = "#D4E0E8"
