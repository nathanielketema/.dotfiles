return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {},

	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				preview = {
					treesitter = false,
				},
			},
		})
		pcall(telescope.load_extension, "fzf")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ hidden = true })
		end, { desc = "Find files" })

		vim.keymap.set("n", "<leader><leader>", ":Telescope<CR>", { desc = "Telescope builtin" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Git files" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
		vim.keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, { desc = "Current buffer" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Word under cursor" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume picker" })
		vim.keymap.set("n", "<leader>fR", builtin.lsp_references, { desc = "LSP references" })
		vim.keymap.set("n", "<leader>fD", builtin.lsp_definitions, { desc = "LSP definitions" })
	end,
}
