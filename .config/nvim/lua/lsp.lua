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

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
      filter = function(client)
        return (client.name ~= "tsserver") or (client.name ~= "gdscript")
      end,
      bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gd", [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], opts)
  buf_set_keymap("n", "gr", [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<leader>ss", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  buf_set_keymap("n", "<leader>se", [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]], opts)
  buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

  -- format on save
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
    })
  end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Elixir
nvim_lsp.elixirls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "/usr/bin/elixir-ls" },
})

-- TypeScript
nvim_lsp.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
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
    on_attach = on_attach,
    cmd = { "vscode-json-languageserver", "--stdio" },
})

-- HTML
nvim_lsp.html.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "vscode-html-languageserver", "--stdio" },
})

-- ESLint
nvim_lsp.eslint.setup({
    on_attach = on_attach,
    cmd = { "vscode-eslint-language-server", "--stdio" },
})

-- Lua
nvim_lsp.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    -- added "init.lua" to support neovim config files
    root_dir = util.root_pattern(".luarc.json", ".luacheckrc", ".stylua.toml", "selene.toml", ".git", "init.lua"),
    settings = {
        Lua = {
            format = {
                enable = true,
            },
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
                neededFileStatus = {
                    ["codestyle-check"] = "Any",
                }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
        },
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
    settings = { rootMarkers = { ".git/" },
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
    on_attach = on_attach,
    cmd = { "lemminx" },
})

-- TailwindCSS
--[[ nvim_lsp.tailwindcss.setup({ ]]
--[[   on_attach = on_attach, ]]
--[[ }) ]]
-- GDScript
nvim_lsp.gdscript.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = vim.lsp.rpc.connect("127.0.0.1", 6005)
})

-- Bash
nvim_lsp.bashls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})
