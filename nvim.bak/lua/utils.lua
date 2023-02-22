local M = {}

M.starts_with = function(str, start)
  return str:sub(1, #start) == start
end

M.ends_with = function(str, ending)
  return ending == "" or str:sub(- #ending) == ending
end


M.SaveAndExit = function()
  -- wirte all buffer first
  vim.api.nvim_command(":wa")
  -- quit all buffer
  vim.api.nvim_command(":qa")
end


return M

