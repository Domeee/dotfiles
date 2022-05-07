require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1957
		-- disable = { "elixir" },
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
