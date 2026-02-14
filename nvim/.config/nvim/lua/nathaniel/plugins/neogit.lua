return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>g", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
	},
	opts = {
		disable_hint = true,
		disable_context_highlighting = true,
		kind = "vsplit",
		disable_line_numbers = false,
		disable_relative_line_numbers = false,
		commit_editor = {
			kind = "auto",
			show_staged_diff = true,
			-- Accepted values:
			-- "split" to show the staged diff below the commit editor
			-- "vsplit" to show it to the right
			-- "split_above" Like :top split
			-- "vsplit_left" like :vsplit, but open to the left
			-- "auto" "vsplit" if window would have 80 cols, otherwise "split"
			staged_diff_split_kind = "split",
			spell_check = true,
		},
		commit_select_view = {
			kind = "auto",
		},
		commit_view = {
			kind = "auto",
			verify_commit = vim.fn.executable("gpg") == 1,
		},
		log_view = {
			kind = "tab",
		},
		rebase_editor = {
			kind = "auto",
		},
		reflog_view = {
			kind = "tab",
		},
		merge_editor = {
			kind = "auto",
		},
		preview_buffer = {
			kind = "floating_console",
		},
		popup = {
			kind = "split",
		},
		stash = {
			kind = "tab",
		},
		refs_view = {
			kind = "tab",
		},
	},
}
