return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					prompt_prefix = "  ",
					selection_caret = " ",
					path_display = { "smart" },
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = { preview_width = 0.55 },
						width = 0.9,
						height = 0.85,
					},
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist,
							["<Esc>"] = actions.close,
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
						previewer = false,
					},
					live_grep = {
						only_sort_text = true,
					},
					buffers = {
						sort_mru = true,
						ignore_current_buffer = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			pcall(telescope.load_extension, "fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
		end,
	},
}
