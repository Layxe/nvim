return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    init = function ()
        local harpoon = require("harpoon")

        harpoon:setup()
        vim.keymap.set("n", "<leader>ma", function()
            vim.api.nvim_input("mh")
            harpoon:list():add()
        end)
        vim.keymap.set("n", "<leader>ml", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end
        )

        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })

        -- Jump to marker h, when pressing <leader>#
        vim.keymap.set("n", "<leader>h", function()
            -- check if mark 'h' exists in current buffer
            local pos = vim.fn.getpos("'h")
            local lnum, col = pos[2], pos[3]

            if lnum > 0 and col > 0 then
                -- jump to 'h'
                vim.cmd("normal! 'h")
            else
                toggle_telescope(harpoon:list())

                -- This is a workaround, since the second buffer is the buffer,
                -- we are jumping to
                vim.api.nvim_create_autocmd("BufEnter", {
                    once = true,
                    callback = function()
                        vim.api.nvim_create_autocmd("BufEnter", {
                            once = true,
                            callback = function()
                                if vim.fn.line("'h") > 0 then
                                    vim.cmd("normal! 'h")
                                end
                            end,
                        })
                    end,
                })
            end
        end, { desc = "Jump to mark h or Harpoon menu" })

        -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
        -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end
}
