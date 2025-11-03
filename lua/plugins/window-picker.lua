return {
	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		event = "VeryLazy",
		config = function()
			require("window-picker").setup({
				hint = "floating-big-letter",
				filter_rules = {
					include_current_win = false,
					autoselect_one = true,
					bo = {
						filetype = { "neo-tree", "NvimTree", "notify" },
						buftype = { "terminal", "quickfix" },
					},
				},
			})

			vim.keymap.set("n", "<leader>w", function()
				local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
				vim.api.nvim_set_current_win(picked_window_id)
			end, { desc = "Выбрать окно" })
		end,
	},
}
