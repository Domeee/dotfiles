local opt = vim.opt
local o = vim.o

opt.number = true
opt.relativenumber = true
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
opt.winborder = "rounded"
-- code indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
-- spelling
opt.spell = true
opt.spelllang = "en,de"

-- omnifunc completion, overriden by nvim-cmp
o.completeopt = "menu,menuone"

-- statusline
opt.shortmess:prepend("c") -- don't show useless messages from completion
opt.showmode = false

-- grep
o.grepprg = [[rg --no-heading --smart-case --vimgrep ]]
o.grepformat = "%f:%l:%c:%m"

-- folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.wo.foldcolumn = "auto:1-9"
-- open all folds by default
vim.opt.foldlevel = 99
