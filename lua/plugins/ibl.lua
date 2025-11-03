return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("ibl").setup({
				indent = {
					char = "│",
					highlight = "IblIndent",
				},
				scope = {
					enabled = true,
					show_start = false,
					show_end = false,
					highlight = "IblScope",
				},
				exclude = {
					filetypes = {
						"help",
						"dashboard",
						"neo-tree",
						"Neotree",
						"NvimTree",
						"lazy",
						"mason",
						"toggleterm",
						"Trouble",
						"Outline",
						"aerial",
					},
					buftypes = { "terminal", "nofile", "prompt" },
				},
			})

			vim.cmd([[
			     highlight IblIndent guifg=#3A3A3A gui=nocombine
			     highlight IblScope guifg=#5C6370 gui=nocombine
			   ]])
		end,
	},
}
