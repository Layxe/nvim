return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
        require('Comment').setup()

        -- Configure Ctrl+# to create a linewise toggle with keeping the selected area
        vim.keymap.set('v', '<C-\\>', '<Plug>(comment_toggle_linewise_visual) gv')
        vim.keymap.set('v', '<C-#>', '<Plug>(comment_toggle_linewise_visual) gv')

        -- Configure Ctrl+ä to do the same for a block comment
        vim.keymap.set('v', '<C-D>', '<Plug>(comment_toggle_blockwise_visual) gv')
        vim.keymap.set('v', '<C-ä>', '<Plug>(comment_toggle_blockwise_visual) gv')
    end
}
