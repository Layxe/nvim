return {
    "jakemason/ouroboros",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    init = function ()
        require("ouroboros").setup({
            extension_preferences_table = {
                c = {h = 2, hpp = 1},
                h = {c = 2, cpp = 1},
                cpp = {hpp = 2, h = 1},
                hpp = {cpp = 1, c = 2},
            },
            -- if this is true and the matching file is already open in a pane, we'll
            -- switch to that pane instead of opening it in the current buffer
            switch_to_open_pane_if_possible = false,
        })

        vim.keymap.set('n', "<A-o>", ":Ouroboros<CR>")
        vim.keymap.set('n', "<A-s>", ":vsplit | Ouroboros<CR>")
    end
}
