local set = vim.opt_local

local build_zig = vim.fn.findfile("build.zig", ".;")

if build_zig == "" then
    set.makeprg = "zig run %"
else
    set.makeprg = "zig build run --watch -fincremental --error-style verbose_clear"
end
