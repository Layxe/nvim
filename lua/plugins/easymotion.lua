return {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
        keys = "etovxqdygfblzhckisuran"
    },
    init = function ()
        local hop = require('hop')
        hop.setup({
            quit_key = "<SPC>"
        })

        vim.keymap.set("n", "<leader><leader>f", ":HopChar1AC<CR>")
        vim.keymap.set("n", "<leader><leader>F", ":HopChar1BC<CR>")
        vim.keymap.set("n", "<leader><leader>W", ":HopWordAC<CR>")
        vim.keymap.set("n", "<leader><leader>B", ":HopWordBC<CR>")
        vim.keymap.set("n", "<leader><leader>g", ":HopLine<CR>")
        vim.keymap.set("n", "<leader><leader>/", ":HopPattern<CR>")
    end
}
