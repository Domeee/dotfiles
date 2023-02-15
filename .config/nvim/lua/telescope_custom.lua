local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-l>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
    path_display = { "tail" },
    dynamic_preview_title = true,
  },
})

local ts = require("telescope")

ts.load_extension("fzf")
ts.load_extension("ui-select")
ts.load_extension("live_grep_args")
