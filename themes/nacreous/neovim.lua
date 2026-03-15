-- nacreous — Neovim colorscheme
-- Generated from nacreous.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/nacreous.lua
-- then :colorscheme nacreous

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "nacreous"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0B0C10", fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1A1C28", fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0B0C10", fg = "#8888A8" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#1A1C28", fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#E890C8", fg = "#0B0C10" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1A1C28" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#1A1C28" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#8888A8" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E4E8F0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0B0C10" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1A1C28" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1A1C28", fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0B0C10", fg = "#8888A8" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#8888A8" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1A1C28", fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1A1C28", fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1A1C28" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#8888A8" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#E890C8", fg = "#0B0C10" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#78D8C8", fg = "#0B0C10" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#E890C8", fg = "#0B0C10", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#8888A8" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#8888A8" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#1A1C28", fg = "#8888A8", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0B0C10", fg = "#8888A8" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#E890C8", fg = "#0B0C10" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#8888A8", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#E890C8" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#E890C8" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#E890C8" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#E890C8" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#E890C8" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#8888A8" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#E06868" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#E4E8F0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#78D8C8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#78D8C8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#78D8C8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#78D8C8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#78D8C8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#78D8C8" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#78D8C8" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#90D880" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#90D880" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#90D880" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#E890C8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#E890C8" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#78D8C8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#E890C8" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#E890C8" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#E890C8" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#E06868" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#E890C8", fg = "#0B0C10", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#78D8C8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E06868" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#8898A8" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#78D8C8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#8888A8" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0B0C10"
vim.g.terminal_color_1 = "#8A4A60"
vim.g.terminal_color_2 = "#40A880"
vim.g.terminal_color_3 = "#8898A8"
vim.g.terminal_color_4 = "#5050A8"
vim.g.terminal_color_5 = "#9850A8"
vim.g.terminal_color_6 = "#40A0A8"
vim.g.terminal_color_7 = "#9090B0"
vim.g.terminal_color_8 = "#1A1C28"
vim.g.terminal_color_9 = "#E06868"
vim.g.terminal_color_10 = "#78D8C8"
vim.g.terminal_color_11 = "#90D880"
vim.g.terminal_color_12 = "#8888A8"
vim.g.terminal_color_13 = "#E890C8"
vim.g.terminal_color_14 = "#58C8E8"
vim.g.terminal_color_15 = "#E4E8F0"
