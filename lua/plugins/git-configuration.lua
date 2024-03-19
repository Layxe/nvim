return {
    {
        'tpope/vim-fugitive',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require('gitsigns').setup({})

            vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')
            vim.keymap.set('n', '<leader>gi', ':Gitsigns preview_hunk_inline<CR>')
            vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>')
        end
    }
}
