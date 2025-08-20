return {
    'lervag/vimtex',
    lazy = false,
    config = function ()
        -- Enable the LaTeX compiler
        vim.g.vimtex_compiler_method = 'latexmk'

        -- Set the viewer to Zathura
        vim.g.vimtex_view_method = 'zathura'

        vim.g.vimtex_compiler_latexmk = {
            aux_dir = "./.latexmk/aux",
            out_dir = "./build",
        }
    end,
    keys = {
        { "<localLeader>l", "", desc = "+vimtex" },
    },
}
