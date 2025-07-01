-- Load custom Lua modules
require("plugins")
require("keymaps")
require("functions")
require("lightline")
require("statusline")
require("autocmds")
require("plugin-config.lsp_config")
require("plugin-config.complete")
require("plugin-config.tree-sitter")
require("plugin-config.nvim_tree")

local opt = vim.opt
opt.encoding = "utf-8"
opt.hidden = true
opt.mouse = "a"
opt.completeopt = { "menu", "menuone" }
opt.pumblend = 20
opt.cursorline = true
opt.colorcolumn = "80"
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.swapfile = false
opt.joinspaces = false
opt.ttyfast = true
opt.laststatus = 2
opt.ttimeout = true
opt.ttimeoutlen = 10
opt.termguicolors = true
opt.ignorecase = true
opt.background = "dark"
opt.textwidth = 120
opt.listchars = { eol = '¬', tab = '>·', trail = '~', extends = '>', precedes = '<', space = '·' }
opt.list = false
opt.backspace = { "eol", "start", "indent" }
opt.whichwrap:append("<,>,h,l")
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.undofile = true
opt.undodir = vim.fn.stdpath("config") .. "/undo"
opt.undolevels = 1000
opt.undoreload = 10000
opt.splitright = true
opt.diffopt:append({ "iwhite", "vertical" })
opt.clipboard = "unnamed"
opt.shortmess:append("c")
opt.signcolumn = "yes"

-- Highlight links
vim.cmd [[highlight link CompeDocumentation NormalFloat]]

-- Enable filetype settings
vim.cmd [[filetype plugin indent on]]

vim.cmd.colorscheme("nightfly")

-- Source vimscript compatibility settings (to be gradually migrated)
-- vim.cmd [[source ~/.config/nvim/legacy.vim]]
