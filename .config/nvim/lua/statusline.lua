require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "mosel",
    component_separators = { left = "𐏓", right = "𐏓" },
    section_separators = {},
    disabled_filetypes = { "dapui_stacks", "dapui_scopes", "dapui_watches", "dap-repl" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch", icon = "" },
      "diff",
      {
        "diagnostics",
        icons_enabled = false,
        sources = { "nvim_diagnostic" },
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = "󰸠 "
        },
      },
    },
    lualine_c = { "filename" },
    lualine_x = {},
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
