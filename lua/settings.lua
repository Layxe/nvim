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

vim.keymap.set('n', '<C-s>', '<Cmd>w<CR>')
vim.keymap.set('x', '<C-s>', '<Cmd>w<CR>')
vim.keymap.set('i', '<C-s>', '<Cmd>w<CR>')

-- vim.cmd("nnoremap <C-w>p
vim.keymap.set('n', '<A-e>', '<C-w>p')
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-w>', ':q<CR>')

-- Set line numbering
vim.cmd("set number")
vim.cmd("set relativenumber")

vim.wo.fillchars='eob: ' -- Disable the ~ symbol for empty buffer

vim.cmd("set list")
vim.cmd("set listchars=multispace:.,trail:.,tab:>-")

vim.keymap.set('n', '<C-n>', ':nohl<CR>')
vim.keymap.set('n', ',', '@')

-- Set clipboard to system clipboard
vim.cmd('set clipboard=unnamedplus')

-- Disable continuation of comments
vim.cmd('set formatoptions-=cro')

-- Extension keybindings
--------------------------------------------------------------------------------

vim.keymap.set('n', '<leader>b', '<Cmd>TagbarToggle<CR>')

-- Scripts
--------------------------------------------------------------------------------

local divider = require('scripts.divider')

vim.keymap.set('n', '<A-d>', function()
    divider.insert_divider('#', 100)
end)

vim.keymap.set('i', '<A-d>', function()
    divider.insert_divider('#', 100)
end)

vim.keymap.set('n', '<A-x>', function()
    divider.insert_divider_centered_text('-', 80)
end)

vim.keymap.set('i', '<A-x>', function()
    divider.insert_divider_centered_text('-', 80)
end)

-- Remove trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
