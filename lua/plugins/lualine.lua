-- Constants and Helpers
-- #################################################################################################

local EMPTY_CONFIG = {
    options = {
        component_separators = "", section_separators = "", theme = {}
    },
    sections = {
        lualine_a = {}, lualine_b = {}, lualine_y = {}, lualine_z = {},
        lualine_c = {}, lualine_x = {},
    },
    inactive_sections = {
        lualine_a = {}, lualine_b = {}, lualine_y = {}, lualine_z = {},
        lualine_c = {}, lualine_x = {},
    },
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    buffer_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) == 1
    end,
    screen_width = function(w)
        return function()
            return vim.fn.winwidth(0) > w
        end
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
    diff_mode = function()
        return vim.o.diff == true
    end,
}

local function insert_left(component)
  table.insert(custom_config.sections.lualine_c, component)
end

local function insert_right(component)
  table.insert(custom_config.sections.lualine_x, component)
end

-- Lualine Components
-- #################################################################################################

local function insert_lua_line_components(colors)
    insert_left({
        "branch",
        icon = "",
        color = { fg = colors.fg, bg = nil, gui = "bold" },
    })
    insert_left({
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
        diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.orange },
            removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
    })

    insert_left({
        function()
            return "%="
        end,
    })

    insert_right({
        "encoding",
    })

    insert_right({
        "filetype",
    })
end

-- Setup and Colors
-- #################################################################################################

function SetupLuaLine()
    local custom_theme = {}
    local colors = {}

    -- Ensure our configuration is empty
    custom_config = vim.deepcopy(EMPTY_CONFIG)

    if vim.o.background == "dark" then
        colors = require("tokyonight.colors.storm")
        custom_theme =  {
            normal = {
                c = {fg = colors.fg, bg = colors.background},
            },
        }
    else
        colors = require("theme.colorscheme")
        custom_theme = require('lualine.themes.tokyo-city')
    end

    custom_config.options.theme = custom_theme

    insert_lua_line_components(colors)

    -- Make the background transparent
    vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
        callback = function()
            vim.cmd([[
              highlight! StatusLine   guibg=NONE ctermbg=NONE
              highlight! StatusLineNC guibg=NONE ctermbg=NONE
          ]])
        end,
    })

    require("lualine").setup(custom_config)
end

return {
    "nvim-lualine/lualine.nvim",
    config = function()
        SetupLuaLine()
    end
}
