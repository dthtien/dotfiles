-- require'nvim-tree'.setup {
  -- disable_netrw       = true,
  -- hijack_netrw        = true,
  -- open_on_setup       = true,
  -- ignore_ft_on_setup  = {},
  -- auto_close          = false,
  -- open_on_tab         = true,
  -- update_to_buf_dir   = {
    -- enable = true,
    -- auto_open = true,
  -- },
  -- hijack_cursor       = true,
  -- update_cwd          = false,
  -- diagnostics = {
    -- enable = true,
    -- icons = {
      -- hint = "",
      -- info = "",
      -- warning = "",
      -- error = "",
    -- }
  -- },
  -- update_focused_file = {
    -- enable      = false,
    -- update_cwd  = false,
    -- ignore_list = {}
  -- },
  -- system_open = {
    -- cmd  = nil,
    -- args = {}
  -- },
  -- view = {
    -- width = 40,
    -- height = 30,
    -- side = 'right',
    -- auto_resize = true,
    -- mappings = {
      -- custom_only = false,
      -- list = {}
    -- }
  -- }
-- }
--

require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  open_on_tab = true,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 40,
    -- hide_root_folder = false,
    side = "right",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    -- mappings = {
      -- custom_only = false,
      -- list = {
        -- -- user mappings go here
      -- },
    -- },
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
