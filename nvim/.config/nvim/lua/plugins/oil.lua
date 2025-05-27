return {
    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = {
            { "echasnovski/mini.icons", opts = {} },
        },
        config = function()
            require("oil").setup({
                view_options = {
                    show_hidden = true,
                },
                default_file_explorer = false,
            })

            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
    },
}
