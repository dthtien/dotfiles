require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
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
    "html"
  },
}
