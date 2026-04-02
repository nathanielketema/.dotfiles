vim.g.mapleader = " " -- <leader>
vim.keymap.set("n", "-", ":Dired<CR>")
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Centers the cursor when moving up
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Centers the cursor when moving down

vim.keymap.set("n", "n", "nzzzv") -- After searching with /, it centers the cursor, next
vim.keymap.set("n", "N", "Nzzzv") -- After searching with /, it centers the cursor, previous

vim.keymap.set("n", "<leader>tt", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tw", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Moves the highlighted part. It even indents automatically
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- This one lets you yank into the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- It lets you edit the word you're on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- It lets you paste what you yanked intead of what you deleted
vim.keymap.set("n", "<leader>p", '"0p') -- Paste it on the bottom
vim.keymap.set("n", "<leader>P", '"0P') -- Paste it on top

-- Remaping the Esc key in insert mode
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

-- This lets you go to normal mode in the neovim terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Shortcut for Quickfix list
vim.keymap.set("n", "<leader>co", ":copen<CR>")
vim.keymap.set("n", "<leader>cn", ":cnext<CR>")
vim.keymap.set("n", "<leader>cp", ":cprevious<CR>")

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

-- Git
vim.keymap.set("n", "<leader>ga", ":!gac<CR>")

-- Devdocs
vim.keymap.set("n", "<leader>di", ":DevdocsInstall<CR>")
vim.keymap.set("n", "<leader>do", ":DevdocsOpenFloat<CR>")
vim.keymap.set("n", "<leader>dc", ":DevdocsOpenCurrentFloat<CR>")
vim.keymap.set("n", "<leader>dt", ":DevdocsToggle<CR>")

