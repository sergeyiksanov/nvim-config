return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					numbers = "none",
					close_command = "bdelete! %d",
					right_mouse_command = "bdelete! %d",
					left_mouse_command = "buffer %d",
					middle_mouse_command = nil,

					indicator = {
						icon = "▎",
						style = "icon",
					},

					buffer_close_icon = "󰅖",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",

					max_name_length = 18,
					max_prefix_length = 15,
					tab_size = 18,
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,

					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							highlight = "Directory",
							separator = true,
						},
					},

					show_buffer_close_icons = false,
					show_close_icon = false,
					persist_buffer_sort = true,
					separator_style = "slant",
					enforce_regular_tabs = false,
					always_show_bufferline = true,
				},
			})

			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
			map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
			map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
			map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
			map("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)

			map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
			map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
			map("n", "<leader>bd", function()
				local bufnr = vim.api.nvim_get_current_buf()
				local buffers = vim.fn.getbufinfo({ buflisted = 1 })
				if #buffers > 1 then
					vim.cmd("bnext")
					vim.cmd("bdelete " .. bufnr)
				else
					vim.cmd("enew")
					vim.cmd("bdelete " .. bufnr)
				end
			end, opts)
			map("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", opts)
		end,
	},
}
