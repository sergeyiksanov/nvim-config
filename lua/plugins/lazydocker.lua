return {
	{
		"crnvl96/lazydocker.nvim",
		cmd = {
			"LazyDocker",
			"LazyDockerConfig",
			"LazyDockerCurrentFile",
			"LazyDockerFilter",
		},
		dependencies = { "MunifTanjim/nui.nvim" },
		keys = {
			{ "<leader>dd", "<cmd>LazyDocker<CR>", desc = "Open LazyDocker", noremap = true, silent = true },
		},
		config = function()
			require("lazydocker").setup({
				theme = {
					border = "rounded",
					blend = 10,
				},
				window = {
					width = 0.9,
					height = 0.9,
				},
			})
		end,
	},
}
