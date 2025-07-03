require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "typescript",
    "toml",
    "ruby",
    "javascript",
    "json",
    "yaml",
    "html",
    "lua",
    "vim",
    "sql",
    "query"
  },
}
