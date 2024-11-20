local M = {}

function M.printTable(t, indent)
  indent = indent or 0 -- 默认缩进为 0
  for key, value in pairs(t) do
    local prefix = string.rep(" ", indent) -- 缩进表示
    if type(value) == "table" then
      print(prefix .. tostring(key) .. ":")
      M.printTable(value, indent + 2) -- 递归调用，增加缩进
    else
      print(prefix .. tostring(key) .. " = " .. tostring(value))
    end
  end
end

return M
