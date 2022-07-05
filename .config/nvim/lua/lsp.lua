local nvim_lsp = require("lspconfig")
local util = require "lspconfig.util"

-- diagnostics signs
local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gd", [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], opts)
  buf_set_keymap("n", "gi", [[<cmd>lua require('telescope.builtin').lsp_implementations()<CR>]], opts)
  buf_set_keymap("n", "gr", [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<leader>d", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  buf_set_keymap("n", "<leader>ee", [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]], opts)
  buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  if (client.name == "tsserver") or (client.name == "gdscript") then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  -- format on save
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
	augroup Format
	au! * <buffer>
	au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
	augroup END
	]]  )
  end
end

-- Elixir
nvim_lsp.elixirls.setup({
  on_attach = on_attach,
  cmd = { "/usr/bin/elixir-ls" },
  flags = {
    debounce_text_changes = 150,
  },
})

-- TypeScript
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  init_options = {
    preferences = {
      -- based on the baseUrl configured in tsconfig.json
      importModuleSpecifierPreference = "non-relative",
    },
  },
})

-- JSON
nvim_lsp.jsonls.setup({
  on_attach = on_attach,
  cmd = { "vscode-json-languageserver", "--stdio" },
  flags = {
    debounce_text_changes = 150,
  },
})

-- HTML
nvim_lsp.html.setup({
  on_attach = on_attach,
  cmd = { "vscode-html-languageserver", "--stdio" },
  flags = {
    debounce_text_changes = 150,
  },
})

-- ESLint
nvim_lsp.eslint.setup({
  on_attach = on_attach,
  cmd = { "vscode-eslint-language-server", "--stdio" },
  flags = {
    debounce_text_changes = 150,
  },
})

-- Lua
nvim_lsp.sumneko_lua.setup({
  on_attach = on_attach,
  -- added "init.lua" to support neovim config files
  root_dir = util.root_pattern(".luarc.json", ".luacheckrc", ".stylua.toml", "selene.toml", ".git", "init.lua"),
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
        neededFileStatus = {
          ["codestyle-check"] = "Any",
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      format = {
        enable = true
      },
      telemetry = {
        enable = false,
      },
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
})

-- efm (reasons not using null-ls:
-- https://www.reddit.com/r/neovim/comments/nkjf6r/nulllsnvim_use_neovim_as_a_language_server_to/gzdmtxg)
local prettier = {
  formatCommand = 'prettierd "${INPUT}"',
  formatStdin = true,
  env = {
    string.format("PRETTIERD_DEFAULT_CONFIG=%s", vim.fn.expand("~/.config/prettier/.prettierrc")),
  },
}

nvim_lsp["efm"].setup({
  on_attach = on_attach,
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      css = {
        prettier,
      },
      typescript = {
        prettier,
      },
      typescriptreact = {
        prettier,
      },
      markdown = {
        prettier,
      },
      javascript = {
        prettier,
      },
      javascriptreact = {
        prettier,
      },
      html = {
        prettier,
      },
      gdscript = {
        { formatCommand = "gdformat -", formatStdin = true },
      },
    },
  },
  filetypes = {
    "css",
    "typescriptreact",
    "typescript",
    "markdown",
    "javascript",
    "javascriptreact",
    "html",
    "gdscript",
  },
  flags = {
    debounce_text_changes = 150,
  },
})

-- XML
nvim_lsp.lemminx.setup({
  on_attach = on_attach,
  cmd = { "lemminx" },
  flags = {
    debounce_text_changes = 150,
  },
})

-- TailwindCSS
nvim_lsp.tailwindcss.setup({
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
})

-- GDScript
nvim_lsp.gdscript.setup({
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
})
