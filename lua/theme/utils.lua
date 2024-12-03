return {
  map_highlight =
      function(t)
        setmetatable(t, { __index = { fg = 'NONE', bg = 'NONE', mod = 'NONE', sp = 'NONE' } })
        local group = t[1]
        vim.cmd(string.format('highlight %s gui=%s guifg=%s guibg=%s guisp=%s', group, t.mod, t.fg, t.bg, t.sp))
      end,

  link_highlight = function(group, link)
    vim.cmd(string.format('highlight! link %s %s', group, link))
  end,
}
