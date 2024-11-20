return {
    "andrewferrier/wrapping.nvim",
    config = function()
        require("wrapping").setup()
    end,
    init = function ()

        vim.keymap.set('n', '<A-z>', ':set wrap!<CR>', {noremap = true, silent = true})
    end
}
