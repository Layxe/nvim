local DEFAULT_NEOGEN_SETTINGS = {
    snippet_engine = "luasnip",
    placeholders_text = {
        ["description"] = "TODO",
        ["tparam"]      = "TODO",
        ["parameter"]   = "TODO",
        ["return"]      = "TODO",
        ["class"]       = "TODO",
        ["throw"]       = "TODO",
        ["varargs"]     = "TODO",
        ["type"]        = "TODO",
        ["attribute"]   = "TODO",
        ["args"]        = "TODO",
        ["kwargs"]      = "TODO",
    }
}

local function create_c_template(opts)
    local i        = require("neogen.types.template").item
    local user     = opts.user
    local filename = opts.filename
    local date     = opts.date
    local email    = opts.email

    local custom_c_template = {
        { nil, "/// ------------------------------------------------------------------------------------------------", { no_results = true, type = { "file" } } },
        { nil, "/// @file   " .. filename, { no_results = true, type = { "file" } } },
        { nil, "/// @author " .. user .. " <" .. email .. ">", { no_results = true, type = { "file" } } },
        { nil, "/// @date   " .. date, { no_results = true, type = { "file" } } },
        { nil, "/// @brief $1", { no_results = true, type = { "file" } } },
        { nil, "/// ------------------------------------------------------------------------------------------------", { no_results = true, type = { "file" } } },
        { nil, "", { no_results = true, type = { "file" } } },

        { i.ClassName, "/// @class %s", { type = { "class" } } },
        { i.Type     , "/// @typedef %s", { type = { "type" } } },
        { nil        , "/// @brief $1", { type = { "func", "class", "type" } } },
        { i.Tparam   , "/// @tparam %s $1" },
        { i.Parameter, "/// @param %s $1" },
        { i.Return   , "/// @return $1" },
    }

    return {
        template = {
            annotation_convention = "doxygen_triple",
            doxygen_triple = custom_c_template
        }
    }
end

local function execute_command(command)
    local handle = io.popen(command)

    if not handle then
        return ""
    end

    local result = handle:read("*all")
    handle:close()
    return result
end

local function update_options_on_file_change(opts)
    local filename = vim.fn.expand("%:t")
    opts.filename = filename

    return opts
end

local function create_c_settings(comment_opts)
    comment_opts = update_options_on_file_change(comment_opts)
    local c_template = create_c_template(comment_opts)

    local return_settings = DEFAULT_NEOGEN_SETTINGS
    return_settings.languages = {
        c   = c_template,
        cpp = c_template,
        h   = c_template,
        hpp = c_template,
    }

    return return_settings
end

return {
    "danymat/neogen",
    config = function ()

        local comment_opts = {
            user     = string.gsub(execute_command("git config user.name"), "\n", ""),
            email    = string.gsub(execute_command("git config user.email"), "\n", ""),
            filename = vim.fn.expand("%:t"),
            date     = os.date("%Y-%m-%d")
        }

        vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
            pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
            callback = function()
                local c_settings = create_c_settings(comment_opts)
                require('neogen').setup(c_settings)
            end
        })
        vim.api.nvim_set_keymap('n', '<leader>n', ':lua require("neogen").generate()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('i', '<C-j>', '<Esc>:lua require("neogen").jump_next()<CR>i', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>:lua require("neogen").jump_prev()<CR>i', { noremap = true, silent = true })
    end
}

-- --- This is a test
-- ---@param number integer
-- local function setup(number)
--     print('Setup number:', number)
-- end
