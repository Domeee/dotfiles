local g = vim.g
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path })
end

require("paq")({
	"savq/paq-nvim",
	-- "Domeee/tender.vim",
	"EdenEast/nightfox.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"elixir-editors/vim-elixir",
	"HerringtonDarkholme/yats.vim",
	"francoiscabrol/ranger.vim",
	"rbgrouleff/bclose.vim",
	"neovim/nvim-lspconfig",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	-- completion
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",
	-- completion end
	"nvim-lualine/lualine.nvim",
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	"nvim-treesitter/playground",
	"windwp/nvim-ts-autotag",
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"norcalli/nvim-colorizer.lua",
})

-- customization

g.ranger_map_keys = 0
g.ranger_replace_netrw = 1

g.vsnip_snippet_dir = vim.fn.expand("~/.config/vsnip")
