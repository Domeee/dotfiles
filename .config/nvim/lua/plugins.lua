local g = vim.g
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path })
end

require("paq")({
  "savq/paq-nvim",
  "Domeee/mosel.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "francoiscabrol/ranger.vim",
  "rbgrouleff/bclose.vim",
  "neovim/nvim-lspconfig",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  "nvim-lualine/lualine.nvim",
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  --[[ "nvim-treesitter/playground", -- Install to use :TSHighlightCapturesUnderCursor ]]
  "windwp/nvim-ts-autotag",
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",
  {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  "norcalli/nvim-colorizer.lua",
})

-- customization

g.ranger_map_keys = 0
g.ranger_replace_netrw = 1
