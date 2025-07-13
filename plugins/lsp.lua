local nvim_lsp = require("lspconfig")

-- golang
nvim_lsp.gopls.setup({
	on_attach = on_attach,
	flags = {
		-- This will be the default in neovim 0.7+
		debounce_text_changes = 150,
	},
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
})

nvim_lsp.pyright.setup({
	capabilities = capabilities,
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				ignore = { "*" },
			},
		},
	},
})
nvim_lsp.ruff.setup({ capabilities = capabilities })
-- nvim_lsp.clangd.setup({ capabilities = capabilities })
nvim_lsp.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			-- Дополнительные настройки (примеры)
			checkOnSave = {
				command = "clippy", -- Включение Clippy при сохранении
			},
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
		},
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
})
