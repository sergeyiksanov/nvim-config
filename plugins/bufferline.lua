require("bufferline").setup({
	options = {
		numbers = "buffer_id",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		separator_style = "slant",
		always_show_bufferline = true,
		diagnostics = "nvim_lsp",
		custom_filter = function(bufnum)
			return true
		end,
	},
})
