-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local opts = { noremap = true, silent = true }

local formatOnSave = function()
  -- 获取当前缓冲区的文件类型
  local file_type = vim.bo.filetype

  if file_type == "markdown" or file_type == "md" or file_type == "text" then
    -- 调用 pangu 进行文本调整
    vim.api.nvim_input("<cmd>PanguAll<cr><esc>")
  end
  require("lazyvim.util").format({ force = true })
  vim.api.nvim_input("<cmd>w<cr><esc>")
end

vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", formatOnSave, opts)

-- windows
-- Resize window using <alt> arrow keys 默认是 ctrl 但是在 tmux 没生效。所以换成了 alt
vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", opts)
vim.keymap.set("n", "-", "<cmd>split<cr>", opts)
vim.keymap.set("n", "<leader>q", ":q<cr>", opts)
vim.keymap.set("n", "<leader>wo", ":only<cr>", opts)

-- quickfix
-- 展示下一个文件中的第一个错误。]q 展示本文件的下一个错误。
vim.keymap.set("n", "]Q", ":cnfile<cr>", opts)
vim.keymap.set("n", "[Q", ":cpfile<cr>", opts)

vim.keymap.set("i", "<C-e>", "<End>", opts)
vim.keymap.set("i", "<C-b>", "<Left>", opts)
vim.keymap.set("i", "<C-f>", "<Right>", opts)
vim.keymap.set("i", "<C-a>", "<Home>", opts)
vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)

-- tabs
vim.keymap.set("n", "]t", "<cmd>tabnext<cr>", opts)
vim.keymap.set("n", "[t", "<cmd>tabprevious<cr>", opts)
vim.keymap.set("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>", opts)
