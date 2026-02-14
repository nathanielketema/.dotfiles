vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.textwidth = 95
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.clipboard:append("unnamedplus")


vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.splitright = true
vim.opt.splitbelow = true


vim.opt.colorcolumn = "100"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- smart search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.netrw_localrmdir='rm -r'

-- Recognize #!/usr/bin/env bun
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*",
  callback = function(args)
    local first_line = vim.fn.getline(1, args.buf)
    if first_line[1]:match("^#!.*bin/env bun") then
      vim.bo[args.buf].filetype = "javascript"
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "Brewfile",
  callback = function(args)
    vim.bo[args.buf].filetype = "ruby"
  end,
})
