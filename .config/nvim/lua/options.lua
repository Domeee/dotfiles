local opt = vim.opt
local cmd = vim.cmd

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes:1"
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.cursorline = true
opt.hidden = true
opt.updatetime = 300
opt.splitright = true
opt.nrformats:remove("octal")
opt.scrolloff = 999
opt.path:prepend("**")
opt.swapfile = false
opt.list = true
opt.listchars = "tab:→ ,space:·,extends:»,precedes:«,nbsp:␣,trail:•,eol:↵"

-- code indention
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- omnifunc completion
vim.o.completeopt = "menu"

-- statusline
-- don't show useless messages from completion
opt.shortmess:prepend("c")

-- grep
vim.o.grepprg = [[rg --no-heading --smart-case --vimgrep ]]
vim.o.grepformat = "%f:%l:%c:%m"

vim.opt.runtimepath:append("~/code/mosel.nvim")
cmd("colorscheme mosel")
