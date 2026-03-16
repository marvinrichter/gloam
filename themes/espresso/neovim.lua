-- espresso — Neovim colorscheme
-- Generated from espresso.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/espresso.lua
-- then :colorscheme espresso

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "espresso"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0D0906", fg = "#F0E4D0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2A1E14", fg = "#F0E4D0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0D0906", fg = "#A07860" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#2A1810", fg = "#F0E4D0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#E89840", fg = "#0D0906" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2A1E14" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#2A1E14" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#A07860" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F0E4D0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0D0906" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#2A1E14" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#2A1E14", fg = "#F0E4D0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0D0906", fg = "#A07860" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#A07860" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#2A1E14", fg = "#F0E4D0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2A1810", fg = "#F0E4D0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#2A1E14" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#A07860" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#E89840", fg = "#0D0906" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#C87030", fg = "#0D0906" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#E89840", fg = "#0D0906", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#A07860" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#A07860" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#2A1E14", fg = "#A07860", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0D0906", fg = "#A07860" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#E89840", fg = "#0D0906" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#A07860", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#E89840" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#E89840" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#E89840" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#E89840" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#E89840" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#A07860" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#DC4030" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#F0E4D0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#C87030" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#C87030" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#C87030" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#C87030" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#C87030" })
  vim.api.nvim_set_hl(0, "String", { fg = "#70A850" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#70A850" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#C87030" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#C87030" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#C87030" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#C09080" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#E89840" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#C87030" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#E89840" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#E89840" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#E89840" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#DC4030" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#E89840", fg = "#0D0906", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#D8B890", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#DC4030" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#A06020" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#C87030" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#A07860" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0D0906"
vim.g.terminal_color_1 = "#A83028"
vim.g.terminal_color_2 = "#588040"
vim.g.terminal_color_3 = "#A06020"
vim.g.terminal_color_4 = "#607890"
vim.g.terminal_color_5 = "#886050"
vim.g.terminal_color_6 = "#507870"
vim.g.terminal_color_7 = "#C0A880"
vim.g.terminal_color_8 = "#2A1E14"
vim.g.terminal_color_9 = "#DC4030"
vim.g.terminal_color_10 = "#70A850"
vim.g.terminal_color_11 = "#C87030"
vim.g.terminal_color_12 = "#A07860"
vim.g.terminal_color_13 = "#C09080"
vim.g.terminal_color_14 = "#78A898"
vim.g.terminal_color_15 = "#F0E4D0"
