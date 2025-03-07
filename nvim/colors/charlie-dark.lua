vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

-- Color palette
vim.g.colors_name = "subtle-dark"
local palette = {
  background = "#052c31",
  color2 = "#86E08F",
  color3 = "#b0b0b0",
  comment = "#59b300",
  selection = "#4e4e4e",
  color4 = "#fafafa",
  color5 = "#91cfc2",
  color7 = "#c5a453",
  color8 = "#4d6b6a",
  color9 = "#56b6c2",
  color10 = "#B7B59D",
  color11 = "#B7B59D",
}

-- Basic UI
vim.api.nvim_set_hl(0, "Normal", { fg = palette.color2, bg = palette.background })
vim.api.nvim_set_hl(0, "CursorLine", { bg = palette.selection })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = palette.selection })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = palette.selection })
vim.api.nvim_set_hl(0, "LineNr", { fg = palette.comment })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.color3, bold = true })
vim.api.nvim_set_hl(0, "VertSplit", { fg = palette.selection, bg = palette.background })
vim.api.nvim_set_hl(0, "MatchParen", { fg = palette.color10, underline = true })

-- Syntax highlighting
vim.api.nvim_set_hl(0, "Comment", { fg = palette.comment, italic = true })
vim.api.nvim_set_hl(0, "Constant", { fg = palette.color5 })
vim.api.nvim_set_hl(0, "String", { fg = palette.color9 })
vim.api.nvim_set_hl(0, "Identifier", { fg = palette.color10 })
vim.api.nvim_set_hl(0, "Function", { fg = palette.color11 })
vim.api.nvim_set_hl(0, "Statement", { fg = palette.color4 })
vim.api.nvim_set_hl(0, "PreProc", { fg = palette.color7 })
vim.api.nvim_set_hl(0, "Type", { fg = palette.color10 })
vim.api.nvim_set_hl(0, "Special", { fg = palette.color11 })
vim.api.nvim_set_hl(0, "Underlined", { underline = true })
vim.api.nvim_set_hl(0, "Error", { fg = palette.color4, reverse = true })
vim.api.nvim_set_hl(0, "Todo", { fg = palette.color7, bold = true, bg = "#fff9e6" })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = palette.color8 })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = palette.color8 })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = palette.color8 })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = palette.color8 })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = palette.color8 })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = palette.color8 })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { sp = palette.color8 })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { sp = palette.color8 })

-- Virtual text
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = palette.color8 })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = palette.color8 })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = palette.color8 })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = palette.color8 })

-- Gutter signs
vim.api.nvim_set_hl(0, "SignColumn", { bg = palette.background })
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = palette.color4, bg = palette.background })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = palette.color5, bg = palette.background })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = palette.color10, bg = palette.background })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = palette.color9, bg = palette.background })

-- Status line
vim.api.nvim_set_hl(0, "StatusLine", { fg = palette.color2, bg = palette.selection })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = palette.comment, bg = palette.selection })

-- Visual mode
vim.api.nvim_set_hl(0, "Visual", { bg = palette.selection })
vim.api.nvim_set_hl(0, "VisualNOS", { bg = palette.selection })

-- Search
vim.api.nvim_set_hl(0, "Search", { bg = "#fff3b0" })
vim.api.nvim_set_hl(0, "IncSearch", { bg = "#fff8d6", bold = true })

-- Popup menu
vim.api.nvim_set_hl(0, "Pmenu", { fg = palette.color2, bg = palette.background })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = palette.selection })

-- Folding
vim.api.nvim_set_hl(0, "Folded", { fg = palette.comment, bg = palette.selection })
vim.api.nvim_set_hl(0, "FoldColumn", { fg = palette.comment, bg = palette.background })

-- Special characters
vim.api.nvim_set_hl(0, "NonText", { fg = palette.selection })
vim.api.nvim_set_hl(0, "SpecialKey", { fg = palette.selection })
vim.api.nvim_set_hl(0, "Whitespace", { fg = palette.selection })

-- Diff
vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#e6ffec" })
vim.api.nvim_set_hl(0, "DiffChange", { bg = "#fff9e6" })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#ffecec" })
vim.api.nvim_set_hl(0, "DiffText", { bg = "#fff3bf" })

-- Treesitter (optional but recommended)
vim.api.nvim_set_hl(0, "@function", { fg = palette.color11 })
vim.api.nvim_set_hl(0, "@variable", { fg = palette.color10 })
vim.api.nvim_set_hl(0, "@function.builtin", { fg = palette.color10 })
vim.api.nvim_set_hl(0, "@parameter", { fg = palette.color5 })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = palette.color2 })

-- Floating windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg = palette.background })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = palette.comment, bg = palette.background })

vim.api.nvim_set_hl(0, "WarningMsg", { fg = palette.color5 })
vim.api.nvim_set_hl(0, "ErrorMsg", { fg = palette.color4 })
