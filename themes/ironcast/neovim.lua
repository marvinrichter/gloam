-- ironcast — Neovim colorscheme
-- Generated from ironcast.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/ironcast.lua
-- then :colorscheme ironcast

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "ironcast"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0B0D10", fg = "#CDD4DC" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1C2028", fg = "#CDD4DC" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0B0D10", fg = "#7090A8" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#181C24", fg = "#CDD4DC" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#C8D838", fg = "#0B0D10" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1C2028" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#1C2028" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#7090A8" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#CDD4DC", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0B0D10" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1C2028" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1C2028", fg = "#CDD4DC" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0B0D10", fg = "#7090A8" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7090A8" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1C2028", fg = "#CDD4DC" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#181C24", fg = "#CDD4DC" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1C2028" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#7090A8" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#C8D838", fg = "#0B0D10" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#78A8C8", fg = "#0B0D10" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#C8D838", fg = "#0B0D10", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#7090A8" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#7090A8" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#1C2028", fg = "#7090A8", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0B0D10", fg = "#7090A8" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#C8D838", fg = "#0B0D10" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#7090A8", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#C8D838" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#C8D838" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#C8D838" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#C8D838" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#C8D838" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#7090A8" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D05858" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#CDD4DC" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#78A8C8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#78A8C8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#78A8C8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#78A8C8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#78A8C8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#60A878" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#60A878" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#78A8C8" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#78A8C8" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#78A8C8" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#9880B8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#C8D838" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#78A8C8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#C8D838" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#C8D838" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#C8D838" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D05858" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#C8D838", fg = "#0B0D10", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#90C8E0", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D05858" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#9A9050" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#78A8C8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#7090A8" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0B0D10"
vim.g.terminal_color_1 = "#B05050"
vim.g.terminal_color_2 = "#487858"
vim.g.terminal_color_3 = "#9A9050"
vim.g.terminal_color_4 = "#4868A0"
vim.g.terminal_color_5 = "#786890"
vim.g.terminal_color_6 = "#407888"
vim.g.terminal_color_7 = "#909898"
vim.g.terminal_color_8 = "#1C2028"
vim.g.terminal_color_9 = "#D05858"
vim.g.terminal_color_10 = "#60A878"
vim.g.terminal_color_11 = "#78A8C8"
vim.g.terminal_color_12 = "#7090A8"
vim.g.terminal_color_13 = "#9880B8"
vim.g.terminal_color_14 = "#50A0B8"
vim.g.terminal_color_15 = "#CDD4DC"
