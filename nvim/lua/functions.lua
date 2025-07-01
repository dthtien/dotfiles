local M = {}

function M.run_test()
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%")

  if ft == "ruby" then
    vim.cmd("!bundle exec rspec " .. file)
  elseif ft == "go" then
    vim.cmd("!go test -v")
  elseif ft == "javascript.jsx" then
    vim.cmd("!yarn test " .. file)
  else
    print("Filetype " .. ft .. " not supported")
  end
end

function M.run_test_with_tag()
  local ft = vim.bo.filetype
  local tag = vim.fn.input("Input tag: ")

  if ft == "ruby" then
    vim.cmd("!bundle exec rspec --tag=" .. tag)
  elseif ft == "go" then
    vim.cmd("!go test -run " .. tag)
  else
    print("Filetype " .. ft .. " not supported")
  end
end

function M.delete_current_file_and_buffer()
  local file = vim.fn.expand("%")
  if vim.fn.filereadable(file) == 1 then
    vim.fn.delete(file)
    vim.cmd("bdelete!")
  else
    print("No file to delete.")
  end
end

return M
