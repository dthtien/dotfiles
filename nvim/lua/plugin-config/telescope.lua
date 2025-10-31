local actions = require("telescope.actions")

local open_after_tree = function(prompt_bufnr)
  vim.defer_fn(function()
    actions.select_default(prompt_bufnr)
  end, 100) -- Delay allows filetype and plugins to settle before opening
end

require('telescope').setup({
  defaults = {
    mappings = {
      i = { ["<CR>"] = open_after_tree },
      n = { ["<CR>"] = open_after_tree },
    },
    file_ignore_patterns = { "node_modules", ".git/" },
    layout_strategy = 'bottom_pane',
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    }
  }
})

