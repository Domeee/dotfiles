require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "css",
        "comment",
        "c_sharp",
        "dockerfile",
        "eex",
        "elixir",
        "erlang",
        "gdscript",
        "git_rebase",
        "gitattributes",
        "gitignore",
        "godot_resource",
        "heex",
        "help",
        "html",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "yaml",
    },
    highlight = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    indent = {
        enable = true
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
})
