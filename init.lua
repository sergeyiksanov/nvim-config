local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("kyazdani42/nvim-tree.lua")
Plug("kyazdani42/nvim-web-devicons")
Plug("romgrk/barbar.nvim")
Plug("nvim-lualine/lualine.nvim")
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("neovim/nvim-lspconfig")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-nvim-lsp-signature-help")
Plug("stevearc/conform.nvim")
Plug('catppuccin/nvim', { as = 'catppuccin' })

vim.call("plug#end")

home = os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path
vim.opt.rtp:prepend(vim.fn.stdpath("config") .. "/plugins")

require("maps")
require("common")
dofile("theme.lua")
require("plugins.vimtree")
require("plugins.barbar")
require("plugins.lua_line")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.cmp_config")
require("plugins.conform")
