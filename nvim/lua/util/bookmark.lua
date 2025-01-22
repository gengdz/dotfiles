local M = {}

function M.trim(str)
  str = str:gsub("^%s+", "")
  str = str:gsub("%s+$", "")
  return str
end

function M.pad_right_or_cut(str, longest_width)
  -- 使用 Neovim 的 strwidth 函数获取实际显示宽度
  local width = vim.fn.strwidth(str)

  if width < longest_width then
    -- 如果当前宽度小于最长宽度，则在右边添加空格
    local formatted_text = str .. string.rep(" ", longest_width - width)
    return formatted_text
  else
    -- 如果宽度超过最长宽度，进行截取操作
    local truncated_text = str
    -- 循环直到我们得到的字符串宽度符合 longest_width
    while vim.fn.strwidth(truncated_text) > longest_width do
      truncated_text = truncated_text:sub(1, #truncated_text - 1)
    end

    return truncated_text -- 返回截取后的字符串
  end
end

function M.delete_bookmark(entry)
  vim.fn["bm_sign#del"](entry.file, tonumber(entry.sign_idx))
  vim.fn["bm#del_bookmark_at_line"](entry.file, tonumber(entry.lnum))
end

function M.get_bookmarks(files, opts)
  opts = opts or {}
  local bookmarks = {}

  for _, file in ipairs(files) do
    for _, line in ipairs(vim.fn["bm#all_lines"](file)) do
      local bookmark = vim.fn["bm#get_bookmark_by_line"](file, line)

      local text = bookmark.annotation ~= "" and "Annotation: " .. bookmark.annotation or bookmark.content
      if text == "" then
        text = "(empty line)"
      end

      local only_annotated = opts.only_annotated or false

      if not (only_annotated and bookmark.annotation == "") then
        if string.find(file, opts.cwd, 1, true) then
          table.insert(bookmarks, {
            file = file,
            filename = vim.fn.fnamemodify(file, ":t"), -- 得到文件名
            lnum = tonumber(line),
            col = 1,
            text = M.trim(text),
            sign_idx = bookmark.sign_idx,
          })
        end
      end
    end
  end

  return bookmarks
end

M.bookmarks_map = {}

return M
