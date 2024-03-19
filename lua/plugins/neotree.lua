return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    config = function()
        vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')
        vim.keymap.set('n', '<A-f>', '<Cmd>Neotree focus<CR>')

        require("neo-tree").setup({
            close_if_last_window = true
        })
    end
}
