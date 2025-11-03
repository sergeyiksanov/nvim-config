return {
	{
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitFilter", "LazyGitFilterCurrentFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>gg",
				function()
					if vim.fn.executable("lazygit") == 1 then
						local buf = vim.api.nvim_create_buf(false, true)
						local width = math.floor(vim.o.columns * 0.9)
						local height = math.floor(vim.o.lines * 0.9)
						local row = math.floor((vim.o.lines - height) / 2)
						local col = math.floor((vim.o.columns - width) / 2)

						local win = vim.api.nvim_open_win(buf, true, {
							relative = "editor",
							width = width,
							height = height,
							row = row,
							col = col,
							border = "rounded",
							style = "minimal",
						})

						vim.fn.termopen("lazygit", {
							on_exit = function()
								vim.api.nvim_win_close(win, true)
							end,
						})
						vim.cmd("startinsert")
					else
						vim.notify("⚠️ LazyGit не найден!", vim.log.levels.ERROR)
					end
				end,
				desc = "Open LazyGit",
				noremap = true,
				silent = true,
			},
		},
	},
}
