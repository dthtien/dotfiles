require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/" },
    layout_strategy = 'bottom_pane'
  },
  pickers = {
    find_files = {
      hidden = true,
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    }
  }
})
