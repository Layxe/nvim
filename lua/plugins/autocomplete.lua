return {
    {
       "hrsh7th/cmp-nvim-lsp"
    },
    {
        'hrsh7th/cmp-buffer'
    },
    {
        'hrsh7th/cmp-path'
    },
    {
        'hrsh7th/cmp-cmdline'
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.3.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        }
    },
    {
        "onsails/lspkind.nvim"
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

            require('luasnip.loaders.from_vscode').lazy_load()

            local cmp = require('cmp')
            local luasnip = require('luasnip')

            local function cmp_map(...)
                return cmp.mapping(..., { "i", "c" })
            end

            local custom_select_next = {
                i = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
                c = function()
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "tn", false)
                    end
                end,
            }

            local custom_select_prev = {
                i = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end,
                c = function()
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "tn", false)
                    end
                end,
            }

            local mappings = {
                ["<C-u>"] = cmp_map(cmp.mapping.scroll_docs(-4)),
                ["<C-d>"] = cmp_map(cmp.mapping.scroll_docs(4)),
                ["<C-e>"] = {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
                ["<CR>"] = cmp_map(cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = false,
                })),
                ["<C-Space>"] = {
                    i = function()
                        if cmp.visible() then
                            cmp.abort()
                        else
                            cmp.complete()
                        end
                    end,
                    c = function()
                        if cmp.visible() then
                            cmp.close()
                        else
                            cmp.complete()
                        end
                    end,
                },
                -- ["<Tab>"] = custom_select_next,
                -- ["<S-Tab>"] = custom_select_prev,
                ["<C-j>"] = custom_select_next,
                ["<C-k>"] = custom_select_prev,
                ["<Up>"] = custom_select_prev,
                ["<Down>"] = custom_select_next
            }

            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,noselect"
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                sources = {
                    {name = 'path'},
                    {name = 'nvim_lsp', keyword_length = 1},
                    {name = 'buffer', keyword_length = 3},
                    {name = 'luasnip', keyword_length = 2},
                },
                window = {
                    documentation = cmp.config.window.bordered()
                },
                formatting = {
                    fields = {'menu', 'abbr', 'kind'},
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = 'λ',
                            luasnip = '⋗',
                            buffer = 'Ω',
                            path = '🖫',
                        }

                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },

                mapping = mappings,
            })

            cmp.setup.cmdline(':', {
                mapping = mappings,
                sources = cmp.config.sources({
                    { name = 'path' } },
                    { { name = 'cmdline' } }
                )
            })

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = mappings,
                sources = {
                    { name = 'buffer' }
                }
            })
        end,
    },
}
