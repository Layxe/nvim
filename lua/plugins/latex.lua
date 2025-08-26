local COLORS = require("theme.colorscheme")

local function is_wsl()
  local uname = vim.loop.os_uname().release:lower()
  return uname:find("microsoft") ~= nil or uname:find("wsl") ~= nil
end

return {
    -- Wrapping
    -- #############################################################################################
{
    "andrewferrier/wrapping.nvim",
    config = function()
        require("wrapping").setup()
    end,
    init = function ()
        vim.keymap.set('n', '<A-z>', ':set wrap!<CR>', {noremap = true, silent = true})

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "tex", "bib" },
            callback = function()
                require("wrapping").soft_wrap_mode()  -- enable wrapping the plugin’s way
                vim.cmd("set colorcolumn=-1") -- disable colorcolumn
            end,
        })
    end
    },
    -- Illuminate
    -- #############################################################################################
{
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            -- default configuration
            require('illuminate').configure({
                -- providers: provider used to get references in the buffer, ordered by priority
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                -- delay: delay in milliseconds
                delay = 100,
                -- filetype_overrides: filetype specific overrides.
                -- The keys are strings to represent the filetype while the values are tables that
                -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
                filetype_overrides = {
                    tex = {
                        -- disable regex provider for tex files
                        providers = {'treesitter', 'regex'},
                    },
                },
                -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
                filetypes_denylist = {
                    'dirbuf',
                    'dirvish',
                    'fugitive',
                },
                -- under_cursor: whether or not to illuminate under the cursor
                under_cursor = true,
                -- large_file_cutoff: number of lines at which to use large_file_config
                -- The `under_cursor` option is disabled when this cutoff is hit
                large_file_cutoff = 10000,
                -- large_file_config: config to use for large files (based on large_file_cutoff).
                -- Supports the same keys passed to .configure
                -- If nil, vim-illuminate will be disabled for large files.
                large_file_overrides = nil,
                -- min_count_to_highlight: minimum number of matches required to perform highlighting
                min_count_to_highlight = 1,
                -- should_enable: a callback that overrides all other settings to
                -- enable/disable illumination. This will be called a lot so don't do
                -- anything expensive in it.
                should_enable = function(bufnr) return true end,
                -- case_insensitive_regex: sets regex case sensitivity
                case_insensitive_regex = true,
                -- disable_keymaps: disable default keymaps
                disable_keymaps = false,
            })

            local illuminate_enabled = false

            function ToggleIlluminate()
              illuminate_enabled = not illuminate_enabled
              if illuminate_enabled then
                -- Re-enable illuminate
                vim.cmd("IlluminateResume")
              else
                -- Disable and clear highlights
                vim.cmd("IlluminatePause")
              end
            end

            vim.keymap.set("n", "<leader>i", ToggleIlluminate, { noremap = true, silent = true, desc = "Toggle Illuminate" })
            vim.cmd("hi IlluminatedWordText guifg=" .. COLORS.bg .. " gui=bold" .. " guibg=" .. COLORS.red0)
            vim.cmd("IlluminatePause")

        end,
    },
    -- VimTeX
    -- #############################################################################################
{
        'lervag/vimtex',
        lazy = false,
        config = function ()
            -- Enable the LaTeX compiler
            vim.g.vimtex_compiler_method = 'latexmk'
            vim.g.vimtex_quickfix_open_on_warning = 0

            if not is_wsl() then
                -- Set the viewer to Zathura
                vim.g.vimtex_view_general_viewer = 'zathura'
            else
                vim.g.vimtex_view_method = 'sioyek'
                vim.g.vimtex_view_sioyek_exe = 'sioyek.exe'
            end

            vim.g.vimtex_compiler_latexmk = {
                aux_dir = "./.latexmk/aux",
                out_dir = "./build",
                continuous = 0,
                options = {
                    "-shell-escape",
                    "-verbose",
                    "-file-line-error",
                    "-synctex=1",
                    "-interaction=nonstopmode",
                    "-pdflua"
                },
            }

            vim.keymap.set("n", "<C-M-b>", ":VimtexCompile<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>f", ":VimtexView<CR>", { noremap = true, silent = true })
        end,
        keys = {
            { "<localLeader>l", "", desc = "+vimtex" },
        },
    }
}
