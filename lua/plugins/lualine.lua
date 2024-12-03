return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local custom_theme = require('lualine.themes.tokyo-city')

        if vim.o.background == "dark" then
            custom_theme = require("lualine.themes.tokyonight")
        end

        require("lualine").setup({
            options = {
                theme = custom_theme
            }
        })
    end
}
