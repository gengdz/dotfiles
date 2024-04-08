-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.history = 10000
opt.list = false

-- 关闭拼写检查
opt.spell = false

opt.wrap = true

vim.g.autoformat = false

-- 可以自动重新读取当前正在缓冲区但其内容变化了的文件
vim.o.autoread = true

-- opt.nofoldenable = true
-- opt.foldmethod = "manual"

-- 在 init.lua 中定义 WSL 剪贴板模块
vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = [[powershell.exe -c "[Console]::Out.Write($(Get-Clipboard -Raw).Replace('\r', ''))"]],
    ["*"] = [[powershell.exe -c "[Console]::Out.Write($(Get-Clipboard -Raw).Replace('\r', ''))"]],
  },
  cache_enabled = 0,
}
