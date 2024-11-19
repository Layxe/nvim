return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    init = function ()
        require("harpoon").setup()
        vim.keymap.set("n", "<leader>ml", function()
            require("harpoon.ui").toggle_quick_menu()
        end)
        vim.keymap.set("n", "<leader>ma", function()
            require("harpoon.mark").add_file()
        end)
    end
}
