local colors = require('theme/colorscheme')

return {
    "willothy/nvim-cokeline",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "stevearc/resession.nvim"
    },
    init = function()
        if vim.o.background == "light" then
            require('cokeline').setup({
                show_if_buffers_are_at_least = 2,
                default_hl = {
                    bg = function(buffer)
                        if buffer.is_focused then
                            return colors.background
                        end
                        return colors.gray
                    end
                }
            })
        else
            require('cokeline').setup()
        end

        local function close_current_buffer()

            if _G.is_terminal_open then
                vim.api.nvim_input("<Cmd>ToggleTerm<CR>")
                _G.is_terminal_open = false
                return
            end

            local target_buffer = require('cokeline.buffers').get_current()

            if target_buffer == nil then
                return
            end

            target_buffer:delete()
        end

        vim.keymap.set("n", "gt", "<Plug>(cokeline-focus-next)", {silent = true})
        vim.keymap.set("n", "gT", "<Plug>(cokeline-focus-prev)", {silent = true})
        vim.keymap.set("n", "<leader>bf", "<Plug>(cokeline-pick-focus)")

        vim.keymap.set('n', '<leader>q', ':q<CR>')
        vim.keymap.set('n', '<leader>W', ':quitall<CR>')

        vim.keymap.set('n', '<leader>w', close_current_buffer)
        vim.keymap.set('n', '<A-w>',     close_current_buffer)
        vim.keymap.set('i', '<A-w>',     close_current_buffer)
        vim.keymap.set('t', '<A-w>',     close_current_buffer)

        for i = 1,9 do
            local key_comination = string.format("<A-%s>", i)
            local command = string.format("<Plug>(cokeline-focus-%s)", i)
            vim.keymap.set('n', key_comination, command)
        end

    end
}
