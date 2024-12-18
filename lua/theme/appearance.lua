local utils = require('theme.utils')
local colors = require('theme.colorscheme')

vim.cmd [[highlight clear]]
vim.cmd [[set background=light]]
-- vim.cmd [[set cursorline]]
vim.cmd [[syntax reset]]

vim.g.terminal_color_0  = colors.terminal_black
vim.g.terminal_color_1  = colors.terminal_red
vim.g.terminal_color_2  = colors.terminal_green
vim.g.terminal_color_3  = colors.terminal_yellow
vim.g.terminal_color_4  = colors.terminal_blue
vim.g.terminal_color_5  = colors.terminal_purple
vim.g.terminal_color_6  = colors.terminal_cyan
vim.g.terminal_color_7  = colors.foreground
vim.g.terminal_color_8  = colors.terminal_brightBlack
vim.g.terminal_color_9  = colors.terminal_brightRed
vim.g.terminal_color_10 = colors.terminal_brightGreen
vim.g.terminal_color_11 = colors.terminal_brightYellow
vim.g.terminal_color_12 = colors.terminal_brightBlue
vim.g.terminal_color_13 = colors.terminal_brightPurple
vim.g.terminal_color_14 = colors.terminal_brightCyan
vim.g.terminal_color_15 = colors.foreground


utils.map_highlight { 'Normal', fg = colors.foreground, bg = colors.background }
utils.map_highlight { 'Number', fg = colors.orange }
utils.map_highlight { 'Keyword', fg = colors.purple }
utils.map_highlight { 'Function', fg = colors.blue }
utils.map_highlight { 'Constant', fg = colors.purple }
utils.map_highlight { 'String', fg = colors.green0 }
utils.map_highlight { 'Comment', fg = colors.gray }
utils.map_highlight { 'Error', fg = colors.red0 }
utils.map_highlight { 'ErrorMsg', fg = colors.red0 }
utils.map_highlight { 'Search', fg = colors.foreground, bg = colors.selection_background }
utils.map_highlight { 'IncSearch', fg = colors.foreground, bg = colors.selection_background }
utils.map_highlight { 'DiffChange', fg = colors.diffremove }
utils.map_highlight { 'DiffText', fg = colors.foreground, mod = 'bold' }
utils.map_highlight { 'SignColumn', fg = colors.red0 }
utils.map_highlight { 'SpellBad', fg = colors.gray9, mod = 'undercurl' }
utils.map_highlight { 'SpellCap', fg = colors.gray9 }
utils.map_highlight { 'SpellRare', fg = colors.red0 }
utils.map_highlight { 'WildMenu', fg = colors.gray3 }
utils.map_highlight { 'Pmenu', fg = colors.gray9 }
utils.map_highlight { 'PmenuThumb', fg = colors.gray0 }
utils.map_highlight { 'SpecialKey', fg = colors.black }
utils.map_highlight { 'MatchParen', fg = colors.orange, mod = 'bold' }
utils.map_highlight { 'CursorLine', bg = colors.background }
utils.map_highlight { 'CursorLineNr', fg = colors.gray, mod = 'bold' }
utils.map_highlight { 'LineNr', fg = colors.gray2 }
utils.map_highlight { 'StatusLine', fg = colors.gray5, mod = 'bold,reverse' }
utils.map_highlight { 'StatusLineNC', fg = colors.gray2, mod = 'reverse' }
utils.map_highlight { 'TermCursor', fg = colors.gray, mod = 'reverse' }
utils.map_highlight { 'VertSplit', fg = colors.gray4 }

utils.map_highlight { 'BufferCurrentSign', fg = colors.white, mod = 'bold' }
utils.map_highlight { 'BufferInactiveSign', fg = colors.gray4 }
utils.map_highlight { 'BufferCurrent', fg = colors.white }
utils.map_highlight { 'BufferInactive', fg = colors.gray4 }
utils.map_highlight { 'BufferCurrentIcon', fg = colors.white, mod = 'bold' }
utils.map_highlight { 'BufferVisibleIcon', fg = colors.white, mod = 'bold' }
utils.map_highlight { 'BufferCurrentIndex', fg = colors.brown2 }

utils.map_highlight { 'DiagnosticWarn', fg = colors.terminal_yellow }
utils.map_highlight { 'DiagnosticWarnUnderline', mod = 'underline', sp = colors.terminal_yellow }
utils.map_highlight { 'DiagnosticError', fg = colors.red0 }
utils.map_highlight { 'DiagnosticErrorUnderline', mod = 'underline', sp = colors.red0 }

utils.map_highlight { 'Added', fg = colors.green0 }
utils.map_highlight { 'Changed', fg = colors.yellow0 }
utils.map_highlight { 'Removed', fg = colors.red0 }

utils.map_highlight { 'NvimTreeNormal', bg = colors.background }

utils.link_highlight('Visual', 'Search')
utils.link_highlight('Boolean', 'Number')
utils.link_highlight('Delimiter', 'Normal')
utils.link_highlight('Identifier', 'Normal')
utils.link_highlight('Title', 'Normal')
utils.link_highlight('Debug', 'Normal')
utils.link_highlight('Exception', 'Normal')
utils.link_highlight('FoldColumn', 'Normal')
utils.link_highlight('ModeMsg', 'Normal')
utils.link_highlight('MoreMsg', 'Normal')
utils.link_highlight('Question', 'Normal')
utils.link_highlight('Macro', 'Function')
utils.link_highlight('Conditional', 'Keyword')
utils.link_highlight('Statement', 'Keyword')
utils.link_highlight('Operator', 'Keyword')
utils.link_highlight('Structure', 'Keyword')
utils.link_highlight('Include', 'Keyword')
utils.link_highlight('Type', 'Keyword')
utils.link_highlight('Typedef', 'Keyword')
utils.link_highlight('Todo', 'Keyword')
utils.link_highlight('Label', 'Keyword')
utils.link_highlight('Define', 'Keyword')
utils.link_highlight('DiffAdd', 'Keyword')
utils.link_highlight('diffAdded', 'Keyword')
utils.link_highlight('diffCommon', 'Keyword')
utils.link_highlight('Directory', 'Keyword')
utils.link_highlight('PreCondit', 'Keyword')
utils.link_highlight('PreProc', 'Keyword')
utils.link_highlight('Repeat', 'Keyword')
utils.link_highlight('Special', 'Keyword')
utils.link_highlight('SpecialChar', 'Keyword')
utils.link_highlight('StorageClass', 'Keyword')
utils.link_highlight('SpecialComment', 'String')
utils.link_highlight('Character', 'Number')
utils.link_highlight('Float', 'Number')
utils.link_highlight('Tag', 'Number')
utils.link_highlight('Folded', 'Number')
utils.link_highlight('WarningMsg', 'Number')
utils.link_highlight('iCursor', 'SpecialKey')
utils.link_highlight('SpellLocal', 'SpellCap')
utils.link_highlight('NonText', 'Comment')
utils.link_highlight('DiffDelete', 'Comment')
utils.link_highlight('diffRemoved', 'Comment')
utils.link_highlight('PmenuSbar', 'Visual')
utils.link_highlight('PmenuSel', 'Visual')
utils.link_highlight('VisualNOS', 'Visual')
utils.link_highlight('Cursor', 'StatusLine')
utils.link_highlight('Underlined', 'SpellRare')
utils.link_highlight('rstEmphasis', 'SpellRare')
utils.link_highlight('diffChanged', 'DiffChange')

-- C Additional Syntax Highlighting
-- #################################################################################################

utils.map_highlight { '@lsp.typemod.macro.globalScope.c', fg = colors.blue }
