return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "^" },
			changedelete = { text = "~" },
		},
		current_line_blame = false,
	},
	keys = {
		{
			"]h",
			function()
				if vim.wo.diff then
					vim.cmd.normal({ "]h", bang = true })
					return
				end

				require("gitsigns").nav_hunk("next")
			end,
			desc = "Next hunk",
		},
		{
			"[h",
			function()
				if vim.wo.diff then
					vim.cmd.normal({ "[h", bang = true })
					return
				end

				require("gitsigns").nav_hunk("prev")
			end,
			desc = "Previous hunk",
		},
		{
			"<leader>ghs",
			function()
				require("gitsigns").stage_hunk()
			end,
			mode = { "n", "v" },
			desc = "Git stage hunk",
		},
		{
			"<leader>ghr",
			function()
				require("gitsigns").reset_hunk()
			end,
			mode = { "n", "v" },
			desc = "Git reset hunk",
		},
		{
			"<leader>ghp",
			function()
				require("gitsigns").preview_hunk_inline()
			end,
			desc = "Git preview hunk",
		},
		{
			"<leader>ghb",
			function()
				require("gitsigns").blame_line({ full = true })
			end,
			desc = "Git blame line",
		},
	},
}
