return {
	"barrettruth/canola.nvim",
	lazy = false,
	opts = {},
	config = function()
		require("oil").setup({
			columns = {
				{ "size", highlight = "Special" },
				"mtime",
			},
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
		})
		local set = vim.keymap.set

		set("n", "-", ":Oil<CR>")
		set("n", ",o", function()
			require("oil").set_columns({})
		end)
		set("n", ",b", function()
			require("oil").set_columns({
				{ "size", highlight = "Special" },
				"mtime",
			})
		end)
		set("n", "<leader>fo", function()
			require("telescope.builtin").find_files({
				cwd = require("oil").get_current_dir(),
			})
		end)
	end,
}
