return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter_config = require("nvim-treesitter.configs")

        treesitter_config.setup({
            ensure_installed    = {"lua", "javascript", "c"},
            highlight           = { enable = true },
            indent              = { enable = true },
            sync_install        = false,
            auto_install        = true,
            disable             = {'latex'},
            additional_vim_regex_highlighting = {'latex', 'markdown'},
        })
    end
}
