require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "cpp",
    "css",
    "csv",
    "comment",
    "c_sharp",
    "dockerfile",
    "eex",
    "elixir",
    "erlang",
    "gdscript",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "glsl",
    "godot_resource",
    "heex",
    "html",
    "http",
    "ini",
    "java",
    "javascript",
    "json",
    "json5",
    "jsonc",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "sql",
    "ssh_config",
    "toml",
    "tsx",
    "typescript",
    "vimdoc",
    "yaml",
    "xml",
  },
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  --[[ context_commentstring = { ]]
  --[[   enable = true, ]]
  --[[   enable_autocmd = false, ]]
  --[[ }, ]]
  indent = {
    enable = true,
    disable = { "gdscript" },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ao"] = "@block.outer",
        ["io"] = "@block.inner",
      },
    },
  },
  endwise = {
    enable = true,
  },
})
