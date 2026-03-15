-- verdure — Neovim colorscheme
-- Generated from verdure.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/verdure.lua
-- then :colorscheme verdure

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "verdure"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#080E08", fg = "#D0E0C0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#203020", fg = "#D0E0C0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#080E08", fg = "#709048" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#182818", fg = "#D0E0C0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#60C848", fg = "#080E08" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#203020" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#203020" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#709048" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D0E0C0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#080E08" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#203020" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#203020", fg = "#D0E0C0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#080E08", fg = "#709048" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#709048" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#203020", fg = "#D0E0C0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#182818", fg = "#D0E0C0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#203020" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#709048" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#90E060", fg = "#080E08" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#60C848", fg = "#080E08" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#90E060", fg = "#080E08", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#709048" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#709048" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#203020", fg = "#709048", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#080E08", fg = "#709048" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#90E060", fg = "#080E08" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#709048", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#90E060" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#90E060" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#90E060" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#90E060" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#90E060" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#709048" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D06060" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#D0E0C0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#60C848" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#60C848" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#60C848" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#60C848" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#60C848" })
  vim.api.nvim_set_hl(0, "String", { fg = "#80E058" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#80E058" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#E0D050" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#E0D050" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#E0D050" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#B890E0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#90E060" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#60C848" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#90E060" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#90E060" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#90E060" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D06060" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#90E060", fg = "#080E08", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#90E060", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D06060" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#C0B840" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#60C848" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#709048" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0C140C"
vim.g.terminal_color_1 = "#D06060"
vim.g.terminal_color_2 = "#60C848"
vim.g.terminal_color_3 = "#C0B840"
vim.g.terminal_color_4 = "#6090A8"
vim.g.terminal_color_5 = "#9870C0"
vim.g.terminal_color_6 = "#50C0A0"
vim.g.terminal_color_7 = "#90A878"
vim.g.terminal_color_8 = "#203020"
vim.g.terminal_color_9 = "#E08070"
vim.g.terminal_color_10 = "#80E058"
vim.g.terminal_color_11 = "#E0D050"
vim.g.terminal_color_12 = "#80B0C8"
vim.g.terminal_color_13 = "#B890E0"
vim.g.terminal_color_14 = "#70D8B8"
vim.g.terminal_color_15 = "#E0F0D0"
