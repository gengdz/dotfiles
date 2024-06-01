-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 不需要拼写检查
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "gitcommit", "markdown" },
--   callback = function()
--     vim.opt_local.spell = false
--     vim.wo.conceallevel = 0
--   end,
-- })

-- 设置终端的 TERM
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = { "*" },
  callback = function()
    local buf_name = vim.api.nvim_buf_get_name(0)

    if buf_name:match("/bin/zsh$") then
      -- 发送设置环境变量的命令
      vim.fn.chansend(vim.b.terminal_job_id, "export TERM=xterm-256color; clear\n")
    end
  end,
})

-- 取消换行注释
-- 用o换行不要延续注释
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    -- vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      + "r" -- But do continue when pressing enter.
  end,
})

-- 自动保存
-- 当离开 insert 模式，或者文本在 normal 模式中有变动时，自动将所有缓冲区中的变更写入到文件。
-- 其中 nested 是指该自动命令可以被其他 BufWrite 自动命令的事件所依赖
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "BufLeave" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})
