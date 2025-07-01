local group = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Create group
local general = group("General", { clear = true })

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = general,
  pattern = "*",
  command = [[:%s/\s\+$//e]]
})

-- Set filetype for .jbuilder files
autocmd({ "BufNewFile", "BufRead" }, {
  group = general,
  pattern = "*.jbuilder",
  command = "set filetype=ruby"
})

-- Press `q` to quit help
autocmd("FileType", {
  group = general,
  pattern = "help",
  command = "nnoremap <buffer> q :q<CR>"
})

-- JSON file conceal settings
autocmd("FileType", {
  group = general,
  pattern = "json",
  callback = function()
    vim.g.indentLine_setConceal = 0
    vim.g.vim_json_syntax_conceal = 0
  end
})
