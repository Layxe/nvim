-- My personal colorscheme based on 256-noir.
vim.g.colors_name = 'graybeard'

local COLORS = {
    foreground = "#343b59",
    border = "#e9e9eb",
    background = "#fbfbfd",
    gray =  "#9da0ab",
    gray2 = "#4c505e",

    orange = "#965027",
    green0 = "#485e30",
    red0   = "#942f2f",
    purple = "#5a4a78",
    blue   = "#34548a",

    diffremove = "#e86868",
    diffadd    = "#3f919e",

    selection_background = "#CCE6E1",


    invalid = "#ff00f0",

    terminal_black = "#0f0f14",
    terminal_red = "#8c4351",
    terminal_green = "#33635c",
    terminal_yellow = "#8f5e15",
    terminal_blue = "#34548a",
    terminal_magenta = "#5a4a78",
    terminal_cyan = "#0f4b6e",
    terminal_white = "#828594",
    terminal_brightBlack = "#0f0f14",
    terminal_brightRed = "#8c4351",
    terminal_brightGreen = "#33635c",
    terminal_brightYellow = "#8f5e15",
    terminal_brightBlue = "#34548a",
    terminal_brightMagenta = "#5a4a78",
    terminal_brightCyan = "#0f4b6e",
    terminal_brightWhite = "#828594",
}

COLORS.fg = COLORS.foreground
COLORS.bg = COLORS.background
COLORS.red = COLORS.red0
COLORS.green = COLORS.green0
COLORS.orange = COLORS.orange

return COLORS
