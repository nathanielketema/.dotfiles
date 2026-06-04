local set = vim.opt_local

set.makeprg = "zig build run --watch -fincremental --error-style verbose_clear"
