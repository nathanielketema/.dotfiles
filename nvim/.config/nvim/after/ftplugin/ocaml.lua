local set = vim.opt_local
local project = vim.fs.basename(vim.fn.getcwd())

set.makeprg = string.format("opam exec -- dune exec %s -w", project)
