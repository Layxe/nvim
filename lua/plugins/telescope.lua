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
            vim.keymap.set('n', '<Leader><C-b>', builtin.git_branches, {})
            vim.keymap.set('n', '<Leader><C-s>', builtin.git_status, {})
            vim.keymap.set('n', '<Leader><C-S>', builtin.git_stash, {})
            vim.keymap.set('n', '<Leader><C-t>', builtin.treesitter, {})

            local telescope = require('telescope')

            telescope.setup({
                defaults = {
                    layout_strategy = 'flex',
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        prompt_position = 'top',
                        preview_cutoff = 120,
                        horizontal = {
                            preview_width = 0.6
                        }
                    },
                    sorting_strategy = 'ascending',
                    mappings = {
                        i = {
                            ["<C-j>"] = require('telescope.actions').move_selection_next,
                            ["<C-k>"] = require('telescope.actions').move_selection_previous,
                            ["<C-u>"] = require('telescope.actions').preview_scrolling_up,
                            ["<C-d>"] = require('telescope.actions').preview_scrolling_down,
                            ["<C-q>"] = require('telescope.actions').close,
                            ["<C-h>"] = require('telescope.actions').close
                        }
                    }
                }
            })
        end,
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

