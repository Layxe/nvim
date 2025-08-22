-- General settings
-- #################################################################################################

--[[ -------------------------- NeoVim settings --------------------------- ]]--

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Indentation
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Line numbers
vim.cmd("set number")
vim.cmd("set relativenumber")

vim.o.scrolloff = 5 -- Keep 5 lines above/below the cursor

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

vim.keymap.set("v", "Y", ":'<,'>w !clip.exe<CR>", {noremap = true})

--[[ --------------------------- Addon settings --------------------------- ]]--

local H1_HEADER_SYMBOL = '#'
local H2_HEADER_SYMBOL = '-'

local H1_HEADER_WIDTH = 100
local H2_HEADER_WIDTH = 80

vim.opt.colorcolumn = "100"

-- Disable for TeX and BibTeX files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "bib" },
  callback = function()
    vim.opt_local.colorcolumn = ""
  end,
})

-- Keybindings
-- #################################################################################################

-- Map jk to escape
vim.keymap.set('i', 'jk', '<Esc>')

-- Better indentation settings
vim.cmd("vnoremap < <gv")
vim.cmd("vnoremap > >gv")

vim.cmd("nnoremap > >>")
vim.cmd("nnoremap < <<")

-- Set CTRL+S to save
local function save_file()
    vim.api.nvim_command('w')
end

vim.keymap.set('n', '<C-s>', save_file, {silent = true})
vim.keymap.set('x', '<C-s>', save_file, {silent = true})
vim.keymap.set('i', '<C-s>', save_file, {silent = true})

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
    vim.keymap.set(mode, '<A-q>', '<Esc>:q<CR>')
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

--[[ --------------------------- Spellchecking ---------------------------- ]]--

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "tex", "bib", "markdown", "md", "gitcommit", "gitrebase", "txt", "rst", "asciidoc",
    },
    callback = function()
        vim.cmd("setlocal spell spelllang=en")
    end,
})


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
