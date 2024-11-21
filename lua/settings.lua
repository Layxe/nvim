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
-- Hide the | symbol for vertical splits
vim.o.fillchars='vert: '

-- Render whitespaces and tabs as dots
vim.cmd("set list")
vim.cmd("set listchars=multispace:.,trail:.,tab:->")

-- Set clipboard to system clipboard
vim.cmd('set clipboard=unnamedplus')

-- Disable continuation of comments
vim.cmd('set formatoptions-=cro')

-- Make cursor change for windows terminal
vim.cmd("set t_SI=\"<Esc>[6 q\"")
vim.cmd("set t_SR=\"<Esc>[3 q\"")
vim.cmd("set t_EI=\"<Esc>[2 q\"")

vim.keymap.set("n", "<leader>.", "<C-o>")
vim.keymap.set("n", "<leader>-", "<C-i>")

--[[ --------------------------- Addon settings --------------------------- ]]--

local H1_HEADER_SYMBOL = '#'
local H2_HEADER_SYMBOL = '-'

local H1_HEADER_WIDTH = 100
local H2_HEADER_WIDTH = 80

vim.cmd('set cc=100') -- Set column width to 100

-- Keybindings
-- #################################################################################################

vim.g.mapleader = " "

-- Map jk to escape
vim.keymap.set('i', 'jk', '<Esc>')

-- Better indentation settings
vim.cmd("vnoremap < <gv")
vim.cmd("vnoremap > >gv")

vim.cmd("nnoremap > >>")
vim.cmd("nnoremap < <<")

-- Set CTRL+S to save
vim.keymap.set('n', '<C-s>', ':w<CR>', {silent = true})
vim.keymap.set('x', '<C-s>', ':w<CR>', {silent = true})
vim.keymap.set('i', '<C-s>', ':w<CR>', {silent = true})

-- Set CTRL+N to remove search highlights
vim.keymap.set('n', '<C-n>', ':nohl<CR>')

-- Set , to @
vim.keymap.set('n', ',', '@')

-- Remove trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

--[[ ----------- Remap d to delete without copying to clipboard ----------- ]]--

vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('v', 'd', '"_d')

-- Keep copying behavior for dd
vim.keymap.set('n', 'dd', 'Ydd', { noremap = true})

--[[ ----------- Remap c to change without copying to clipboard ----------- ]]--

vim.keymap.set('n', 'c', '"_c')
vim.keymap.set('v', 'c', '"_c')

--[[ -------------------- Window movement and handling -------------------- ]]--

-- Window movement using ALT

local function define_window_movements(mode)
    vim.keymap.set(mode, '<A-e>', '<C-w>p')
    vim.keymap.set(mode, '<A-l>', '<C-w>l')
    vim.keymap.set(mode, '<A-h>', '<C-w>h')
    vim.keymap.set(mode, '<A-k>', '<C-w>k')
    vim.keymap.set(mode, '<A-j>', '<C-w>j')
    vim.keymap.set(mode, '<A-w>', ':q<CR>')
end

define_window_movements('n')
define_window_movements('t')
define_window_movements('i')


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

-- Disable tagbar for now
-- vim.keymap.set('n', '<leader>b', '<Cmd>TagbarToggle<CR>')

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
