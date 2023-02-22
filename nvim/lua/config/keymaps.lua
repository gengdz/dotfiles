-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local opts = { noremap = true, silent = true }

-- 使用 Enter 插入空行
map("n", "<CR>", "o<Esc>", opts)

-- 退出当前窗口
map("n", "<leader>q", ":q<cr>", opts)

-- n,N center
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- Insert --
map("i", "<C-a>", "<Home>", opts)
map("i", "<C-e>", "<End>", opts)
map("i", "<C-b>", "<Left>", opts)
map("i", "<C-f>", "<Right>", opts)

map("n", "H", "^", opts)
map("n", "L", "$", opts)
map("v", "H", "^", opts)
map("v", "L", "$", opts)

-- 【禁用】内置的 windows 快捷键。useless
vim.keymap.del("n", "<leader>ww", opts)
vim.keymap.del("n", "<leader>wd", opts)
vim.keymap.del("n", "<leader>w-", opts)
vim.keymap.del("n", "<leader>w|", opts)
vim.keymap.del("n", "<leader>-", opts)
vim.keymap.del("n", "<leader>|", opts)
