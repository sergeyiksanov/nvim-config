require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort" },
		javascript = { { "prettierd", "prettier" } },
		html = { "prettier" },
		css = { "prettier" },
		json = { "jq" },
		yaml = { "yamlfmt" },
		markdown = { "prettier" },
		go = { "gofmt", "goimports" },
		rust = { "rustfmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2" }, -- 2 пробела для отступов
		},
	},
})
