return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    init = function()
        vim.keymap.set('n', '<leader>t', '<Cmd>ToggleTerm<CR>')
        vim.keymap.set('n', '<leader><leader>t', '<Cmd>ToggleTerm direction=float<CR>')
        vim.keymap.set('t', '<A-h>', [[<Cmd>wincmd h<CR>]])
        vim.keymap.set('t', '<A-j>', [[<Cmd>wincmd j<CR>]])
        vim.keymap.set('t', '<A-k>', [[<Cmd>wincmd k<CR>]])
        vim.keymap.set('t', '<A-l>', [[<Cmd>wincmd l<CR>]])
        vim.keymap.set('t', 'jk', [[<C-\><C-n><C-w>]]) -- Escape into normal mode
        vim.keymap.set('t', '<A-w>', '<C-d>')

        require('toggleterm').setup({ })
    end
}
