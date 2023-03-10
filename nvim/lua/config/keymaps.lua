-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- 使用 Enter 插入空行。但是这样的快捷键会和 quickfix 冲突
-- vim.keymap.set("n", "<CR>", "o<Esc>", opts)

-- Resize window using <alt> arrow keys 默认是 ctrl 但是在 tmux 没生效。所以换成了 alt
vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- 退出当前窗口
vim.keymap.set("n", "<leader>q", ":q<cr>", opts)

-- quickfix
vim.keymap.set("n", "]Q", ":cnfile<cr>", opts)
vim.keymap.set("n", "[Q", ":cpfile<cr>", opts)

-- 复制全部内容
vim.keymap.set("n", "yie", ":%y<cr>", opts)
vim.keymap.set("n", "die", ":%d<cr>", opts)
vim.keymap.set("n", "vie", "ggVG", opts)

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
