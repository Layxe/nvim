return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local treesitter_config = require("nvim-treesitter.configs")

            treesitter_config.setup({
                ensure_installed    = {"lua", "comment"},
                highlight           = {
                    enable                            = true ,
                    disable                           = {'latex'},
                    additional_vim_regex_highlighting = {'latex', 'markdown'},
                },
                indent              = { enable = true },
                sync_install        = false,
                auto_install        = true,
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        node_incremental = "<CR>",
                        node_decremental = "<BS>",
                    },
                }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("nvim-treesitter.configs").setup({
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                multiwindow = false, -- Enable multiwindow support.
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            })
        end
    }
}
