local utils = require('theme.utils')
local colors = require('theme.colorscheme')

-- Theme settings for indentation guides.
utils.map_highlight { 'IblIndent', fg = colors.gray1 }
utils.map_highlight { 'IblScope', fg = colors.brown2 }
utils.map_highlight { 'IblWhitespace' }
