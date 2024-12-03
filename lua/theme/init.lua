if vim.o.background == 'light' then
    require('theme.appearance')

    -- Some special syntax settings.
    require('theme.ibl')
    require('theme.markdown')
end
