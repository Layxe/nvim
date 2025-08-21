return {
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
            end,
        })
    end
}
