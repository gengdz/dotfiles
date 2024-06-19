local M = {}

function M.trim(str)
  str = str:gsub("^%s+", "")
  str = str:gsub("%s+$", "")
  return str
end

function M.pad_right_or_cut(str, len)
  if #str > len then
    return string.sub(str, 1, len) -- 截取 str 到 len 个字符的内容
  elseif #str < len then
    return str .. string.rep(" ", len - #str) -- 如果 str 长度小于 len，补全到 len
  else
    return str -- 如果 str 长度等于 len，不做修改
  end
end

function M.delete_bookmark(entry)
  vim.fn["bm_sign#del"](entry.filename, tonumber(entry.sign_idx))
  vim.fn["bm#del_bookmark_at_line"](entry.filename, tonumber(entry.lnum))
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
            -- filename = file:sub(#opts.cwd + 2),
            filename = file,
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

local builtin = require("fzf-lua.previewer.builtin")

-- Inherit from the "buffer_or_file" previewer
local MyPreviewer = builtin.buffer_or_file:extend()

function MyPreviewer:new(o, opts, fzf_win)
  MyPreviewer.super.new(self, o, opts, fzf_win)
  setmetatable(self, MyPreviewer)
  return self
end

function MyPreviewer:parse_entry(entry_str)
  local line, text, file = entry_str:match("(%d+)%s+┃%s+(.-)%s+┃%s+(.+)")
  local path = M.bookmarks_map[entry_str].filename
  return {
    path = path,
    line = tonumber(line) or 1,
    col = 1,
  }
end

M.MyPreviewer = MyPreviewer

return M
