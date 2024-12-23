-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.history = 10000  -- 使用 :set history? 查看当前值是多少。我执行了下默认是 10000
vim.opt.list = false -- 不显示制表符
vim.opt.spell = false
-- vim.opt.wrap = true -- 自动换行
vim.opt.mousescroll = "ver:1,hor:4"

-- 可以自动重新读取当前正在缓冲区但其内容变化了的文件
vim.o.autoread = true

vim.g.deprecation_warnings = true
vim.g.autoformat = false
vim.g.ai_cmp = false
-- vim.g.snacks_animate = false
-- vim.g.lazyvim_blink_main = true

-- opt.nofoldenable = true
-- opt.foldmethod = "manual"

-- 在 init.lua 中定义 WSL 剪贴板模块
-- vim.g.clipboard = {
--   name = "WslClipboard",
--   copy = {
--     ["+"] = "clip.exe",
--     ["*"] = "clip.exe",
--   },
--   paste = {
--     ["+"] = [[powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))]],
--     ["*"] = [[powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))]],
--   },
--   cache_enabled = 0,
-- }
