vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
	filters = {
		dotfiles = true,
	},
	git = {
		enable = true,
	},
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")

		-- Сначала вызываем стандартные бинды
		api.config.mappings.default_on_attach(bufnr)

		-- Затем добавляем свои бинды
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		-- Убираем старый биндинг (если надо)
		vim.keymap.set("n", "<C-k>", "", { buffer = bufnr })

		-- Назначаем <C-i> на показ информации
		vim.keymap.set("n", "<C-i>", api.node.show_info_popup, opts("Show Info"))
	end,
})

vim.api.nvim_create_autocmd("TabNewEntered", {
	callback = function()
		require("nvim-tree.api").tree.open()
	end,
})
