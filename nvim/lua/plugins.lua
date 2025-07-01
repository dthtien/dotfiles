return {
  -- Sensible defaults
  { "tpope/vim-sensible" },

  -- Git
  { "tpope/vim-fugitive" },

  -- Language support
  { "othree/html5.vim" },
  { "cakebaker/scss-syntax.vim" },
  { "ap/vim-css-color" },

  -- Rust
  { "simrat39/rust-tools.nvim" },

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "mxw/vim-jsx" },
  { "sbdchd/neoformat" },
  { "rescript-lang/vim-rescript" },

  -- UI
  { "ryanoasis/vim-devicons" },
  { "kyazdani42/nvim-web-devicons" },
  { "kyazdani42/nvim-tree.lua" },
  { "itchyny/lightline.vim" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- Navigation
  { "easymotion/vim-easymotion" },

  -- Editing experience
  { "hrsh7th/nvim-compe" },
  { "vim-scripts/matchit.zip" },
  { "tpope/vim-surround" },
  { "jiangmiao/auto-pairs" },
  { "haya14busa/incsearch.vim" },
  { "tpope/vim-abolish" },
  { "scrooloose/nerdcommenter" },
  { "tpope/vim-repeat" },

  -- FZF
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end
  },
  { "junegunn/fzf.vim" },

  -- Keybinding helper
  { "liuchengxu/vim-which-key" },

  -- Project structure
  { "tpope/vim-projectionist" },

  -- Indentation
  { "Yggdroot/indentLine" },

  -- JS import
  { "Galooshi/vim-import-js" },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" }
  },

  -- Sourcegraph
  {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]] },
  },

  -- Augment
  -- { "augmentcode/augment.vim" },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },
  { "nvim-lua/plenary.nvim" },

  -- Optional Copilot Chat
  -- { "CopilotC-Nvim/CopilotChat.nvim" },
  { "github/copilot.vim", branch = "release" },

  -- ChatGPT.nvim
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("chatgpt").setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<C-Space>"] = cmp.mapping.complete(),
      })
    end,
  }
}
