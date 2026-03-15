-- petrichor — Neovim colorscheme
-- Generated from petrichor.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/petrichor.lua
-- then :colorscheme petrichor

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "petrichor"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0A0C0A", fg = "#D8DCCC" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#181C18", fg = "#D8DCCC" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0A0C0A", fg = "#78806A" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#182018", fg = "#D8DCCC" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#48B8E8", fg = "#0A0C0A" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#181C18" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#181C18" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#78806A" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D8DCCC", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0A0C0A" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#181C18" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#181C18", fg = "#D8DCCC" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0A0C0A", fg = "#78806A" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#78806A" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#181C18", fg = "#D8DCCC" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#182018", fg = "#D8DCCC" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#181C18" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#78806A" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#48B8E8", fg = "#0A0C0A" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#78C888", fg = "#0A0C0A" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#48B8E8", fg = "#0A0C0A", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#78806A" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#78806A" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#181C18", fg = "#78806A", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0A0C0A", fg = "#78806A" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#48B8E8", fg = "#0A0C0A" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#78806A", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#48B8E8" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#48B8E8" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#48B8E8" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#48B8E8" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#48B8E8" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#78806A" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D05858" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#D8DCCC" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#78C888" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#78C888" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#78C888" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#78C888" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#78C888" })
  vim.api.nvim_set_hl(0, "String", { fg = "#78C888" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#78C888" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#B0C070" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#B0C070" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#B0C070" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#48B8E8" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#48B8E8" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#78C888" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#48B8E8" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#48B8E8" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#48B8E8" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D05858" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#48B8E8", fg = "#0A0C0A", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#78C888", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D05858" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#908040" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#78C888" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#78806A" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0A0C0A"
vim.g.terminal_color_1 = "#804040"
vim.g.terminal_color_2 = "#408040"
vim.g.terminal_color_3 = "#908040"
vim.g.terminal_color_4 = "#384878"
vim.g.terminal_color_5 = "#684878"
vim.g.terminal_color_6 = "#388888"
vim.g.terminal_color_7 = "#788070"
vim.g.terminal_color_8 = "#181C18"
vim.g.terminal_color_9 = "#D05858"
vim.g.terminal_color_10 = "#78C888"
vim.g.terminal_color_11 = "#B0C070"
vim.g.terminal_color_12 = "#78806A"
vim.g.terminal_color_13 = "#48B8E8"
vim.g.terminal_color_14 = "#60C8A0"
vim.g.terminal_color_15 = "#D8DCCC"
