-- Additional configuration:
--   - For tagbar run: sudo apt -y install exuberant-ctags

require("settings")

vim.o.background = "light"

-- Lazy package manager
---------------------------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins", opts)
require("theme")

-- Disable auto-commenting at the end of all settings
vim.cmd('set formatoptions-=cro')
