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
  -- { "liuchengxu/vim-which-key" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader><Space>",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

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
  -- {
    -- "sourcegraph/sg.nvim",
    -- dependencies = { "nvim-lua/plenary.nvim", [> "nvim-telescope/telescope.nvim <] },
  -- },

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
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
        }, {
          { name = 'buffer' },
        }),
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end,
  },
}
