local line_comment_prefix_table = {
    lua        = '--',
    sh         = '#',
    zsh        = '#',
    bash       = '#',
    c          = '//',
    cpp        = '//',
    h          = '//',
    hpp        = '//',
    go         = '//',
    rs         = '//',
    py         = '#',
    java       = '//',
    js         = '//',
    ts         = '//',
    tsx        = '//',
    jsx        = '//',
    html       = '<!--',
    xml        = '<!--',
    css        = '/*',
    scss       = '/*',
    sass       = '/*',
    less       = '/*',
    sql        = '--',
    graphql    = '#',
    markdown   = '<!--',
    r          = '#',
    ruby       = '#',
    perl       = '#',
    csharp     = '//',
    Dockerfile = '#'
}

local block_comment_prefix_table = {
    lua        = {"--[[", ']]--'},
    sh         = {'<<COMMENT', 'COMMENT'},
    zsh        = {'<<COMMENT', 'COMMENT'},
    bash       = {'<<COMMENT', 'COMMENT'},
    c          = {'/*', '*/'},
    cpp        = {'/*', '*/'},
    h          = {'/*', '*/'},
    hpp        = {'/*', '*/'},
    go         = {'/*', '*/'},
    rs         = {'/*', '*/'},
    py         = {'"""', '"""'},
    java       = {'/*', '*/'},
    js         = {'/*', '*/'},
    ts         = {'/*', '*/'},
    tsx        = {'/*', '*/'},
    jsx        = {'/*', '*/'},
    html       = {'<!--', '-->'},
    xml        = {'<!--', '-->'},
    css        = {'/*', '*/'},
    scss       = {'/*', '*/'},
    sass       = {'/*', '*/'},
    less       = {'/*', '*/'},
    sql        = {'/*', '*/'},
    graphql    = {'/*', '*/'},
    markdown   = {'<!--', '-->'},
    r          = {'#\'', '\'#'},
    ruby       = {'=begin', '=end'},
    perl       = {'=pod', '=cut'},
    csharp     = {'/*', '*/'},
    Dockerfile = {'#', '#'},
}

local function get_current_line_comment_prefix()
    local file_ending = vim.fn.expand('%:e')

    if line_comment_prefix_table[file_ending] then
        return line_comment_prefix_table[file_ending] .. ' '
    end

    return nil
end

local function get_current_block_comment_prefix()
    local file_ending = vim.fn.expand('%:e')

    if block_comment_prefix_table[file_ending] then
        return block_comment_prefix_table[file_ending]
    end

    return nil
end

local function insert_divider_centered_text(divider_char, divider_end_line)
    -- Get the current line and the block comment prefix
    local line_content = vim.api.nvim_get_current_line()

    -- Trim indentation and trailing whitespaces from the line content
    line_content = line_content:match('^%s*(.-)%s*$')

    local comment_prefix = get_current_block_comment_prefix()

    if not comment_prefix then
        return
    end

    -- Get the indentation of the current line
    local indent = vim.api.nvim_get_current_line():match('^%s*')

    -- Calculate the length of the divider
    local divider_length = divider_end_line - #(comment_prefix[1]) - #line_content - #(comment_prefix[2]) - #indent
    -- 2 for spaces around the line content and 2 for the comment prefix
    divider_length = divider_length - 4

    -- Create half of the comment string
    local divider_half_length = math.floor(divider_length / 2)
    local divider             = string.rep(divider_char, divider_half_length)

    -- Replicate the indentation
    local indentation_str     = string.rep(' ', #indent)
    -- Create the complete comment string
    local comment_string      = indentation_str .. comment_prefix[1] .. ' ' .. divider .. ' ' .. line_content .. ' '

    -- Fill in the missing chars until the end of the line
    local missing_chars = divider_end_line - #comment_string - #(comment_prefix[2]) - 1
    comment_string = comment_string .. string.rep(divider_char, missing_chars) .. ' ' .. comment_prefix[2]

    vim.api.nvim_set_current_line(comment_string)
end

local function insert_divider(divider_char, divider_end_line)
    local indent              = vim.api.nvim_get_current_line():match('^%s*')
    local comment_prefix      = get_current_line_comment_prefix()

    local divider_length = divider_end_line - #indent - #comment_prefix

    if not comment_prefix then
        return
    end

    -- Insert the divider
    local divider = string.rep(divider_char, divider_length)
    divider = indent .. comment_prefix .. divider

    vim.api.nvim_put({divider}, 'l', true, true)
end

return {
    insert_divider = insert_divider,
    insert_divider_centered_text = insert_divider_centered_text
}
