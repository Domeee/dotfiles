local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-l>"] = actions.close,
			},
		},
		path_display = { "tail" },
		dynamic_preview_title = true,
		preview = {
			treesitter = false,
		},
	},
})

require("telescope").load_extension("fzf")
