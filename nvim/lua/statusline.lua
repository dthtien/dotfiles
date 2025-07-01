local M = {}

function M.draw_git_branch()
  local branch = vim.fn["fugitive#Head"]()
  return branch ~= "" and " " .. branch or ""
end

function M.get_filetype_icon()
  if vim.fn.winwidth(0) > 70 then
    return vim.bo.filetype ~= "" and vim.fn["WebDevIconsGetFileTypeSymbol"]() or ""
  else
    return ""
  end
end

function M.get_short_filename()
  local path = vim.fn.expand("%")
  if path == "" then return "" end

  local parts = vim.split(path, "/")
  local short_path = ""

  for i, part in ipairs(parts) do
    local parent = short_path
    if i == #parts then
      short_path = parent ~= "" and (parent .. "/" .. part) or part
    elseif i == 1 then
      short_path = part
    else
      short_path = parent .. "/" .. string.sub(part, 1, 10)
    end
  end

  return short_path
end

return M
