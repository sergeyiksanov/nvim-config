return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				highlight = { enable = true },
				incremental_selection = { enable = true },
				textobjects = { enable = true },
			})
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.install").compilers = { "clang", "gcc" }
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "vim", "bash", "json", "python" },
				highlight = { enable = true },
			})
		end,
	},
}
