return {
    "folke/trouble.nvim",
    opts = {},
    config = function()
        vim.keymap.set("n", "<leader>tt", ":Trouble <CR>")

        vim.keymap.set("n", "]t", function()
            require("trouble").next({ skip_groups = true, jump = true })
        end)

        vim.keymap.set("n", "[t", function()
            require("trouble").previous({ skip_groups = true, jump = true })
        end)
    end,
}
