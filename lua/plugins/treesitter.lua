local function is_windows()
  return vim.loop.os_uname().sysname:match("Windows") ~= nil
end


return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()

        if is_windows() then
            return
        end

        local parsers = {
            "bash","comment","c","cpp","css","diff","dockerfile","elixir",
            "git_config","gitcommit","gitignore","go","html","http",
            "javascript","jsdoc","json","json5","lua","make","markdown",
            "markdown_inline","python","regex","rst","rust","scss",
            "ssh_config","sql","terraform","typst","toml","tsx",
            "typescript","vim","vimdoc","yaml",
        }

        require('nvim-treesitter.configs').setup {
            ensure_installed = parsers,
            highlight = {
                enable = true,
            },
        }

        local patterns = {}
        for _, parser in ipairs(parsers) do
            local parser_patterns = vim.treesitter.language.get_filetypes(parser) or {}
            for _, pp in pairs(parser_patterns) do
                table.insert(patterns, pp)
            end
        end

        vim.api.nvim_create_autocmd('FileType', {
            pattern = patterns,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
