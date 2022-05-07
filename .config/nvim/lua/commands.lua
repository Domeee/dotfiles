local cmd = vim.cmd

cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

-- migrated when nvim_add_user_command landed: https://github.com/neovim/neovim/pull/16752/files
cmd(":command! Scratch lua require'scratch'.makeScratch()")

-- many filetypes change the formatoptions, so this is the only way it works for me
cmd("au BufEnter * set fo-=o")
