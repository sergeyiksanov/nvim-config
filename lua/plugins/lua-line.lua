return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					icons_enabled = true,
					globalstatus = true,
					disabled_filetypes = { "neo-tree", "NvimTree", "lazy", "dashboard" },
				},
				sections = {
					lualine_a = { { "mode", icon = "" } },
					lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" },
					lualine_c = {
						{
							"filename",
							file_status = true,
							newfile_status = false,
							path = 1,
						},
					},
					lualine_x = {
						{ "encoding" },
						{ "fileformat" },
						{ "filetype", icon_only = true },
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				extensions = { "neo-tree", "lazy", "fugitive", "man", "quickfix" },
			})
		end,
	},
}
