return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black", "isort" },
					javascript = { { "prettierd", "prettier" } },
					typescript = { { "prettierd", "prettier" } },
					html = { "prettier" },
					css = { "prettier" },
					json = { "jq" },
					yaml = { "yamlfmt" },
					markdown = { "prettier" },
					go = { "gofmt", "goimports" },
					rust = { "rustfmt" },
					cpp = { "clang_format" },
					sh = { "shfmt" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters = {
					shfmt = {
						prepend_args = { "-i", "4" },
					},
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
