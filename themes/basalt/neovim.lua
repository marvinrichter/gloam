-- basalt — Neovim colorscheme
-- Generated from basalt.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/basalt.lua
-- then :colorscheme basalt

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "basalt"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#090A0B", fg = "#E0E4E8" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#181A20", fg = "#E0E4E8" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#090A0B", fg = "#7888A0" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#181A20", fg = "#E0E4E8" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#E8B040", fg = "#090A0B" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#181A20" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#181A20" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#7888A0" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E0E4E8", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#090A0B" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#181A20" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#181A20", fg = "#E0E4E8" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#090A0B", fg = "#7888A0" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7888A0" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#181A20", fg = "#E0E4E8" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#181A20", fg = "#E0E4E8" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#181A20" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#7888A0" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#E8B040", fg = "#090A0B" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#40D8D8", fg = "#090A0B" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#E8B040", fg = "#090A0B", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#7888A0" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#7888A0" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#181A20", fg = "#7888A0", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#090A0B", fg = "#7888A0" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#E8B040", fg = "#090A0B" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#7888A0", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#7888A0" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#E05858" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#E0E4E8" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#40D8D8" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#40D8D8" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#40D8D8" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#40D8D8" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#40D8D8" })
  vim.api.nvim_set_hl(0, "String", { fg = "#40D8D8" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#40D8D8" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#C8B050" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#C8B050" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#C8B050" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#607888" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#40D8D8" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#E8B040" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#E05858" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#E8B040", fg = "#090A0B", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#40D8D8", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E05858" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#988040" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#40D8D8" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#7888A0" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#090A0B"
vim.g.terminal_color_1 = "#804848"
vim.g.terminal_color_2 = "#408870"
vim.g.terminal_color_3 = "#988040"
vim.g.terminal_color_4 = "#386890"
vim.g.terminal_color_5 = "#7A4898"
vim.g.terminal_color_6 = "#3890A0"
vim.g.terminal_color_7 = "#7888A0"
vim.g.terminal_color_8 = "#181A20"
vim.g.terminal_color_9 = "#E05858"
vim.g.terminal_color_10 = "#40D8D8"
vim.g.terminal_color_11 = "#C8B050"
vim.g.terminal_color_12 = "#7888A0"
vim.g.terminal_color_13 = "#607888"
vim.g.terminal_color_14 = "#58C0D8"
vim.g.terminal_color_15 = "#E0E4E8"
