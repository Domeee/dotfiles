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
  "nvim-neotest/nvim-nio",
  -- typing QoL start
  "RRethy/nvim-treesitter-endwise",
  "kylechui/nvim-surround",
  "windwp/nvim-ts-autotag",
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
  "lukas-reineke/indent-blankline.nvim",
  "goolord/alpha-nvim",
  "nvim-tree/nvim-web-devicons",
  -- dotnet --
  "seblyng/roslyn.nvim",
})

local home = vim.fn.expand("$HOME")

require("chatgpt").setup({
  api_key_cmd = "gpg --decrypt " .. home .. "/.config/nvim/openapi_api_key.gpg",
  openai_params = {
    model = "gpt-4-turbo",
  },
  openai_edit_params = {
    model = "gpt-4-turbo",
  },
})

require("ibl").setup()
require("nvim-surround").setup()
