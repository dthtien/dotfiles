-- packer.nvim plugin setup
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- init setup
  use 'tpope/vim-sensible'

  -- Git stuff
  use 'tpope/vim-fugitive'

  -- Language support
  use 'othree/html5.vim'
  use 'cakebaker/scss-syntax.vim'
  use 'ap/vim-css-color'

  -- Rust
  use 'simrat39/rust-tools.nvim'

  -- LSP support
  use 'neovim/nvim-lspconfig'
  use 'mxw/vim-jsx'
  use 'sbdchd/neoformat'
  use 'rescript-lang/vim-rescript'

  -- Fancy UI stuff
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'itchyny/lightline.vim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Navigation
  use 'easymotion/vim-easymotion'

  -- Editing experience
  use 'hrsh7th/nvim-compe'
  use 'vim-scripts/matchit.zip'
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
  use 'haya14busa/incsearch.vim'
  use 'tpope/vim-abolish'
  use 'scrooloose/nerdcommenter'
  use 'tpope/vim-repeat'

  -- FZF and search
  use {
    'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end
  }
  use 'junegunn/fzf.vim'

  -- Keybinding helper
  use 'liuchengxu/vim-which-key'

  -- Project support
  use 'tpope/vim-projectionist'

  -- Indentation
  use 'Yggdroot/indentLine'

  -- JavaScript Import Helper
  use 'Galooshi/vim-import-js'

  -- Markdown Preview
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install' }

  -- Sourcegraph integration
  use {
    'sourcegraph/sg.nvim',
    run = 'nvim -l build/init.lua'
  }

  -- Augment
  use 'augmentcode/augment.vim'

  -- Telescope and dependencies
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Copilot Chat
  -- use 'CopilotC-Nvim/CopilotChat.nvim'

  -- Uncomment this to enable Copilot
  -- use { 'github/copilot.vim', branch = 'release' }
  -- Packer
  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })
end)
