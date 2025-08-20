-- Additional configuration:
--   - For tagbar run: sudo apt -y install exuberant-ctags

require("settings")

-- Lazy package manager
-- #################################################################################################

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

-- Theme and plugin setup
-- #################################################################################################

local hour = tonumber(os.date("%H"))

if hour >= 7 and hour < 19 then
    vim.o.background = "light"
else
    -- Print a message
    vim.o.background = "dark"
end

-- Setup theme and plugins
-- #################################################################################################

local opts = {}
require("lazy").setup("plugins", opts)
require("theme")


-- Finalize theme setup
-- #################################################################################################

if vim.o.background == "dark" then
    vim.cmd("colorscheme tokyonight")
else
    SetupLightColorscheme()
end

function ToggleBackground()
    if vim.o.background == "dark" then
        SetupLightColorscheme()
        vim.o.background = "light"
    else
        vim.o.background = "dark"
        vim.cmd("colorscheme tokyonight")
    end
    SetupLuaLine()
end

-- Map to a key in normal mode
vim.api.nvim_set_keymap('n', '<F5>', ':lua ToggleBackground()<CR>', { noremap = true, silent = true })


-- Overwrite default settings
-- #################################################################################################

-- Disable auto-commenting at the end of all settings
vim.cmd('set formatoptions-=cro')
