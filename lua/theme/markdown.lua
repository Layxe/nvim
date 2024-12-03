local utils = require('theme.utils')
local colors = require('theme.colorscheme')

vim.api.nvim_create_augroup('MarkdownHighlight', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
        utils.map_highlight { '@markup.heading', bg = colors.green1}
        utils.map_highlight { '@markup.strong', mod = 'bold' }
        utils.map_highlight { '@markup.bold', mod = 'bold' }
        utils.map_highlight { '@markup.italic', mod = 'italic' }
        utils.map_highlight { '@markup.link', fg = colors.gray4, mod = 'underline' }
    end,
    group = 'MarkdownHighlight',
})
