return {
	"shortcuts/no-neck-pain.nvim",
	opts = {},
    config = function ()
        require("no-neck-pain").setup({
            width = 108,
        })
        vim.keymap.set("n", "<leader>zz", ":NoNeckPain<CR>")
    end
}
