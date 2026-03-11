return {
  "nvim-treesitter",
  beforeAll = function()
    _G.Paq.add({
      {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
      },
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
      },
    })
  end,
  load = function(name)
    vim.cmd.packadd(name)
    vim.cmd.packadd("nvim-treesitter-textobjects")
  end,
  after = function()
    -- Note that some queries have dependencies, but if a dependency is
    -- deleted, it won't automatically be reinstalled
    require("nvim-treesitter").install({
      -- Bundled parsers
      "c",
      "lua",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
      "bash",
      "comment",
      "diff",
      "python",
      "todotxt",
      "vhdl",
      "xml",
    })

    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
      },
    })

    local function map(lhs, obj)
      vim.keymap.set({ "x", "o" }, lhs, function()
        require("nvim-treesitter-textobjects.select").select_textobject(
          obj,
          "textobjects"
        )
      end)
    end

    map("af", "@function.outer")
    map("if", "@function.inner")
    map("ac", "@class.inner")
    map("ic", "@class.inner")
    map("ar", "@parameter.inner")
    map("ir", "@parameter.inner")
    map("ak", "@block.inner")
    map("ik", "@block.inner")

    -- Register the todotxt parser to be used for text filetypes
    vim.treesitter.language.register("todotxt", "text")

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        if pcall(vim.treesitter.start) then
          -- Set indentexpr for queries that have an indents.scm, check in
          -- ~/.local/share/nvim/site/queries/QUERY/
          -- Hopefully this will happen automatically in the future
          vim.cmd("TSBufEnable highlight")
          vim.cmd("TSBufEnable indent")
          if
            ({
              c = true,
              lua = true,
              markdown = true,
              python = true,
              query = true,
              xml = true,
            })[ev.match]
          then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end
      end,
    })
  end,
}
