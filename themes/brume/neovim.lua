-- brume — Neovim colorscheme
-- Generated from brume.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/brume.lua
-- then :colorscheme brume

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "brume"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#EEF2F0", fg = "#1C3030" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#B8C8C8", fg = "#1C3030" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#EEF2F0", fg = "#486878" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#C0D8D8", fg = "#1C3030" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#1A6068", fg = "#EEF2F0" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#B8C8C8" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#B8C8C8" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#486878" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#1C3030", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#EEF2F0" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#B8C8C8" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#B8C8C8", fg = "#1C3030" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#EEF2F0", fg = "#486878" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#486878" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#B8C8C8", fg = "#1C3030" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#C0D8D8", fg = "#1C3030" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#B8C8C8" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#486878" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#1A7880", fg = "#EEF2F0" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#1A6068", fg = "#EEF2F0" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#1A7880", fg = "#EEF2F0", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#486878" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#486878" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#B8C8C8", fg = "#486878", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#EEF2F0", fg = "#486878" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#1A7880", fg = "#EEF2F0" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#486878", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#1A7880" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#1A7880" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#1A7880" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#1A7880" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#1A7880" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#486878" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#8A1A28" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#1C3030" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "String", { fg = "#207850" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#207850" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#906800" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#906800" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#906800" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#603890" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#1A7880" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#1A7880" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#1A7880" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#1A7880" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#8A1A28" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#1A7880", fg = "#EEF2F0", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#1A7880", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#8A1A28" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#705810" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#486878" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#EEF2F0"
vim.g.terminal_color_1 = "#8A1A28"
vim.g.terminal_color_2 = "#1A5038"
vim.g.terminal_color_3 = "#705810"
vim.g.terminal_color_4 = "#1A6068"
vim.g.terminal_color_5 = "#482870"
vim.g.terminal_color_6 = "#1A7880"
vim.g.terminal_color_7 = "#486878"
vim.g.terminal_color_8 = "#B8C8C8"
vim.g.terminal_color_9 = "#C04048"
vim.g.terminal_color_10 = "#207850"
vim.g.terminal_color_11 = "#906800"
vim.g.terminal_color_12 = "#2068A8"
vim.g.terminal_color_13 = "#603890"
vim.g.terminal_color_14 = "#2090A0"
vim.g.terminal_color_15 = "#1C3030"
