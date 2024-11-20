return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
        init = function()
            vim.keymap.set('n', '<leader>t', '<Cmd>ToggleTerm<CR>'                )
            vim.keymap.set('n', '<leader>T', '<Cmd>ToggleTerm direction=float<CR>')
            vim.keymap.set('t', '<A-h>',     [[<Cmd>wincmd h<CR>]]                )
            vim.keymap.set('t', '<A-j>',     [[<Cmd>wincmd j<CR>]]                )
            vim.keymap.set('t', '<A-k>',     [[<Cmd>wincmd k<CR>]]                )
            vim.keymap.set('t', '<A-l>',     [[<Cmd>wincmd l<CR>]]                )
            vim.keymap.set('t', 'jk',        [[<C-\><C-n><C-w>]]                  )
            vim.keymap.set('t', '<A-w>',     '<C-d>'                              )
            vim.keymap.set('t', '<Esc>',     [[<C-\><C-n>]]                       )
            vim.keymap.set('t', '<C-u>',     [[<C-\><C-n><C-u>]]                  )
            vim.keymap.set('t', '<C-d>',     [[<C-\><C-n><C-d>]]                  )

            require('toggleterm').setup({ })
        end
    }
}
