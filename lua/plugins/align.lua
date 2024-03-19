local NS = { noremap = true, silent = true }

return {
    'Vonr/align.nvim',
    branch = "v2",
    lazy = true,
    init = function()
        vim.keymap.set(
            'x',
            '<leader>a',
            function()
                require'align'.align_to_string({
                    regex = false
                })
            end,
            NS
        )
        vim.keymap.set(
            'n', '<leader>a',
            function()
                vim.cmd('normal! vip')
                require'align'.align_to_string({ regex = false })
            end,
        NS)
    end
}
