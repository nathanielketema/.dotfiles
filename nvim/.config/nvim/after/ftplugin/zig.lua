local set = vim.opt_local
local file_path = vim.api.nvim_buf_get_name(0)

if string.find(file_path, "neetcode") then
    set.makeprg = "zig test %"
else
    local build_zig = vim.fn.findfile("build.zig", ".;", 1)
    if build_zig == "" then
        set.makeprg = "zig run %"
    else
        set.makeprg = "zig build run"
    end
end
