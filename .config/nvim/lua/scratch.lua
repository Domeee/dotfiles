local api = vim.api
local M = {}

function M.makeScratch()
  api.nvim_command("new")
  local buf = vim.api.nvim_get_current_buf()
  api.nvim_buf_set_name(buf, "Scratch")
  api.nvim_buf_set_option(buf, "buftype", "nofile")
  api.nvim_buf_set_option(buf, "bufhidden", "hide")
  api.nvim_buf_set_option(buf, "swapfile", false)
end

return M
