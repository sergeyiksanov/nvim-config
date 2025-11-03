return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle exporter" },
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				enable_git_status = true,
				enable_diagnostics = true,
				file_system = {
					filtered_items = {
						hide_dotfiles = true,
						hide_gitignored = true,
					},
					follow_current_file = {
						enabled = true,
					},
					group_empty_dirs = true,
				},
				window = {
					width = 32,
					mappings = {
						["<space>"] = "none",
					},
				},
			})
		end,
	},
}
