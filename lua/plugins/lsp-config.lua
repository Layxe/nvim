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
        lazy = false,
        opts = {
            auto_install = true,
            ensure_installed = {
                'clangd',
                'lua_ls',
                'ruff_lsp'
            }
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lsp_configuration = require("lspconfig")

            lsp_configuration.clangd.setup({
                capabilities = capabilities
            })

            lsp_configuration.html.setup({
                capabilities = capabilities
            })
            lsp_configuration.lua_ls.setup({
                capabilities = capabilities
            })

            lsp_configuration.ruff_lsp.setup({
                capabilities = capabilities
            })

            vim.keymap.set("n", "gh",         vim.lsp.buf.hover,       {desc = 'Show hover'      })
            vim.keymap.set("n", "gd",         vim.lsp.buf.definition,  {desc = 'Go to definition'})
            vim.keymap.set("n", "<leader>ra", vim.lsp.buf.references,  {desc = 'Find references' })
            vim.keymap.set("n", "<leader>da", vim.lsp.buf.code_action, {desc = 'Code action'     })

            -- Renames the current symbol
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, {desc = 'Rename symbol'})
            vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {desc = 'Rename symbol'})
        end,
    },
}
