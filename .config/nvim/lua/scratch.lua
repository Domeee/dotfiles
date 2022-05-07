local api = vim.api
local M = {}

function M.makeScratch()
	api.nvim_command("enew")
	api.nvim_buf_set_option(0, "buftype", "nofile")
	api.nvim_buf_set_option(0, "bufhidden", "hide")
	api.nvim_buf_set_option(0, "swapfile", false)
end

return M
