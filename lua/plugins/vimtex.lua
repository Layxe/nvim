return {
    'lervag/vimtex',
    lazy = false,
    config = function ()
        -- Enable the LaTeX compiler
        vim.g.vimtex_compiler_method = 'latexmk'

        -- Set the viewer to Zathura
        vim.g.vimtex_view_method = 'zathura'

        -- vim.g.vimtex_view_zathura_options = '-x "nvr --remote-silent +%{line} %{input}" --fork'

        vim.g.vimtex_compiler_latexmk = {
            aux_dir = "./.latexmk/aux",
            out_dir = "./build",
        }

        vim.keymap.set("n", "<C-M-b>", ":VimtexCompile<CR>", { noremap = true, silent = true })
    end,
    keys = {
        { "<localLeader>l", "", desc = "+vimtex" },
    },
}
