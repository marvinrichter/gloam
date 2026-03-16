-- cinder — Neovim colorscheme
-- Generated from cinder.json — do not edit by hand
--
-- Install: copy to ~/.config/nvim/colors/cinder.lua
-- then :colorscheme cinder

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.opt.background = "dark"
vim.g.colors_name = "cinder"

-- ── Base groups ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Normal", { bg = "#0D0B09", fg = "#E4DCD0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282218", fg = "#E4DCD0" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0D0B09", fg = "#988070" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#251E14", fg = "#E4DCD0" })
  vim.api.nvim_set_hl(0, "Cursor", { bg = "#B08858", fg = "#0D0B09" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282218" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#282218" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#988070" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E4DCD0", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0D0B09" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#282218" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#282218", fg = "#E4DCD0" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0D0B09", fg = "#988070" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#988070" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "#282218", fg = "#E4DCD0" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#251E14", fg = "#E4DCD0" })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#282218" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#988070" })
  vim.api.nvim_set_hl(0, "Search", { bg = "#B08858", fg = "#0D0B09" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = "#C0A070", fg = "#0D0B09" })
  vim.api.nvim_set_hl(0, "MatchParen", { bg = "#B08858", fg = "#0D0B09", bold = true })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#988070" })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#988070" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "#282218", fg = "#988070", italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#0D0B09", fg = "#988070" })
  vim.api.nvim_set_hl(0, "WildMenu", { bg = "#B08858", fg = "#0D0B09" })

-- ── Syntax groups ───────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "Comment", { fg = "#988070", italic = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#B08858" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#B08858" })
  vim.api.nvim_set_hl(0, "Conditional", { fg = "#B08858" })
  vim.api.nvim_set_hl(0, "Repeat", { fg = "#B08858" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#B08858" })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#988070" })
  vim.api.nvim_set_hl(0, "Exception", { fg = "#D85040" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#E4DCD0" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#C0A070" })
  vim.api.nvim_set_hl(0, "Type", { fg = "#C0A070" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#C0A070" })
  vim.api.nvim_set_hl(0, "Structure", { fg = "#C0A070" })
  vim.api.nvim_set_hl(0, "Typedef", { fg = "#C0A070" })
  vim.api.nvim_set_hl(0, "String", { fg = "#90A078" })
  vim.api.nvim_set_hl(0, "Character", { fg = "#90A078" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#C0A070" })
  vim.api.nvim_set_hl(0, "Float", { fg = "#C0A070" })
  vim.api.nvim_set_hl(0, "Boolean", { fg = "#C0A070" })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#B09890" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#B08858" })
  vim.api.nvim_set_hl(0, "PreProc", { fg = "#C0A070" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#B08858" })
  vim.api.nvim_set_hl(0, "Define", { fg = "#B08858" })
  vim.api.nvim_set_hl(0, "Macro", { fg = "#B08858" })
  vim.api.nvim_set_hl(0, "Error", { fg = "#D85040" })
  vim.api.nvim_set_hl(0, "Todo", { bg = "#B08858", fg = "#0D0B09", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#D8C090", underline = true })

-- ── Diagnostic ──────────────────────────────────────────────────────────────
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#D85040" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#A07840" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#C0A070" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#988070" })

-- ── Terminal colors ─────────────────────────────────────────────────────────
vim.g.terminal_color_0 = "#0D0B09"
vim.g.terminal_color_1 = "#A84038"
vim.g.terminal_color_2 = "#708060"
vim.g.terminal_color_3 = "#A07840"
vim.g.terminal_color_4 = "#787060"
vim.g.terminal_color_5 = "#907870"
vim.g.terminal_color_6 = "#708880"
vim.g.terminal_color_7 = "#C0B8A8"
vim.g.terminal_color_8 = "#282218"
vim.g.terminal_color_9 = "#D85040"
vim.g.terminal_color_10 = "#90A078"
vim.g.terminal_color_11 = "#C0A070"
vim.g.terminal_color_12 = "#988070"
vim.g.terminal_color_13 = "#B09890"
vim.g.terminal_color_14 = "#90A898"
vim.g.terminal_color_15 = "#E4DCD0"
