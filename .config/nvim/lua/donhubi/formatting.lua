vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspFormatting", {}),
  callback = function (args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if not client.supports_method(client, "textDocument/willSaveWaitUntil")
      and client.supports_method(client, "textDocument/formatting") then
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
