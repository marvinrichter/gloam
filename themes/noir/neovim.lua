-- noir — Neovim colorscheme
-- Generated from noir.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/noir.lua
-- then :colorscheme noir

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "noir"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0A0A0A", fg = "#E8E0D0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1A1A1A", fg = "#E8E0D0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0A0A0A", fg = "#909090" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#181818", fg = "#E8E0D0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#E89048", fg = "#0A0A0A" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1A1A1A" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#1A1A1A" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#909090" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E8E0D0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0A0A0A" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1A1A1A" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1A1A1A", fg = "#E8E0D0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0A0A0A", fg = "#909090" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#909090" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1A1A1A", fg = "#E8E0D0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#181818", fg = "#E8E0D0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1A1A1A" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#909090" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#E89048", fg = "#0A0A0A" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#E8D080", fg = "#0A0A0A" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#E89048", fg = "#0A0A0A", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#909090" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#909090" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#1A1A1A", fg = "#909090", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0A0A0A", fg = "#909090" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#E89048", fg = "#0A0A0A" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#909090", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#E89048" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#E89048" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#E89048" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#E89048" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#E89048" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#909090" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D05050" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#E8E0D0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#E8D080" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#E8D080" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#E8D080" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#E8D080" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#E8D080" })
  vim.api.nvim_set_hl(0, "String", { fg = "#609850" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#609850" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#E8D080" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#E8D080" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#E8D080" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#A07880" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#E89048" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#E8D080" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#E89048" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#E89048" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#E89048" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D05050" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#E89048", fg = "#0A0A0A", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#A8C0D0", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D05050" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#A09050" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#E8D080" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#909090" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0A0A0A"
vim.g.terminal_color_1 = "#A85050"
vim.g.terminal_color_2 = "#506848"
vim.g.terminal_color_3 = "#A09050"
vim.g.terminal_color_4 = "#484858"
vim.g.terminal_color_5 = "#786068"
vim.g.terminal_color_6 = "#487080"
vim.g.terminal_color_7 = "#A09888"
vim.g.terminal_color_8 = "#1A1A1A"
vim.g.terminal_color_9 = "#D05050"
vim.g.terminal_color_10 = "#609850"
vim.g.terminal_color_11 = "#E8D080"
vim.g.terminal_color_12 = "#909090"
vim.g.terminal_color_13 = "#A07880"
vim.g.terminal_color_14 = "#5898A8"
vim.g.terminal_color_15 = "#E8E0D0"
