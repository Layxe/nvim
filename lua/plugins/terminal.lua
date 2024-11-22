local is_terminal_open = false

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
            vim.keymap.set('t', '<A-q>',     '<C-d>'                              )
            vim.keymap.set('t', '<A-w>',     '<Cmd>ToggleTerm<CR>'                )
            vim.keymap.set('t', '<Esc>',     [[<C-\><C-n>]]                       )
            vim.keymap.set('t', '<C-u>',     [[<C-\><C-n><C-u>]]                  )
            vim.keymap.set('t', '<C-d>',     [[<C-\><C-n><C-d>]]                  )

            require('toggleterm').setup({
                on_open = function ()
                    is_terminal_open = true
                end,
                on_close = function ()
                    is_terminal_open = false
                end,
            })

            vim.keymap.set('n', 'gf', function ()
                -- Yank word under cursor into register f
                vim.api.nvim_input("\"fyiW")

                local complete_word  = vim.fn.getreg('f')

                local path, line = string.match(complete_word, "(.-):(%d+)")

                if path == nil then
                    path = complete_word
                end

                if is_terminal_open then
                    -- Close terminal buffer
                    vim.api.nvim_input("<A-w>")
                end

                vim.api.nvim_input(":edit " .. path .. "<CR>")

                if line ~= nil then
                    vim.api.nvim_input(line .. "G")
                end
            end)
        end
    }
}
