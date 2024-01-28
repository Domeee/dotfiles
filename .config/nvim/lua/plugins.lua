require("paq")({
  "savq/paq-nvim",
  --[[ "Domeee/mosel.nvim", ]]
  "tpope/vim-fugitive",
  "kevinhwang91/rnvimr",
  "neovim/nvim-lspconfig",
  "nvim-lua/plenary.nvim", -- required by telescope, chatgpt
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "nvim-telescope/telescope-live-grep-args.nvim",
  "nvim-lualine/lualine.nvim",
  { "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-textobjects",
  "norcalli/nvim-colorizer.lua",
  -- completion start
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  -- completion end
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  -- typing QoL start
  "RRethy/nvim-treesitter-endwise",
  "tpope/vim-surround",
  "windwp/nvim-ts-autotag",
  "numToStr/Comment.nvim",
  "windwp/nvim-autopairs",
  "JoosepAlviste/nvim-ts-context-commentstring",
  {
    "iamcco/markdown-preview.nvim",
    build = function ()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- typing QoL end
  -- ai start
  "github/copilot.vim",
  "MunifTanjim/nui.nvim", -- required by chatgpt
  "jackMort/ChatGPT.nvim",
  -- misc start
  "lukas-reineke/indent-blankline.nvim"
})

local home = vim.fn.expand("$HOME")

require("chatgpt").setup({
  api_key_cmd = "gpg --decrypt " .. home .. "/.config/nvim/openapi_api_key.gpg",
  openai_params = {
    model = "gpt-4-1106-preview",
  },
  openai_edit_params = {
    model = "gpt-4-1106-preview",
  },
})

require("ibl").setup()
