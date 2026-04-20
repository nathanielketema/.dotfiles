return {
    "voldikss/vim-floaterm",

    config = function()
        vim.keymap.set("n", "<leader>y", ":FloatermNew --width=0.7 --height=0.8 yazi<CR>", { desc = "Open Yazi" })
    end,
}
