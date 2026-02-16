return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	cmd = "Neogit",
	keys = {
		{
			"<leader>g",
			function()
				require("neogit").open({ kind = "tab" })
			end,
			desc = "Show Neogit UI",
		},
		{
			"<leader>d",
			function()
				require("neogit").open({ kind = "vsplit" })
			end,
			desc = "Show Neogit UI",
		},
	},
	opts = {
		disable_hint = true,
		disable_context_highlighting = true,
		disable_line_numbers = false,
		disable_relative_line_numbers = false,
		signs = {
			-- { CLOSED, OPENED }
			hunk = { "", "" },
			item = { "▶︎", "▼" },
			section = { "▶︎", "▼" },
		},
	},
}
