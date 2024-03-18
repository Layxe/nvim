-- Identation settings
--------------------------------------------------------------------------------

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("vnoremap < <gv")
vim.cmd("vnoremap > >gv")

vim.cmd("nnoremap > >>")
vim.cmd("nnoremap < <<")

-- Other settings
--------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>vr', "<Cmd>w<CR><Cmd>source %<CR>")

-- vim.cmd("nnoremap <C-w>p
vim.keymap.set('n', '<A-e>', '<C-w>p')
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-j>', '<C-w>j')

-- Set line numbering
vim.cmd("set number")
vim.cmd("set relativenumber")

vim.wo.fillchars='eob: ' -- Disable the ~ symbol for empty buffer
