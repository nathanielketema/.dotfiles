return {
	"luckasRanarison/nvim-devdocs",
	cmd = {
		"DevdocsOpen",
		"DevdocsOpenCurrent",
		"DevdocsOpenCurrentFloat",
		"DevdocsUpdate",
		"DevdocsUpdateAll",
		"DevdocsInstall",
		"DevdocsUninstall",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		wrap = true,
	},
}
