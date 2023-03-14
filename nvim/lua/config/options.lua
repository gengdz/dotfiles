-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.history = 1000
opt.list = false

-- 关闭拼写检查
opt.spell = false

opt.wrap = true

-- 自动切换输入法
vim.g.im_select_get_im_cmd = "['im-select']"
vim.g.im_select_default = "com.apple.keylayout.ABC"

-- 可以自动重新读取当前正在缓冲区但其内容变化了的文件
vim.o.autoread = true
