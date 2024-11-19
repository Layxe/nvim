return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
        require('Comment').setup({
            opleader = {
                block = 'gB'
            },
            toggler = {
                block = "gBc"
            }
        })

        local function toggle_line_comment()
            return vim.v.count == 0
                and '<Plug>(comment_toggle_linewise_current)'
                or '<Plug>(comment_toggle_linewise_count)'
        end

        -- Toggle Ctrl + # to toggle a line comment
        vim.keymap.set('n', '<C-\\>', toggle_line_comment, { expr = true })

        -- Configure Ctrl+# to create a linewise toggle with keeping the selected area
        vim.keymap.set('v', '<C-\\>', '<Plug>(comment_toggle_linewise_visual) gv')
        vim.keymap.set('v', '<C-#>', '<Plug>(comment_toggle_linewise_visual) gv')

        -- Configure Ctrl+ä to do the same for a block comment
        vim.keymap.set('v', '<C-D>', '<Plug>(comment_toggle_blockwise_visual) gv')
        vim.keymap.set('v', '<C-ä>', '<Plug>(comment_toggle_blockwise_visual) gv')
    end
}
