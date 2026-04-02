require("telescope").setup({
	defaults = {
		preview = {
			treesitter = false,
		},
	},
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({ no_ignore = true })
end, {})

vim.keymap.set("n", "<leader><leader>", ":Telescope<CR>", {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
