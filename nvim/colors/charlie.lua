vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

local background = vim.opt.background:get()
print(background)

-- Color palette
local palette
if background == "light" then
  palette = {
    bg = "#fafafa", -- Off-white background
    fg = "#3a3a3a", -- Soft black
    cursor = "#5f5f5f", -- Medium gray
    comment = "#8a8a8a", -- Muted gray
    selection = "#e0e0e0", -- Light gray
    red = "#e3716e", -- Dusty red
    orange = "#d19a66", -- Clay orange
    error = "#e3716e",
    yellow = "#c5a453", -- Mustard yellow
    green = "#56b6c2", -- Teal
    blue = "#65afef", -- Soft blue

    purple = "#6A1B9A", -- Rich royal purple (replacing lavender)
  }
else
  vim.g.colors_name = "subtle-dark"
  palette = {
    bg = "#052c31", -- Dark background
    fg = "#86E08F", -- Light gray text
    cursor = "#b0b0b0", -- Lighter gray for cursor
    comment = "#59b300", -- Dim gray for comments
    selection = "#4e4e4e", -- Darker selection highlight
    red = "#fafafa", -- Dusty red
    orange = "#91cfc2", -- Clay orange
    yellow = "#c5a453", -- Mustard yellow
    error = "#4d6b6a",
    green = "#56b6c2", -- Teal
    blue = "#A9A28E", -- Soft blue
    purple = "#A9A28E", -- Rich royal purple
  }
end

-- Basic UI
vim.api.nvim_set_hl(0, "Normal", { fg = palette.fg, bg = palette.bg })
vim.api.nvim_set_hl(0, "CursorLine", { bg = palette.selection })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = palette.selection })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = palette.selection })
vim.api.nvim_set_hl(0, "LineNr", { fg = palette.comment })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.cursor, bold = true })
vim.api.nvim_set_hl(0, "VertSplit", { fg = palette.selection, bg = palette.bg })
vim.api.nvim_set_hl(0, "MatchParen", { fg = palette.blue, underline = true })

-- Syntax highlighting
vim.api.nvim_set_hl(0, "Comment", { fg = palette.comment, italic = true })
vim.api.nvim_set_hl(0, "Constant", { fg = palette.orange })
vim.api.nvim_set_hl(0, "String", { fg = palette.green })
vim.api.nvim_set_hl(0, "Identifier", { fg = palette.blue })
vim.api.nvim_set_hl(0, "Function", { fg = palette.purple })
vim.api.nvim_set_hl(0, "Statement", { fg = palette.red })
vim.api.nvim_set_hl(0, "PreProc", { fg = palette.yellow })
vim.api.nvim_set_hl(0, "Type", { fg = palette.blue })
vim.api.nvim_set_hl(0, "Special", { fg = palette.purple })
vim.api.nvim_set_hl(0, "Underlined", { underline = true })
vim.api.nvim_set_hl(0, "Error", { fg = palette.red, reverse = true })
vim.api.nvim_set_hl(0, "Todo", { fg = palette.yellow, bold = true, bg = "#fff9e6" })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = palette.error })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = palette.error })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = palette.error })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = palette.error })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = palette.error })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = palette.error })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { sp = palette.error })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { sp = palette.error })

-- Virtual text
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = palette.error })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = palette.error })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = palette.error })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = palette.error })

-- Gutter signs
vim.api.nvim_set_hl(0, "SignColumn", { bg = palette.bg })
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = palette.red, bg = palette.bg })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = palette.orange, bg = palette.bg })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = palette.blue, bg = palette.bg })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = palette.green, bg = palette.bg })

-- Status line
vim.api.nvim_set_hl(0, "StatusLine", { fg = palette.fg, bg = palette.selection })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = palette.comment, bg = palette.selection })

-- Visual mode
vim.api.nvim_set_hl(0, "Visual", { bg = palette.selection })
vim.api.nvim_set_hl(0, "VisualNOS", { bg = palette.selection })

-- Search
vim.api.nvim_set_hl(0, "Search", { bg = "#fff3b0" })
vim.api.nvim_set_hl(0, "IncSearch", { bg = "#fff8d6", bold = true })

-- Popup menu
vim.api.nvim_set_hl(0, "Pmenu", { fg = palette.fg, bg = palette.bg })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = palette.selection })

-- Folding
vim.api.nvim_set_hl(0, "Folded", { fg = palette.comment, bg = palette.selection })
vim.api.nvim_set_hl(0, "FoldColumn", { fg = palette.comment, bg = palette.bg })

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
vim.api.nvim_set_hl(0, "@function", { fg = palette.purple })
vim.api.nvim_set_hl(0, "@variable", { fg = palette.blue })
vim.api.nvim_set_hl(0, "@function.builtin", { fg = palette.blue })
vim.api.nvim_set_hl(0, "@parameter", { fg = palette.orange })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = palette.fg })

-- Floating windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg = palette.bg })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = palette.comment, bg = palette.bg })

vim.api.nvim_set_hl(0, "WarningMsg", { fg = palette.orange })
vim.api.nvim_set_hl(0, "ErrorMsg", { fg = palette.red })
