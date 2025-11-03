return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signcolumn = true,
				numhl = false,
				linehl = false,
				word_diff = false,

				watch_gitdir = { interval = 1000, follow_files = true },
				attach_to_untracked = true,
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 300,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> • <summary>",

				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil,
				max_file_length = 40000,
				preview_config = {
					border = "rounded",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				-- yadm = { enable = false },
			})

			local gs = package.loaded.gitsigns
			vim.keymap.set("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Next Git hunk" })

			vim.keymap.set("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Previous Git hunk" })

			vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
			vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
			vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
			vim.keymap.set("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, { desc = "Blame line" })
			vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "Diff this file" })
		end,
	},
}
