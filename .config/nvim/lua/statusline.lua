local function lsp_name()
	local msg = "No Active Lsp"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()

	if next(clients) == nil then
		return msg
	end

	local lsps = {}

	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			table.insert(lsps, client.name)
		end
	end
	--
	msg = table.concat(lsps, ", ")
	return msg
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "mosel",
		component_separators = { left = "𐏓", right = "𐏓" },
		section_separators = {},
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{ "branch", icon = "" },
			"diff",
			{ "diagnostics", icons_enabled = false, sources = { "nvim_diagnostic" } },
		},
		lualine_c = { "filename" },
		lualine_x = { lsp_name },
		lualine_y = { "filetype" },
		lualine_z = { "progress" },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
