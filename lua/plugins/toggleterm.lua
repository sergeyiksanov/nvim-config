return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
		})

		local map = function(mode, keys, func, desc)
			vim.keymap.set(mode, keys, func, { noremap = true, silent = true, desc = desc })
		end

		map("n", "<Space>t", "<cmd>ToggleTerm<CR>", "Открыть терминал")
	end,
}
