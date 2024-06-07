--
-- For live_grep to work run:
--   sudo apt install ripgrep
--

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<C-F>', builtin.live_grep, {})
            vim.keymap.set('n', '<C-l>', builtin.lsp_references, {})
            vim.keymap.set('n', '<Leader><C-x>', builtin.quickfix, {})
            vim.keymap.set('n', '<Leader><C-g>', builtin.git_commits, {})
            vim.keymap.set('n', '<Leader><C-s>', builtin.git_status, {})
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require('telescope').setup({
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown {}
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}

