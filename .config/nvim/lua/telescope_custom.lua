local actions = require("telescope.actions")
local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- Ignore addon files in Godot
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/addons/*")

telescope.setup({
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
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

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("live_grep_args")
