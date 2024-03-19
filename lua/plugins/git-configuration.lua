return {
    {
        'tpope/vim-fugitive',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require('gitsigns').setup({})
            local gs = require('gitsigns')

            vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')
            vim.keymap.set('n', '<leader>gi', ':Gitsigns preview_hunk_inline<CR>')
            vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>')
            vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>')
            vim.keymap.set('n', '<leader>gt', function()
                gs.toggle_deleted()
            end)

            -- Staging keymaps
            vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<cr>')
            vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>')

            -- History keymaps
            vim.keymap.set('n', '<leader>ghf', function()
                -- Copy file name to clipboard
                vim.cmd('let @f = expand("%")')
                vim.cmd(':Git log --follow %')
            end)

            vim.keymap.set('n', '<leader>ght', function ()
                vim.cmd('let @f = expand("%")')
                vim.cmd(':Git log')
            end)

            vim.keymap.set('n', '<leader>ghc', 'viw"gy :Git diff <C-r>g HEAD -- <C-r>f')
        end
    }
}
