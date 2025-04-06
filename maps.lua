local map = vim.keymap.set

-- Base
map("n", "<Space><Space>r", ":e!<CR>", { desc = "Reload file" })
map({ "n", "v", "i" }, "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
map("i", "<Tab>", function()
	return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, desc = "Autocompletion" })
map({ "n", "v" }, "<Space>y", '"+y', { desc = "Copy to system buffer" })
map("n", "<Space>Y", '"+Y', { desc = "Copy line to system buffer" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("n", "<Space>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
map("n", "<Space>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<Space>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<Space>cf", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format code" })

-- Buferline (tabline)
vim.api.nvim_set_keymap("n", "<Space>1", ":BufferGoto 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>2", ":BufferGoto 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>3", ":BufferGoto 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>4", ":BufferGoto 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>5", ":BufferGoto 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>6", ":BufferGoto 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>7", ":BufferGoto 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>8", ":BufferGoto 8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>9", ":BufferGoto 9<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>bd", ":BufferDelete<CR>", { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<Space>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>fw", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- Todo comments
vim.api.nvim_set_keymap("n", "<Space>ft", ":TodoTelescope<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>lt", ":TodoQuickFix<CR>", { noremap = true, silent = true })

-- Terminal
vim.api.nvim_set_keymap("n", "<Space>t", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- Git
vim.api.nvim_set_keymap("n", "<Space>gg", ":LazyGit<CR>", { noremap = true, silent = true })

-- Docker
vim.api.nvim_set_keymap("n", "<Space>ld", ":LazyDocker<CR>", { noremap = true, silent = true })
