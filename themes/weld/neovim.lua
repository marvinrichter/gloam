-- weld — Neovim colorscheme
-- Generated from weld.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/weld.lua
-- then :colorscheme weld

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "weld"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0E0E08", fg = "#E8E0C0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#202018", fg = "#E8E0C0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0E0E08", fg = "#909060" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#1C1C10", fg = "#E8E0C0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#E8B040", fg = "#0E0E08" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#202018" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#202018" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#909060" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E8E0C0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0E0E08" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#202018" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#202018", fg = "#E8E0C0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0E0E08", fg = "#909060" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#909060" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#202018", fg = "#E8E0C0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1C1C10", fg = "#E8E0C0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#202018" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#909060" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#E8B040", fg = "#0E0E08" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#98B838", fg = "#0E0E08" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#E8B040", fg = "#0E0E08", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#909060" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#909060" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#202018", fg = "#909060", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0E0E08", fg = "#909060" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#E8B040", fg = "#0E0E08" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#909060", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#909060" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D06060" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#E8E0C0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#98B838" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#98B838" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#98B838" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#98B838" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#98B838" })
  vim.api.nvim_set_hl(0, "String", { fg = "#90C058" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#90C058" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#98B838" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#98B838" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#98B838" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#A888C0" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#98B838" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D06060" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#E8B040", fg = "#0E0E08", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#78C890", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D06060" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#B09040" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#98B838" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#909060" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0E0E08"
vim.g.terminal_color_1 = "#A86050"
vim.g.terminal_color_2 = "#7A9848"
vim.g.terminal_color_3 = "#B09040"
vim.g.terminal_color_4 = "#5A7870"
vim.g.terminal_color_5 = "#8870A0"
vim.g.terminal_color_6 = "#4A8870"
vim.g.terminal_color_7 = "#9A9870"
vim.g.terminal_color_8 = "#202018"
vim.g.terminal_color_9 = "#D06060"
vim.g.terminal_color_10 = "#90C058"
vim.g.terminal_color_11 = "#98B838"
vim.g.terminal_color_12 = "#909060"
vim.g.terminal_color_13 = "#A888C0"
vim.g.terminal_color_14 = "#60A880"
vim.g.terminal_color_15 = "#E8E0C0"
