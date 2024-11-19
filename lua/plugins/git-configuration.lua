return {
    {
        'tpope/vim-fugitive',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require('gitsigns').setup({})

            local gs = require('gitsigns')

            local function show_file_history()
                vim.cmd('let @f = expand("%")')
                vim.cmd(':Git log --follow %')
            end

            local function show_total_history()
                vim.cmd('let @f = expand("%")')
                vim.cmd(':Git log')
            end

            local function toggle_deleted()
                gs.toggle_deleted()
            end

            vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>',        {desc = 'Preview hunk'        })
            vim.keymap.set('n', '<leader>gi', ':Gitsigns preview_hunk_inline<CR>', {desc = 'Preview hunk inline' })
            vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>',          {desc = 'Blame line'          })
            vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>',            {desc = 'Diff current changes'})
            vim.keymap.set('n', '<leader>gt', toggle_deleted,                      {desc = "Toggle deleted"      })

            -- Staging keymaps
            vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<cr>',      {desc = 'Stage hunk'     })
            vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', {desc = 'Undo stage hunk'})

            -- History keymaps
            vim.keymap.set('n', '<leader>ghf', show_file_history,  {desc = 'Show file history' })
            vim.keymap.set('n', '<leader>ght', show_total_history, {desc = 'Show total history'})

            -- Show difference to commit, when hovering over a hash
            vim.keymap.set('n', '<leader>ghc', 'viw"gy :Git diff <C-r>g HEAD -- <C-r>f<CR>', {desc = 'Show difference to commit'})
            vim.keymap.set('n', '<leader>ghs', 'viw"gy :Git checkout <C-r>g', {desc = 'Checkout commit under cursor'})
        end
    }
}
