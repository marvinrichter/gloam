-- overcast — Neovim colorscheme
-- Generated from overcast.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/overcast.lua
-- then :colorscheme overcast

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "overcast"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#F0F2F5", fg = "#181C28" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#C8CDD8", fg = "#181C28" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#F0F2F5", fg = "#505870" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#D0D8F0", fg = "#181C28" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#3060C8", fg = "#F0F2F5" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#C8CDD8" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#C8CDD8" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#505870" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#181C28", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#F0F2F5" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#C8CDD8" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#C8CDD8", fg = "#181C28" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#F0F2F5", fg = "#505870" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#505870" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#C8CDD8", fg = "#181C28" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#D0D8F0", fg = "#181C28" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#C8CDD8" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#505870" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#3060C8", fg = "#F0F2F5" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#4040C8", fg = "#F0F2F5" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#3060C8", fg = "#F0F2F5", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#505870" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#505870" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#C8CDD8", fg = "#505870", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#F0F2F5", fg = "#505870" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#3060C8", fg = "#F0F2F5" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#505870", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#3060C8" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#3060C8" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#3060C8" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#3060C8" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#3060C8" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#505870" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#C02030" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#181C28" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#4040C8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#4040C8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#4040C8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#4040C8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#4040C8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#287840" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#287840" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#A06020" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#A06020" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#A06020" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#7858A0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#3060C8" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#4040C8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#3060C8" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#3060C8" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#3060C8" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#C02030" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#3060C8", fg = "#F0F2F5", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#3060C8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#C02030" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#705010" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#4040C8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#505870" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#F0F2F5"
vim.g.terminal_color_1 = "#901828"
vim.g.terminal_color_2 = "#1A5A30"
vim.g.terminal_color_3 = "#705010"
vim.g.terminal_color_4 = "#4040C8"
vim.g.terminal_color_5 = "#583878"
vim.g.terminal_color_6 = "#3060C8"
vim.g.terminal_color_7 = "#505870"
vim.g.terminal_color_8 = "#C8CDD8"
vim.g.terminal_color_9 = "#C02030"
vim.g.terminal_color_10 = "#287840"
vim.g.terminal_color_11 = "#A06020"
vim.g.terminal_color_12 = "#4060B0"
vim.g.terminal_color_13 = "#7858A0"
vim.g.terminal_color_14 = "#405880"
vim.g.terminal_color_15 = "#181C28"
