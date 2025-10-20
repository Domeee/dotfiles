local cmp = require("cmp")
local types = require("cmp.types")

vim.g.vsnip_snippet_dir = vim.fn.expand("~/.config/vsnip")

cmp.setup({
  completion = {
    completeopt = "menu,menuone",
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function (args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-Space>"] = {
      i = cmp.mapping.complete(),
    },
    ["<C-j>"] = {
      i = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
    },
    ["<C-k>"] = {
      i = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
    },
    ["<CR>"] = {
      i = cmp.mapping.confirm({ select = true }),
    },
    ["<Esc>"] = {
      i = cmp.mapping.abort(),
    },
    ["<C-u>"] = {
      i = cmp.mapping.scroll_docs(-4),
    },
    ["<C-d>"] = {
      i = cmp.mapping.scroll_docs(4),
    },
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp_signature_help", priority = 110 },
    { name = "vsnip",                   priority = 100 },
    { name = "nvim_lsp",                priority = 90 },
  }),
  formatting = {
    format = function (entry, vim_item)
      -- Source
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
      })[entry.source.name]

      return vim_item
    end
  },
})

local cmdline_mapping = {
  ["<C-Space>"] = {
    c = cmp.mapping.complete(),
  },
  ["<C-j>"] = {
    c = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
  },
  ["<C-k>"] = {
    c = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
  },
  ["<CR>"] = {
    c = cmp.mapping.confirm({ select = true }),
  },
  ["<Esc>"] = {
    c = cmp.mapping.abort(),
  },
  ["<C-u>"] = {
    c = cmp.mapping.scroll_docs(-4),
  },
  ["<C-d>"] = {
    c = cmp.mapping.scroll_docs(4),
  },
}

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmdline_mapping,
  sources = {
    { name = "buffer" }
  }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(":", {
  mapping = cmdline_mapping,
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  })
})
