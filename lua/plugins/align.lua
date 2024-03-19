local NS = { noremap = true, silent = false }

return {
    'Vonr/align.nvim',
    branch = "v2",
    lazy = true,
    init = function()
        vim.keymap.set(
            'x',
            '<leader>a',
            function()
                require'align'.align_to_char({
                    length = 1,
                })
            end,
            NS
        )

        vim.keymap.set(
            'x', '<leader>A',
            function()
                require'align'.align_to_string({
                    regex = true
                })
            end,
            NS
        )

        vim.keymap.set(
            'n', '<leader>a',
            function()
                vim.cmd('normal! vip')
                require'align'.align_to_string({ regex = true })
            end,
        NS)
    end
}
