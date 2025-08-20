return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "lua_ls"
                },
                automatic_enable = true,
                auto_install = true,
            })

            vim.lsp.config('*', {
                -- Custom settings if needed
            })

            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        runtime = { version = 'Lua 5.1' },
                        diagnostics = {
                            globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each' },
                        },
                    },
                },
            })

            vim.keymap.set("n", "gh",         vim.lsp.buf.hover,       {desc = 'Show hover'      })
            vim.keymap.set("n", "gd",         vim.lsp.buf.definition,  {desc = 'Go to definition'})
            vim.keymap.set("n", "<leader>ra", vim.lsp.buf.references,  {desc = 'Find references' })
            vim.keymap.set("n", "<leader>da", vim.lsp.buf.code_action, {desc = 'Code action'     })

            -- Renames the current symbol
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, {desc = 'Rename symbol'})
            vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {desc = 'Rename symbol'})
        end,
    }
}
