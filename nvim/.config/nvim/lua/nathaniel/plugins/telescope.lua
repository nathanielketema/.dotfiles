return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {},

	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local set = vim.keymap.set

		telescope.setup({
			defaults = {
				preview = { treesitter = false },
			},
			extensions = {
				fzf = {},
			},
		})
		telescope.load_extension("fzf")

		set("n", "<leader>ff", function()
			builtin.find_files({ hidden = true })
		end)
		set("n", "<leader><leader>", ":Telescope<CR>")
		set("n", "<leader>fg", builtin.git_files)
		set("n", "<leader>fs", builtin.live_grep)
		set("n", "<leader>fb", builtin.buffers)
		set("n", "<leader>fh", builtin.help_tags)
		set("n", "<leader>fo", builtin.oldfiles)
		set("n", "<leader>fc", builtin.current_buffer_fuzzy_find)
		set("n", "<leader>fw", builtin.grep_string)
		set("n", "<leader>fd", builtin.diagnostics)
		set("n", "<leader>fr", builtin.resume)
		set("n", "<leader>fR", builtin.lsp_references)
		set("n", "<leader>fD", builtin.lsp_definitions)
	end,
}
