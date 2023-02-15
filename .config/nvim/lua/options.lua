local opt = vim.opt
local cmd = vim.cmd
local o = vim.o

opt.number = true
opt.signcolumn = "yes:1"
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.cursorline = true
opt.hidden = true
opt.updatetime = 300
opt.splitright = true
opt.splitbelow = true
opt.nrformats:remove("octal")
opt.scrolloff = 999
opt.path:prepend("**")
opt.swapfile = false
opt.list = true
opt.listchars = "tab:→ ,space:·,extends:»,precedes:«,nbsp:␣,trail:•,eol:↵"

-- code indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- omnifunc completion, overriden by nvim-cmp
o.completeopt = "menu,menuone,noselect"

-- statusline
opt.shortmess:prepend("c") -- don't show useless messages from completion

-- grep
o.grepprg = [[rg --no-heading --smart-case --vimgrep ]]
o.grepformat = "%f:%l:%c:%m"

vim.opt.runtimepath:append("~/code/mosel.nvim")
cmd("colorscheme mosel")
