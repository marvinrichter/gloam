-- bloom — Neovim colorscheme
-- Generated from bloom.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/bloom.lua
-- then :colorscheme bloom

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "bloom"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#FFF0F0", fg = "#2A1420" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3A2030", fg = "#2A1420" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#FFF0F0", fg = "#7A5868" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#F0C8D0", fg = "#2A1420" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#5A2080", fg = "#FFF0F0" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3A2030" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#3A2030" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#7A5868" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#2A1420", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#FFF0F0" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#3A2030" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#3A2030", fg = "#2A1420" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#FFF0F0", fg = "#7A5868" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7A5868" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#3A2030", fg = "#2A1420" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#F0C8D0", fg = "#2A1420" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#3A2030" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#7A5868" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#5A2080", fg = "#FFF0F0" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#7A1840", fg = "#FFF0F0" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#5A2080", fg = "#FFF0F0", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#7A5868" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#7A5868" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#3A2030", fg = "#7A5868", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#FFF0F0", fg = "#7A5868" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#5A2080", fg = "#FFF0F0" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#7A5868", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#5A2080" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#5A2080" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#5A2080" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#5A2080" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#5A2080" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#7A5868" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#8A1020" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#2A1420" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#7A1840" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#7A1840" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#7A1840" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#7A1840" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#7A1840" })
  vim.api.nvim_set_hl(0, "String", { fg = "#386028" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#386028" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#7A1840" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#7A1840" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#7A1840" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#703888" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#5A2080" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#7A1840" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#5A2080" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#5A2080" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#5A2080" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#8A1020" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#5A2080", fg = "#FFF0F0", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#28287A", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#8A1020" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#705A10" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#7A1840" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#7A5868" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#1A0810"
vim.g.terminal_color_1 = "#7A2020"
vim.g.terminal_color_2 = "#286020"
vim.g.terminal_color_3 = "#705A10"
vim.g.terminal_color_4 = "#28287A"
vim.g.terminal_color_5 = "#58285A"
vim.g.terminal_color_6 = "#1A5058"
vim.g.terminal_color_7 = "#D8B8C0"
vim.g.terminal_color_8 = "#3A2030"
vim.g.terminal_color_9 = "#8A1020"
vim.g.terminal_color_10 = "#386028"
vim.g.terminal_color_11 = "#7A1840"
vim.g.terminal_color_12 = "#7A5868"
vim.g.terminal_color_13 = "#703888"
vim.g.terminal_color_14 = "#285878"
vim.g.terminal_color_15 = "#F8E8F0"
