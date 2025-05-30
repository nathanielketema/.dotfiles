return {
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader><leader>", ":Telescope<CR>", {})
            vim.keymap.set("n", "<leader>ff", function()
                require("telescope.builtin").find_files({
                    hidden = true,
                    follow = true,
                    file_ignore_patterns = { ".git/" },
                })
            end, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
            vim.keymap.set("n", "<leader>of", builtin.oldfiles, {})

            require("telescope").load_extension("ui-select")
        end,
    },
}
