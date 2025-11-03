return {
	{
		"beauwilliams/focus.nvim",
		config = function()
			local focus = require("focus")
			focus.setup({
				enable = true,
				autoresize = {
					enable = true,
					width = 0,
					height = 0,
				},
				ui = { signcolumn = false },
				excluded_filetypes = {
					"Neotree",
					"neo-tree",
					"NvimTree",
					"Outline",
					"aerial",
					"toggleterm",
					"TelescopePrompt",
					"tsplayground",
				},
				excluded_buftypes = { "nofile", "prompt", "terminal" },
			})

			vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
				callback = function()
					local ft = vim.bo.filetype
					if ft == "neo-tree" or ft == "Neotree" or ft == "NvimTree" then
						vim.cmd("FocusDisable")
						vim.w.focus_disable = true
					else
						if vim.bo.modifiable then
							vim.cmd("FocusEnable")
						end
					end
				end,
			})
		end,
	},
}
