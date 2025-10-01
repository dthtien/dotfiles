local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Basic navigation and usability
map("i", "jk", "<ESC>", opts)
map("n", "<ESC><ESC>", ":nohlsearch<CR>", opts)
map("n", "q", "<Nop>", opts)
map("v", "<M-/>", "<Esc>/\\%V", opts)

-- Movement hints
map("n", "<Left>", ':echoe "Use h"<CR>', opts)
map("n", "<Right>", ':echoe "Use l"<CR>', opts)
map("n", "<Up>", ':echoe "Use k"<CR>', opts)
map("n", "<Down>", ':echoe "Use j"<CR>', opts)

-- Duplicate selection
map("v", "D", "y'>p", opts)

-- Emacs-style insert mode
map("i", "<C-n>", "<Down>", opts)
map("i", "<C-p>", "<Up>", opts)
map("i", "<C-f>", "<Right>", opts)
map("i", "<C-b>", "<Left>", opts)
map("i", "<C-e>", "<C-o>$", opts)
map("i", "<C-w>", "<C-o>^", opts)

-- Scrolling tweaks
map("n", "<C-k>", "<C-u>", opts)
map("n", "<C-j>", "<C-d>", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)

-- Fast copy
map("n", "Y", "y$", opts)

-- Leader key commands
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>l", ":vsplit<CR>", opts)
map("n", "<leader>k", ":split<CR>", opts)

map("n", "<leader>wh", ":wincmd h<CR>", opts)
map("n", "<leader>wl", ":wincmd l<CR>", opts)
map("n", "<leader>wk", ":wincmd k<CR>", opts)
map("n", "<leader>wj", ":wincmd j<CR>", opts)
map("n", "<leader>w=", ":wincmd =<CR>", opts)
map("n", "<leader>wb", ":e#<CR>", opts)

map("n", "<leader>qq", ":bd<CR>", opts)
map("n", "<leader>x", ":x<CR>", opts)
map("n", "<leader>ss", ":mksession! .work<CR>", opts)
map("n", "<leader>sr", ":so .work<CR>", opts)
map("n", "<leader><leader>r", ":so ~/.config/nvim/init.lua<CR>", opts)

-- NvimTree
map("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>f", ":NvimTreeFindFile<CR>", opts)
map("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

-- Tabs
map("n", "<leader>tn", ":tabn<CR>", opts)
map("n", "<leader>tp", ":tabp<CR>", opts)
map("n", "<leader>tc", ":tabe<CR>", opts)
map("n", "<leader>tx", ":tabclose<CR>", opts)

-- ChatGPT
map("n", "<leader>oc", ":ChatGPT<CR>", opts)

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Git
map("n", "<leader>gd", ":Git diff<CR>", opts)
map("n", "<leader>gw", ":Gwrite<CR>", opts)
map("n", "<leader>gds", ":Gdiffsplit<CR>", opts)
map("n", "<leader>gbl", ":Git blame<CR>", opts)
map("n", "<leader>gr", ":Gread<CR>", opts)
map("n", "<leader>gs", ":Gstatus<CR>", opts)

-- File path & formatter
map("n", "<leader>fp", ":let @+ = expand('%')<CR>", opts)
map("n", "<leader>fm", ":Neoformat<CR>", opts)

-- Diff mode
map("n", "<leader>1", ":diffget 1<CR>:diffupdate<CR>", opts)
map("n", "<leader>2", ":diffget 2<CR>:diffupdate<CR>", opts)

-- Markdown preview
map("n", "<C-v>", "<Plug>MarkdownPreview", {})

-- Telescope
map("n", "<leader>s", [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]], opts)
map("n", "<leader>sa", ":Telescope live_grep<CR>", opts)
map("n", "<leader>p", ":Telescope find_files<CR>", opts)
map("n", "<leader>h", ":Telescope oldfiles<CR>", opts)                         -- History
map("n", "<leader>F", ":Telescope git_files<CR>", opts)                        -- GFiles
map("n", "<leader>m", ":Telescope marks<CR>", opts)                            -- Marks
map("n", "<leader>P", [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]], opts)
map("n", "<leader>a", ":A<CR>", opts)
map("n", "<leader>S", "*:%s/\\<<C-r><C-w>\\>//g<Left><Left>", opts)

-- RSpec, Go bindings defined in Lua functions (next step)
map("n", "<leader>rt", ":lua require('functions').run_test()<CR>", opts)
map("n", "<leader>rwt", ":lua require('functions').run_test_with_tag()<CR>", opts)

-- delete file
map("n", "<leader>qk", ":lua require('functions').delete_current_file_and_buffer()<CR>", opts)

-- NERDCommenter
vim.g.NERDSpaceDelims = 1
map("n", "mm", "<Plug>NERDCommenterToggle", {})
map("v", "mm", "<Plug>NERDCommenterToggle", {})

-- incsearch.vim
-- map("n", "/", "<Plug>(incsearch-forward)", {})
-- map("n", "?", "<Plug>(incsearch-backward)", {})
-- map("n", "g/", "<Plug>(incsearch-stay)", {})
