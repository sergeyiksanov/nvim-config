vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-web-devicons").setup({
	color_icons = true,
	override = {
		["interfaces"] = {
			icon = "󰴼 ",
			color = "#997a94",
			name = "InterfacesFolder",
		},
		["controllers"] = {
			icon = "󰽋 ",
			color = "#ffd700",
			name = "ControllersFolder",
		},
		["repositories"] = {
			icon = " ",
			color = "#997a94",
			name = "RepositoriesFolder",
		},
		["utils"] = {
			icon = "󰌴 ",
			color = "#29cca0",
			name = "UtilsFolder",
		},
		["services"] = {
			icon = " ",
			color = "#ffd700",
			name = "ServicesFolder",
		},
		["models"] = {
			icon = "󰆧 ",
			color = "#ff4621",
			name = "ModelsFolder",
		},
		["include"] = {
			icon = " ",
			color = "#29cca0",
			name = "IncludeFolder",
		},
		["build"] = {
			icon = " ",
			color = "#ff4621",
			name = "BuildFolder",
		},
		[".git"] = {
			icon = "",
			color = "#f1502f",
			name = "Git",
		},
		["src"] = {
			icon = " ",
			color = "#ffd700",
			name = "SrcFolder",
		},
		["docs"] = {
			icon = " ",
			color = "#74a0ff",
			name = "DocsFolder",
		},
	},
})

require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		icons = {
			web_devicons = {
				folder = {
					enable = true,
					color = true,
				},
			},
			glyphs = {
				folder = {
					default = "", -- Базовая иконка папки
					open = "",
					symlink = "",
				},
			},
			show = {
				git = true,
				folder = true, -- Включить иконки папок
				file = true, -- Включить иконки файлов
				folder_arrow = false,
			},
		},
		highlight_git = true,
		group_empty = true,
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
