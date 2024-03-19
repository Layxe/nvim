local opts = {
    style           = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style     = "day", -- The theme is used when the background is set to light
    transparent     = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
    styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    },
    sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = true,
    dim_inactive = false, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    ---@param colors ColorScheme
    on_colors = function(colors) end,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(hl, c)
        hl.TelescopeNormal       = { bg = "none", fg = "none", }
        hl.TelescopeBorder       = { bg = "none", fg = "none", }
        hl.TelescopePromptNormal = { bg = "none",              }
        hl.TelescopePromptBorder = { bg = "none", fg = "none", }
        hl.TelescopePromptTitle  = { bg = "none", fg = "none", }
        hl.TelescopePreviewTitle = { bg = "none", fg = "none", }
        hl.TelescopeResultsTitle = { bg = "none", fg = "none", }
    end,
}

return { 
    "folke/tokyonight.nvim", 
    lazy = false, 
    priority = 1000, 
    opts = {},
    config = function()
        local config = require("tokyonight").setup(opts)
        vim.cmd.colorscheme "tokyonight"  
    end
}
