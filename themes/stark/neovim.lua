-- stark — Neovim colorscheme
-- Generated from stark.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/stark.lua
-- then :colorscheme stark

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "stark"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#FFFFFF", fg = "#000000" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#444444", fg = "#000000" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#FFFFFF", fg = "#3A3A3A" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#E0E0E0", fg = "#000000" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#8C3000", fg = "#FFFFFF" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#444444" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#444444" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#3A3A3A" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#000000", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#FFFFFF" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#444444" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#444444", fg = "#000000" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#FFFFFF", fg = "#3A3A3A" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#3A3A3A" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#444444", fg = "#000000" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#E0E0E0", fg = "#000000" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#444444" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#3A3A3A" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#8C3000", fg = "#FFFFFF" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#001A8C", fg = "#FFFFFF" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#8C3000", fg = "#FFFFFF", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#3A3A3A" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#3A3A3A" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#444444", fg = "#3A3A3A", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#FFFFFF", fg = "#3A3A3A" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#8C3000", fg = "#FFFFFF" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#3A3A3A", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#8C3000" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#8C3000" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#8C3000" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#8C3000" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#8C3000" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#3A3A3A" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#8C0000" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#000000" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#001A8C" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#001A8C" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#001A8C" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#001A8C" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#001A8C" })
  vim.api.nvim_set_hl(0, "String", { fg = "#007700" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#007700" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#001A8C" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#001A8C" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#001A8C" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#9900AA" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#8C3000" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#001A8C" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#8C3000" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#8C3000" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#8C3000" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#8C0000" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#8C3000", fg = "#FFFFFF", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#000088", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#8C0000" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#885500" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#001A8C" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#3A3A3A" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#000000"
vim.g.terminal_color_1 = "#880000"
vim.g.terminal_color_2 = "#005500"
vim.g.terminal_color_3 = "#885500"
vim.g.terminal_color_4 = "#000088"
vim.g.terminal_color_5 = "#880088"
vim.g.terminal_color_6 = "#008888"
vim.g.terminal_color_7 = "#888888"
vim.g.terminal_color_8 = "#444444"
vim.g.terminal_color_9 = "#8C0000"
vim.g.terminal_color_10 = "#007700"
vim.g.terminal_color_11 = "#001A8C"
vim.g.terminal_color_12 = "#3A3A3A"
vim.g.terminal_color_13 = "#9900AA"
vim.g.terminal_color_14 = "#0077AA"
vim.g.terminal_color_15 = "#FFFFFF"
