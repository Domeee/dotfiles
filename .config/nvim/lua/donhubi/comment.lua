require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/109
local get_option = vim.filetype.get_option
vim.filetype.get_option = function (filetype, option)
  return option == "commentstring"
    and require("ts_context_commentstring.internal").calculate_commentstring()
    or get_option(filetype, option)
end
