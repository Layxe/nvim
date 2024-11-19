-- return {
--     'romgrk/barbar.nvim',
--     dependencies = {
--         'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
--         'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
--     },
--     init = function()
--         vim.g.barbar_auto_setup = false
--         vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
--         vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
--         vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
--         vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
--         vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
--         vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
--         vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
--         vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
--         vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
--
--         vim.keymap.set('n', 'gt', '<Cmd>BufferNext<CR>')
--         vim.keymap.set('n', 'gT', '<Cmd>BufferPrevious<CR>')
--
--         vim.keymap.set('n', '<A-.>', '<Cmd>BufferMoveNext<CR>')
--         vim.keymap.set('n', '<A-,>', '<Cmd>BufferMovePrevious<CR>')
--
--         vim.keymap.set('n', '<leader>w', ':q<CR>')
--         vim.keymap.set('n', '<leader>W', ':quitall<CR>')
--     end,
--     opts = {
--         animation = true,
--         insert_at_start = true,
--     }
-- }

return {
    "willothy/nvim-cokeline",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "stevearc/resession.nvim"
    },
    init = function()
        require('cokeline').setup()

        vim.keymap.set("n", "gt", "<Plug>(cokeline-focus-next)", {silent = true})
        vim.keymap.set("n", "gT", "<Plug>(cokeline-focus-prev)", {silent = true})
        vim.keymap.set("n", "<leader>bf", "<Plug>(cokeline-pick-focus)")
    end
}
