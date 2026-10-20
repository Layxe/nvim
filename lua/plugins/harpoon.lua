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
            vim.api.nvim_input("mH")
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

        vim.keymap.set("n", "<C-E>", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })

        vim.keymap.set("n", "<C-e>", function()
            toggle_telescope(harpoon:list())

            vim.schedule(function()
                vim.schedule(function()
                    local pos = vim.api.nvim_buf_get_mark(0, "H")

                    -- pos = { row, col }
                    if pos[1] > 0 then
                        vim.cmd("normal! 'H")
                    end
                end)
            end)
        end, { desc = "Jump to mark H or Harpoon menu" })
    end
}
