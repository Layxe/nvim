-- General settings
-- #################################################################################################

--[[ -------------------------- NeoVim settings --------------------------- ]]--

-- Indentation
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Line numbers
vim.cmd("set number")
vim.cmd("set relativenumber")

 -- Disable the ~ symbol for empty buffer
vim.wo.fillchars='eob: '

-- Render whitespaces and tabs as dots
vim.cmd("set list")
vim.cmd("set listchars=multispace:.,trail:.,tab:->")

-- Set clipboard to system clipboard
vim.cmd('set clipboard=unnamedplus')

-- Disable continuation of comments
vim.cmd('set formatoptions-=cro')

--[[ --------------------------- Addon settings --------------------------- ]]--

local H1_HEADER_SYMBOL = '#'
local H2_HEADER_SYMBOL = '-'

local H1_HEADER_WIDTH = 100
local H2_HEADER_WIDTH = 80

vim.cmd('set cc=100') -- Set column width to 80

-- Keybindings
-- #################################################################################################

vim.g.mapleader = " "

-- Better indentation settings
vim.cmd("vnoremap < <gv")
vim.cmd("vnoremap > >gv")

vim.cmd("nnoremap > >>")
vim.cmd("nnoremap < <<")

-- Set CTRL+S to save
vim.keymap.set('n', '<C-s>', '<Cmd>w<CR>')
vim.keymap.set('x', '<C-s>', '<Cmd>w<CR>')
vim.keymap.set('i', '<C-s>', '<Cmd>w<CR>')

-- Set CTRL+N to remove search highlights
vim.keymap.set('n', '<C-n>', ':nohl<CR>')

-- Set , to @
vim.keymap.set('n', ',', '@')

-- Remove trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

--[[ -------------------- Window movement and handling -------------------- ]]--

-- Window movement using ALT
vim.keymap.set('n', '<A-e>', '<C-w>p')
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-w>', ':q<CR>')

-- Splitting and resizing windows
vim.keymap.set('n', '<leader>sr', '<C-w>v')
vim.keymap.set('n', '<leader>sd', '<C-w>s')
-- Resize windows
vim.keymap.set('n', '<A-u>', '<C-w><') -- Decrease width
vim.keymap.set('n', '<A-i>', '<C-w>>') -- Increase width
vim.keymap.set('n', '<A-n>', '<C-w>-') -- Decrease height
vim.keymap.set('n', '<A-m>', '<C-w>+') -- Increase height

vim.keymap.set('n', '<leader>ss', '<C-w>=') -- Same size for all windows
vim.keymap.set('n', '<leader>S', '<C-w>o') -- Close all other windows

--[[ ------------------ Additional extension keybindings ------------------ ]]--

vim.keymap.set('n', '<leader>b', '<Cmd>TagbarToggle<CR>')

-- Scripts
-- #################################################################################################

local divider = require('scripts.divider')

vim.keymap.set('n', '<A-d>', function()
    divider.insert_divider(H1_HEADER_SYMBOL, H1_HEADER_WIDTH)
end)

vim.keymap.set('i', '<A-d>', function()
    divider.insert_divider(H1_HEADER_SYMBOL, H1_HEADER_WIDTH)
end)

vim.keymap.set('n', '<A-x>', function()
    divider.insert_divider_centered_text(H2_HEADER_SYMBOL, H2_HEADER_WIDTH)
end)

vim.keymap.set('i', '<A-x>', function()
    divider.insert_divider_centered_text(H2_HEADER_SYMBOL, H2_HEADER_WIDTH)
end)
