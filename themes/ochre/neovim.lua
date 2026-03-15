-- ochre — Neovim colorscheme
-- Generated from ochre.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/ochre.lua
-- then :colorscheme ochre

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "light"
vim.g.colors_name = "ochre"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#F2E4D0", fg = "#220E08" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#4A3020", fg = "#220E08" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#F2E4D0", fg = "#705040" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#D8C4A8", fg = "#220E08" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#1A6068", fg = "#F2E4D0" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#4A3020" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#4A3020" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#705040" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#220E08", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#F2E4D0" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#4A3020" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#4A3020", fg = "#220E08" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#F2E4D0", fg = "#705040" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#705040" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#4A3020", fg = "#220E08" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#D8C4A8", fg = "#220E08" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#4A3020" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#705040" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#1A6068", fg = "#F2E4D0" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#722018", fg = "#F2E4D0" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#1A6068", fg = "#F2E4D0", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#705040" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#705040" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#4A3020", fg = "#705040", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#F2E4D0", fg = "#705040" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#1A6068", fg = "#F2E4D0" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#705040", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#705040" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#7A1828" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#220E08" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#722018" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#722018" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#722018" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#722018" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#722018" })
  vim.api.nvim_set_hl(0, "String", { fg = "#2A6030" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#2A6030" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#722018" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#722018" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#722018" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#722018" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#1A6068" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#7A1828" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#1A6068", fg = "#F2E4D0", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#1A6068", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#7A1828" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#5A3A10" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#722018" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#705040" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#140804"
vim.g.terminal_color_1 = "#621818"
vim.g.terminal_color_2 = "#1A4C20"
vim.g.terminal_color_3 = "#5A3A10"
vim.g.terminal_color_4 = "#183060"
vim.g.terminal_color_5 = "#482050"
vim.g.terminal_color_6 = "#185058"
vim.g.terminal_color_7 = "#68503A"
vim.g.terminal_color_8 = "#4A3020"
vim.g.terminal_color_9 = "#7A1828"
vim.g.terminal_color_10 = "#2A6030"
vim.g.terminal_color_11 = "#722018"
vim.g.terminal_color_12 = "#705040"
vim.g.terminal_color_13 = "#1A6068"
vim.g.terminal_color_14 = "#2A7878"
vim.g.terminal_color_15 = "#F5EAD8"
