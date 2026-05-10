return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				preview = { treesitter = false },
			},
			extensions = {
				fzf = {},
			},
			pickers = {
				find_files = { theme = "ivy" },
                git_files = { theme = "ivy" },
                live_grep = { theme = "ivy" },
                buffers = { theme = "ivy" },
                help_tags = { theme = "ivy" },
                current_buffer_fuzzy_find = { theme = "ivy" },
			},
		})
		telescope.load_extension("fzf")

		local set = vim.keymap.set
		set("n", "<leader><leader>", ":Telescope<CR>")
		set("n", "<leader>ff", builtin.find_files)
		set("n", "<leader>fg", builtin.git_files)
		set("n", "<leader>fs", builtin.live_grep)
		set("n", "<leader>fb", builtin.buffers)
		set("n", "<leader>fh", builtin.help_tags)
		set("n", "<leader>fc", builtin.current_buffer_fuzzy_find)
	end,
}
