local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

require('lspsaga').setup({
  ui = {
    border = 'rounded',
  }
})


-- 显示注释文档
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename 
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")

-- 跳转到声明
-- keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")

-- keymap('n', '<leader>u', vim.lsp.buf.references, opts)


-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")


-- Toggle outline
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")

