-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- 使用 Enter 插入空行。但是这样的快捷键会和 quickfix 冲突。所以先注释
-- vim.keymap.set("n", "<CR>", "o<Esc>", opts)

-- 退出当前窗口
vim.keymap.set("n", "<leader>q", ":q<cr>", opts)

-- quickfix
vim.keymap.set("n", "]q", ":cnext<cr>", opts)
vim.keymap.set("n", "[q", ":cprev<cr>", opts)
vim.keymap.set("n", "]Q", ":cnfile<cr>", opts)
vim.keymap.set("n", "[Q", ":cpfile<cr>", opts)

-- 复制全部内容
vim.keymap.set("n", "yie", ":%y<cr>", opts)

-- n,N center
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)

-- Insert --
vim.keymap.set("i", "<C-a>", "<Home>", opts)
vim.keymap.set("i", "<C-e>", "<End>", opts)
vim.keymap.set("i", "<C-b>", "<Left>", opts)
vim.keymap.set("i", "<C-f>", "<Right>", opts)

vim.keymap.set("n", "H", "^", opts)
vim.keymap.set("n", "L", "$", opts)
vim.keymap.set("v", "H", "^", opts)
vim.keymap.set("v", "L", "$", opts)

-- 【禁用】内置的 windows 快捷键。useless
vim.keymap.set("n", "<leader>ww", "<Nop>")
-- vim.keymap.del("n", "<leader>ww")
-- vim.keymap.del("n", "<leader>wd")
-- vim.keymap.del("n", "<leader>w-")
-- vim.keymap.del("n", "<leader>w|")
-- vim.keymap.del("n", "<leader>-")
-- vim.keymap.del("n", "<leader>|")
