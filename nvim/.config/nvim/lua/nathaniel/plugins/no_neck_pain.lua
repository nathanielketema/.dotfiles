return {
	"shortcuts/no-neck-pain.nvim",
	opts = {},
    config = function ()
        vim.keymap.set("n", "<leader>zz", ":NoNeckPain<CR>")
    end
}
