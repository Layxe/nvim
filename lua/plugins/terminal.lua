_G.is_terminal_open = false

local SWITCH_DELAY = 100

-- /home/alex/projects/zephyrproject/poc-platform-redesign-firmware/app/src/ProToF/DeviceManager/ComponentLists/ComponentLists_CPUModem_MU24_101_HART.h:131:5:
-- /home/alex/.bashrc

return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
        init = function()
            vim.keymap.set('n', '<leader>t', '<Cmd>ToggleTerm<CR>'                )
            vim.keymap.set('n', '<leader>T', '<Cmd>ToggleTerm direction=float<CR>')
            vim.keymap.set('t', '<A-h>',     [[<Cmd>wincmd h<CR>]]                )
            vim.keymap.set('t', '<A-j>',     [[<Cmd>wincmd j<CR>]]                )
            vim.keymap.set('t', '<A-k>',     [[<Cmd>wincmd k<CR>]]                )
            vim.keymap.set('t', '<A-l>',     [[<Cmd>wincmd l<CR>]]                )
            vim.keymap.set('t', 'jk',        [[<C-\><C-n><C-w>]]                  )
            vim.keymap.set('t', '<A-q>',     '<C-d>'                              )
            vim.keymap.set('t', '<Esc>',     [[<C-\><C-n>]]                       )
            vim.keymap.set('t', '<C-u>',     [[<C-\><C-n><C-u>]]                  )
            vim.keymap.set('t', '<C-d>',     [[<C-\><C-n><C-d>]]                  )

            require('toggleterm').setup({
                on_open = function ()
                    _G.is_terminal_open = true
                    vim.api.nvim_command("set cc=")
                end,
                on_close = function ()
                    _G.is_terminal_open = false
                end,
            })

            vim.keymap.set('n', 'gf', function ()
                local complete_word = vim.fn.expand("<cWORD>")

                local path, line, column = string.match(complete_word, "(.-):(%d+):(%d+):")

                if path == nil then
                    path, line = string.match(complete_word, "(.-):(%d+)")

                    if path == nil then
                        path = complete_word
                    end
                end

                if _G.is_terminal_open then
                    vim.api.nvim_command("ToggleTerm")
                    _G.is_terminal_open = false
                end

                vim.api.nvim_command("find " .. path)

                vim.defer_fn(function ()
                    if line ~= nil then
                        vim.api.nvim_input(line .. "G")
                    end

                    if column ~= nil then
                        vim.api.nvim_input(column .. "|")
                    end
                end, SWITCH_DELAY)
            end)
        end
    }
}
