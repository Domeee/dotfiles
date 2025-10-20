local g = vim.g

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Help me unlearn this mapping habit quick
map("i", "<C-l>", "",
  { silent = true, noremap = true, callback = function () vim.notify("Shame 🔔, shame 🔔, shame 🔔") end })

--Remap space as leader key
map("n", "<space>", "", { silent = true })
g.mapleader = " "
g.maplocalleader = " "

-- buffer
map("n", "<leader>/", "<cmd>noh<CR>")
map("n", "<leader>w", "<cmd>update<CR>")
map("n", "<leader>q", "<cmd>q<CR>")
map("n", "<leader>bd", "<cmd>bd<CR>")
map("n", "<leader>bD", "<cmd>%bd<CR>")

-- navigation
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-k>", "<C-w><C-k>")
map("n", "<C-l>", "<C-w><C-l>")

-- Have j and k navigate visual lines rather than logical ones, unless navigating via relative line numbers
map("n", "j", "v:count ? 'j' : 'gj'", { expr = true })
map("n", "k", "v:count ? 'k' : 'gk'", { expr = true })

-- diagnostics
vim.keymap.set("n", "<leader>d", function ()
  vim.diagnostic.jump({ count = -1, float = true })
end)

-- config
map("n", "<leader>cv", "<cmd>edit $MYVIMRC<CR>")

-- misc
map("n", "<leader>ff", "<cmd>RnvimrToggle<CR>")

-- vim-fugitive
map("n", "<leader>vs", "<cmd>G<CR>")
map("n", "<leader>vg", "<cmd>diffget //1<CR>") -- working copy
map("n", "<leader>vf", "<cmd>diffget //2<CR>") -- current branch / HEAD
map("n", "<leader>vj", "<cmd>diffget //3<CR>") -- merge branch

-- Telescope
map("n", "<leader>sf", "<cmd>Telescope find_files<CR>")
map("n", "<leader>sg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
map("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
map("n", "<leader>sm", "<cmd>Telescope marks<CR>")

-- undo breakpoints
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", "!", "!<C-g>u")
map("i", "?", "?<C-g>u")
map("i", "(", "(<C-g>u")
map("i", ")", ")<C-g>u")
map("i", "{", "{<C-g>u")
map("i", "}", "}<C-g>u")
map("i", "[", "[<C-g>u")
map("i", "]", "]<C-g>u")

-- dap
vim.keymap.set("n", "<F5>", function () require("dap").continue() end)
vim.keymap.set("n", "<F6>", function () require("dap").step_over() end)
vim.keymap.set("n", "<F7>", function () require("dap").step_into() end)
vim.keymap.set("n", "<F8>", function () require("dap").step_out() end)
vim.keymap.set("n", "<F9>", function () require("dap").disconnect() end)
vim.keymap.set("n", "<F10>", function () require("dap").step_back() end)
vim.keymap.set("n", "<leader>b", function () require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<leader>gb", function () require("dap").run_to_cursor() end)

-- Copilot
map("i", "<C-K>", "<Plug>(copilot-suggest)")
vim.keymap.set("i", "<C-J>", "copilot#Accept('')", {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

-- LSP
map("n", "K", "<cmd>lua vim.lsp.buf.hover({max_width = 100})<CR>")

-- local to buffer
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function (args)
    local opts = { noremap = true, silent = true }

    vim.api.nvim_buf_set_keymap(args.buf, "n", "gd", [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]],
      opts)
    vim.api.nvim_buf_set_keymap(args.buf, "n", "grr", [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]],
      opts)
    vim.api.nvim_buf_set_keymap(args.buf, "n", "gri", [[<cmd>lua require('telescope.builtin').lsp_implementations()<CR>]],
      opts)
    -- override default (gO)
    vim.api.nvim_buf_set_keymap(args.buf, "n", "<leader>ss",
      [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
      opts)
    vim.api.nvim_buf_set_keymap(args.buf, "n", "<leader>sw",
      [[<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>]],
      opts)
    vim.api.nvim_buf_set_keymap(args.buf, "n", "<leader>sd", [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]],
      opts)
    vim.api.nvim_buf_set_keymap(args.buf, "n", "grt",
      [[<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>]],
      opts)
  end,
})
