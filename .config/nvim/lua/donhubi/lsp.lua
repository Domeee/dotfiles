local nvim_lsp = require("lspconfig")

-- Auto-format on save
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspFormatting", {}),
  callback = function (args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if not client:supports_method("textDocument/willSaveWaitUntil")
      and client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
        buffer = args.buf,
        callback = function ()
          vim.lsp.buf.format({
            filter = function (c)
              return (c.name ~= "ts_ls") or (c.name ~= "gdscript")
            end,
            bufnr = args.buf,
            id = client.id,
            timeout_ms = 1000
          })
        end,
      })
    end
  end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Elixir
nvim_lsp.elixirls.setup({
  capabilities = capabilities,
  cmd = { "/usr/bin/elixir-ls" },
})

-- TypeScript
nvim_lsp.ts_ls.setup({
  capabilities = capabilities,
  -- https://github.com/typescript-language-server/typescript-language-server#initializationoptions
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "non-relative",
    },
  },
})

-- JSON
nvim_lsp.jsonls.setup({
  capabilities = capabilities,
  cmd = { "vscode-json-languageserver", "--stdio" },
})

-- HTML
nvim_lsp.html.setup({
  capabilities = capabilities,
  cmd = { "vscode-html-languageserver", "--stdio" },
})

-- ESLint
nvim_lsp.eslint.setup({
  cmd = { "vscode-eslint-language-server", "--stdio" },
})

-- Lua
nvim_lsp.lua_ls.setup({
  capabilities = capabilities,
})

-- efm
local prettier = {
  formatCommand = 'prettierd "${INPUT}"',
  formatStdin = true,
  env = {
    string.format("PRETTIERD_DEFAULT_CONFIG=%s", vim.fn.expand("~/.config/prettier/.prettierrc")),
  },
}

nvim_lsp["efm"].setup({
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
        {
          formatCommand = "gdformat -",
          formatStdin = true
        },
      },
      cpp = {
        {
          formatCommand = "clang-format -assume-filename=${INPUT} -style=file",
          formatStdin = true
        },
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
})

-- XML
nvim_lsp.lemminx.setup({
  capabilities = capabilities,
  cmd = { "lemminx" },
})

-- GDScript
nvim_lsp.gdscript.setup({
  capabilities = capabilities,
  cmd = vim.lsp.rpc.connect("127.0.0.1", 6005)
})

-- Bash
nvim_lsp.bashls.setup({
  capabilities = capabilities,
})

-- C++
nvim_lsp.clangd.setup({
  capabilities = capabilities,
  cmd = { "clangd", "--offset-encoding=utf-16", },
})

-- Dockerfile
nvim_lsp.dockerls.setup({
  capabilities = capabilities,
})

-- Docker Compose
nvim_lsp.docker_compose_language_service.setup({
  capabilities = capabilities,
})

-- C#
require("roslyn").setup({
  config = {
    cmd = {
      "dotnet",
      "/opt/roslyn-ls/Microsoft.CodeAnalysis.LanguageServer.dll",
      "--logLevel=Information",
      "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
      "--stdio",
    },
    settings = {
      ["csharp|formatting"] = {
        dotnet_organize_imports_on_format = true,
      },
    },
  },
})
