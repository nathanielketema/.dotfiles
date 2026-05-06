vim.g.mapleader = " " -- <leader>
vim.keymap.set("n", "-", ":Dired<CR>")
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Centers the cursor when moving up
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Centers the cursor when moving down

vim.keymap.set("n", "n", "nzzzv") -- After searching with /, it centers the cursor, next
vim.keymap.set("n", "N", "Nzzzv") -- After searching with /, it centers the cursor, previous

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tw", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")

-- Moves the highlighted part. It even indents automatically
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- It lets you edit the word you're on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- It lets you paste what you yanked intead of what you deleted
vim.keymap.set("n", "<leader>p", '"0p') -- Paste it on the bottom
vim.keymap.set("n", "<leader>P", '"0P') -- Paste it on top

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

-- This lets you go to normal mode in the neovim terminal
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set("t", "kj", "<C-\\><C-n>")

-- Shortcut for Quickfix list
vim.keymap.set("n", "<leader>co", ":copen<CR>")
vim.keymap.set("n", "<leader>cc", ":cclose<CR>")
vim.keymap.set("n", "<C-n>", ":cnext<CR>")
vim.keymap.set("n", "<C-p>", ":cprevious<CR>")

-- Tmux-sessionizer
vim.api.nvim_create_autocmd("TermClose", {
	pattern = "*tmux_sessionizer",
	command = "bdelete!",
})
vim.keymap.set("n", "<C-f>", ":terminal tmux_sessionizer<CR>i", { silent = true })

-- LaTeX
vim.keymap.set("n", "<leader>ro", ":!pdflatex '%:.'<CR>:!open '%:r'.pdf<CR>")
vim.keymap.set("n", "<leader>rl", ":!pdflatex '%:.'<CR>")
vim.keymap.set("n", "<leader>rb", ":!biber '%:r'<CR>")
vim.keymap.set("n", "<leader>op", ":!open '%:r'.pdf<CR>")

-- Sioyek
vim.keymap.set("n", "<C-s>", ":!open_sioyek '%:r'.pdf<CR>")

-- Git
vim.keymap.set("n", "<leader>ga", ":!gac<CR>", { desc = "Git add and commit" })

-- Devdocs
vim.keymap.set("n", "<leader>mi", ":DevdocsInstall<CR>")
vim.keymap.set("n", "<leader>mo", ":DevdocsOpenFloat<CR>")
vim.keymap.set("n", "<leader>mc", ":DevdocsOpenCurrentFloat<CR>")
vim.keymap.set("n", "<leader>mt", ":DevdocsToggle<CR>")
