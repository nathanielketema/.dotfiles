require("orgmode").setup({
	org_agenda_files = "~/personal/notes/orgfiles/**/*",
	org_default_notes_file = "~/personal/notes/orgfiles/refile.org",
	org_agenda_skip_deadline_prewarning_if_scheduled = true,
	org_agenda_skip_scheduled_if_done = true,
	org_agenda_skip_deadline_if_done = true,
	org_deadline_warning_days = 0,
})

vim.lsp.enable("org")
