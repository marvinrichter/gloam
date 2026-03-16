-- boreal — Neovim colorscheme
-- Generated from boreal.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/boreal.lua
-- then :colorscheme boreal

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "boreal"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#060A10", fg = "#C8D8E8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#182838", fg = "#C8D8E8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#060A10", fg = "#5890A0" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#102030", fg = "#C8D8E8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#18A8C8", fg = "#060A10" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#182838" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#182838" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#5890A0" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#C8D8E8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#060A10" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#182838" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#182838", fg = "#C8D8E8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#060A10", fg = "#5890A0" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#5890A0" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#182838", fg = "#C8D8E8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#102030", fg = "#C8D8E8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#182838" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#5890A0" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#40D0E0", fg = "#060A10" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#18A8C8", fg = "#060A10" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#40D0E0", fg = "#060A10", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#5890A0" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#5890A0" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#182838", fg = "#5890A0", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#060A10", fg = "#5890A0" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#40D0E0", fg = "#060A10" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#5890A0", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#40D0E0" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#40D0E0" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#40D0E0" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#40D0E0" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#40D0E0" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#5890A0" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#C05868" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#C8D8E8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#18A8C8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#18A8C8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#18A8C8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#18A8C8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#18A8C8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#50C8B0" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#50C8B0" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#A8C8E0" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#A8C8E0" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#A8C8E0" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#8888D8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#40D0E0" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#18A8C8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#40D0E0" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#40D0E0" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#40D0E0" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#C05868" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#40D0E0", fg = "#060A10", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#40D0E0", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#C05868" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#88A8C0" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#18A8C8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#5890A0" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0C1218"
vim.g.terminal_color_1 = "#C05868"
vim.g.terminal_color_2 = "#38A890"
vim.g.terminal_color_3 = "#88A8C0"
vim.g.terminal_color_4 = "#4878C0"
vim.g.terminal_color_5 = "#7070C8"
vim.g.terminal_color_6 = "#18A8C8"
vim.g.terminal_color_7 = "#7898A8"
vim.g.terminal_color_8 = "#182838"
vim.g.terminal_color_9 = "#D87888"
vim.g.terminal_color_10 = "#50C8B0"
vim.g.terminal_color_11 = "#A8C8E0"
vim.g.terminal_color_12 = "#5898E0"
vim.g.terminal_color_13 = "#8888D8"
vim.g.terminal_color_14 = "#40D0E0"
vim.g.terminal_color_15 = "#E0EEF8"
