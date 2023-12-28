local cmd = vim.cmd
local create_autocmd = vim.api.nvim_create_autocmd

cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

-- migrated when nvim_add_user_command landed: https://github.com/neovim/neovim/pull/16752/files
cmd(":command! Scratch lua require'scratch'.makeScratch()")

-- many filetypes change the formatoptions, so this is the only way it works for me
create_autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=o"
})

-- disable diagnostics for .env.* files, e.g. .env.dev
create_autocmd("BufEnter", {
  pattern = { "*.dev", "*.test", "*.staging", "*.prod" },
  callback = function(args)
    vim.diagnostic.disable(args.buf)
  end
})
