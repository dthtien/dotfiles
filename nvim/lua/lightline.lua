local statusline = require("statusline")

vim.g.lightline = {
  colorscheme = "darcula",
  active = {
    left = { { "fileicon" }, { "filename" } },
    right = { { "icongitbranch" }, { "lineinfo" } }
  },
  inactive = {
    left = { {}, { "fileicon" }, { "filename" } },
    right = {}
  },
  component = {
    lineinfo = " %2p%% %3l:%-2v"
  },
  component_function = {
    fileicon = "v:lua.require'statusline'.get_filetype_icon",
    icongitbranch = "v:lua.require'statusline'.draw_git_branch",
    filename = "v:lua.require'statusline'.get_short_filename"
  }
}
