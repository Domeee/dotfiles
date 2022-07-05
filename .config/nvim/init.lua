require("scratch")

require("plugins")

require("commands")
require("lsp")

require("telescope_custom")
require("comment")
require("treesitter")
require("mappings")
require("statusline")

-- override options set by plugins
require("options")

-- requires options
require("lualine_custom")

-- enable for debugging
-- require("logging")
