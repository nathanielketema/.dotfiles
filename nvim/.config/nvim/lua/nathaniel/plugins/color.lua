return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			styles = {
				transparent = "tokyonight_transparent",
				sidebars = "tokyonight_transparent",
			},
		},

		config = function()
			vim.opt.background = "dark"
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "main",
			dim_inactive_windows = false,
			extend_background_behind_borders = true,
		},
		config = function()
			vim.opt.background = "dark"
			--vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {},
		config = function()
			vim.opt.background = "dark"
		end,
	},
}
