return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local custom_theme = require('lualine.themes.tokyonight')
        custom_theme.normal.c.bg = 'None'
        custom_theme.inactive.c.bg = 'None'

        require("lualine").setup({
            options = {
                theme = custom_theme
            }
        })
    end
}
