local g = vim.g
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Remap space as leader key
map("n", "<space>", "", { silent = true })
g.mapleader = " "
g.maplocalleader = " "

-- return to normal mode
map("v", "<C-l>", "<esc>")
map("c", "<C-l>", "<C-c>")
map("i", "<C-l>", "<esc>")

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
map("n", "<leader>d", "<cmd>lua vim.diagnostic.goto_next()<CR>")

-- config
map("n", "<leader>cv", "<cmd>edit $MYVIMRC<CR>")

-- misc
map("n", "<leader>ff", "<cmd>RnvimrToggle<CR>")
map("n", "gs", "<cmd>Scratch<CR>")

-- vim-fugitive
map("n", "<leader>vs", "<cmd>G<CR>")
map("n", "<leader>vg", "<cmd>diffget //1<CR>") -- working copy
map("n", "<leader>vf", "<cmd>diffget //2<CR>") -- current branch / HEAD
map("n", "<leader>vj", "<cmd>diffget //3<CR>") -- merge branch

-- Telescope
map("n", "<leader>sf", "<cmd>Telescope find_files<CR>")
map("n", "<leader>sg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
map("n", "<leader>sb", "<cmd>Telescope buffers<CR>")

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
vim.keymap.set("n", "<Leader>b", function () require("dap").toggle_breakpoint() end)

-- ChatGPT
vim.keymap.set("n", "<Leader>cc", "<cmd>ChatGPT<CR>")
vim.keymap.set({ "n", "v" }, "<Leader>ci", "<cmd>ChatGPTEditWithInstruction<CR>")
