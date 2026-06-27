local set = vim.keymap.set

vim.g.mapleader = " "

set("i", "jk", "<Esc>")
set("i", "kj", "<Esc>")

set("n", "x", '"_x') -- Detete without yanking it

set("n", "<C-u>", "<C-u>zz") -- Centers the cursor when moving up
set("n", "<C-d>", "<C-d>zz") -- Centers the cursor when moving down

set("n", "n", "nzzzv") -- After searching with /, it centers the cursor, next
set("n", "N", "Nzzzv") -- After searching with /, it centers the cursor, previous

-- Tabs
set("n", "<leader>to", ":tabnew<CR>")
set("n", "<leader>tc", ":tabclose<CR>")

-- Moves the highlighted part. It even indents automatically
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Edit word
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- It lets you paste what you yanked intead of what you deleted
set("n", "<leader>p", '"0p') -- Paste it on the bottom
set("n", "<leader>P", '"0P') -- Paste it on top

-- Terminal
set("t", "jk", "<C-\\><C-n>")
set("t", "kj", "<C-\\><C-n>")
set("t", "<C-w>h", "<C-\\><C-n><C-w>h")
set("t", "<C-w>l", "<C-\\><C-n><C-w>l")
set("t", "<C-w>j", "<C-\\><C-n><C-w>j")
set("t", "<C-w>k", "<C-\\><C-n><C-w>k")
set("n", ",t", ":vertical terminal<CR>i")
set("n", ",h", function()
	vim.cmd("horizontal terminal")
	vim.cmd("startinsert")
	vim.api.nvim_win_set_height(0, 10)
end)
set("n", ",v", function()
	vim.cmd("Bmake")
	vim.cmd("wincmd L")
	vim.api.nvim_win_set_width(0, 90)
end)
set("n", ",s", function()
	vim.cmd("Bmake")
	vim.api.nvim_win_set_height(0, 10)
end)

-- Chat
set("n", "<leader>cho", ":vertical terminal opencode<CR>i", { silent = true })
set("n", "<leader>chc", ":vertical terminal codex<CR>i", { silent = true })

-- Quickfix
set("n", "<leader>co", ":copen<CR>")
set("n", "<leader>cc", ":cclose<CR>")
set("n", "<C-n>", ":cnext<CR>")
set("n", "<C-p>", ":cprevious<CR>")

-- Tmux sessionizer
set("n", "<C-f>", ":terminal tmux_sessionizer<CR>i", { silent = true })
set("n", "<C-l>", ":terminal tmux_jump<CR>i", { silent = true })

-- LaTeX
set("n", "<leader>ro", ":!pdflatex '%:.'<CR>:!open '%:r'.pdf<CR>")
set("n", "<leader>rl", ":!pdflatex '%:.'<CR>")
set("n", "<leader>rb", ":!biber '%:r'<CR>")
set("n", "<leader>op", ":!open '%:r'.pdf<CR>")
set("n", "<leader>os", ":!tmux_sioyek %<CR>")

-- Git
set("n", "<leader>ga", ":!gac<CR>", { desc = "Git add and commit" })

-- Devdocs
set("n", "<leader>mi", ":DevdocsInstall<CR>")
set("n", "<leader>mo", ":DevdocsOpenFloat<CR>")
set("n", "<leader>mc", ":DevdocsOpenCurrentFloat<CR>")
set("n", "<leader>mt", ":DevdocsToggle<CR>")
