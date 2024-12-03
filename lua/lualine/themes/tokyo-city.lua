local colors = require("theme.colorscheme")

local one_dark = {
    inactive = {
        a = {fg = colors.background, bg = colors.foreground, gui = 'bold'},
        b = {fg = colors.foreground, bg = colors.background},
        c = {fg = colors.gray, bg = colors.background},
    },
    normal = {
        a = {fg = colors.fg, bg = colors.fg, gui = 'bold'},
        b = {fg = colors.fg, bg = colors.background},
        c = {fg = colors.fg, bg = colors.background},
    },
    visual = {a = {fg = colors.foreground, bg = colors.terminal_purple, gui = 'bold'}},
    replace = {a = {fg = colors.terminal_red, bg = colors.terminal_red, gui = 'bold'}},
    insert = {a = {fg = colors.background, bg = colors.terminal_green, gui = 'bold'}},
    command = {a = {fg = colors.background, bg = colors.terminal_yellow, gui = 'bold'}},
    terminal = {a = {fg = colors.background, bg = colors.terminal_cyan, gui = 'bold'}},
}

return one_dark
