-- saffron — Neovim colorscheme
-- Generated from saffron.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/saffron.lua
-- then :colorscheme saffron

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "saffron"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#FAF0D8", fg = "#281808" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#503C28", fg = "#281808" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#FAF0D8", fg = "#806040" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#EAD8B0", fg = "#281808" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#3A2880", fg = "#FAF0D8" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#503C28" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#503C28" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#806040" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#281808", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#FAF0D8" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#503C28" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#503C28", fg = "#281808" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#FAF0D8", fg = "#806040" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#806040" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#503C28", fg = "#281808" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#EAD8B0", fg = "#281808" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#503C28" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#806040" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#3A2880", fg = "#FAF0D8" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#5E3008", fg = "#FAF0D8" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#3A2880", fg = "#FAF0D8", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#806040" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#806040" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#503C28", fg = "#806040", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#FAF0D8", fg = "#806040" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#3A2880", fg = "#FAF0D8" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#806040", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#3A2880" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#3A2880" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#3A2880" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#3A2880" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#3A2880" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#806040" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#802028" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#281808" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#5E3008" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#5E3008" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#5E3008" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#5E3008" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#5E3008" })
  vim.api.nvim_set_hl(0, "String", { fg = "#287040" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#287040" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#5E3008" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#5E3008" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#5E3008" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#3A2880" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#3A2880" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#5E3008" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#3A2880" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#3A2880" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#3A2880" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#802028" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#3A2880", fg = "#FAF0D8", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#3A2880", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#802028" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#604810" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#5E3008" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#806040" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#160C04"
vim.g.terminal_color_1 = "#6A1E20"
vim.g.terminal_color_2 = "#205024"
vim.g.terminal_color_3 = "#604810"
vim.g.terminal_color_4 = "#1C2070"
vim.g.terminal_color_5 = "#482858"
vim.g.terminal_color_6 = "#185858"
vim.g.terminal_color_7 = "#685840"
vim.g.terminal_color_8 = "#503C28"
vim.g.terminal_color_9 = "#802028"
vim.g.terminal_color_10 = "#287040"
vim.g.terminal_color_11 = "#5E3008"
vim.g.terminal_color_12 = "#806040"
vim.g.terminal_color_13 = "#3A2880"
vim.g.terminal_color_14 = "#287080"
vim.g.terminal_color_15 = "#FDF8EC"
