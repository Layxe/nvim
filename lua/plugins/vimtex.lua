local function is_wsl()
  local uname = vim.loop.os_uname().release:lower()
  return uname:find("microsoft") ~= nil or uname:find("wsl") ~= nil
end

return {
    'lervag/vimtex',
    lazy = false,
    config = function ()
        -- Enable the LaTeX compiler
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_quickfix_open_on_warning = 0

        if not is_wsl() then
            -- Set the viewer to Zathura
            vim.g.vimtex_view_general_viewer = 'zathura'
        else
            -- Set the viewer to Okular for WSL
            vim.g.vimtex_view_method = 'sioyek'
        end

        vim.g.vimtex_compiler_latexmk = {
            aux_dir = "./.latexmk/aux",
            out_dir = "./build",
            continuous = 0,
        }

        vim.keymap.set("n", "<C-M-b>", ":VimtexCompile<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>f", ":VimtexView<CR>", { noremap = true, silent = true })
    end,
    keys = {
        { "<localLeader>l", "", desc = "+vimtex" },
    },
}
