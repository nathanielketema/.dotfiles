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
			--vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.zenbones_darken_comments = 45
			--vim.cmd.colorscheme("neobones")
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
            vim.g.everforest_background = "soft"
            vim.g.everforest_better_performance = 1
			vim.cmd.colorscheme("everforest")
		end,
	},
}
