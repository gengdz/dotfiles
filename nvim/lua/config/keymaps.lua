-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- Resize window using <alt> arrow keys 默认是 ctrl 但是在 tmux 没生效。所以换成了 alt
vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- 退出当前窗口
vim.keymap.set("n", "<leader>q", ":q<cr>", opts)

local formatOnSave = function()
  -- -- 获取当前缓冲区的文件类型
  -- local file_type = vim.bo.filetype
  --
  -- -- 如果文件类型是 Markdown (.md)
  -- if file_type == "markdown" or file_type == "md" then
  --   -- 调用 pangu 进行文本调整
  --   vim.api.nvim_input("<cmd>PanguAll<cr><esc>")
  -- end
  require("lazyvim.util").format({ force = true })
  vim.api.nvim_input("<cmd>w<cr><esc>")
end

vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", formatOnSave, opts)

-- quickfix
-- 展示下一个文件中的第一个错误。]q 展示本文件的下一个错误。
vim.keymap.set("n", "]Q", ":cnfile<cr>", opts)
vim.keymap.set("n", "[Q", ":cpfile<cr>", opts)

-- 复制全部内容
vim.keymap.set("n", "yie", ":%y<cr>", opts)
vim.keymap.set("n", "die", ":%d<cr>", opts)
vim.keymap.set("n", "vie", "ggVG", opts)

-- n,N center
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)

vim.keymap.set("i", "<C-e>", "<End>", opts)
vim.keymap.set("i", "<C-b>", "<Left>", opts)
vim.keymap.set("i", "<C-f>", "<Right>", opts)
vim.keymap.set("i", "<C-a>", "<Home>", opts)

vim.keymap.set("n", "<leader>wo", ":only<cr>", opts)
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", opts)
