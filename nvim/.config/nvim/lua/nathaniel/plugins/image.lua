return {
	"3rd/image.nvim",
	build = false,
	opts = {
		integrations = {
			markdown = {
				only_render_image_at_cursor = false,
				only_render_image_at_cursor_mode = "popup", -- or "inline"
			},
		},
		window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
		tmux_show_only_in_active_window = true,
	},
}
