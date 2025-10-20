local cmd = vim.cmd

require("paq")({
  "savq/paq-nvim",
  --[[ "Domeee/mosel.nvim", ]]
  "tpope/vim-fugitive",
  "kevinhwang91/rnvimr",
  "neovim/nvim-lspconfig",
  "nvim-lua/plenary.nvim", -- required by telescope
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "nvim-telescope/telescope-live-grep-args.nvim",
  "nvim-lualine/lualine.nvim",
  -- treesitter start
  { "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-textobjects",
  -- treesitter end
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
  "kylechui/nvim-surround",
  "windwp/nvim-ts-autotag",
  "windwp/nvim-autopairs",
  -- typing QoL end
  -- misc start
  -- "lukas-reineke/indent-blankline.nvim", -- bug that duplicates lines
  "nvim-tree/nvim-web-devicons",
  "catgoose/nvim-colorizer.lua",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "github/copilot.vim",
})

vim.opt.runtimepath:append("~/code/mosel.nvim")
cmd("colorscheme mosel")

require("nvim-surround").setup()
require("nvim-autopairs").setup()

require("colorizer").setup({
  user_default_options = {
    names = false,
  },
})
