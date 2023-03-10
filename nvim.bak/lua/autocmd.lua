local nvimrc = vim.api.nvim_create_augroup("NVIMRC", {clear = true})
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = "init.lua",
  group = nvimrc,
  command = "source %"
})

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = "init.lua",
  group = nvimrc,
  callback = function()
    vim.o.path = vim.o.path .. ",**/*"
  end
})

if vim.fn.has "nvim-0.7" then
  local nvimrc = vim.api.nvim_create_augroup("NVIMRC", {clear = true})
  vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = "init.lua",
    group = nvimrc,
    command = "source %"
  })

  vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = "init.lua",
    group = nvimrc,
    callback = function()
      vim.o.path = vim.o.path .. ",**/*"
    end
  })
else
  vim.cmd[[
    augroup NVIMRC
    autocmd!
    autocmd BufWritePost init.lua source %
    autocmd BufReadPost init.lua set path+=**/*
    augroup END
    ]]
end
