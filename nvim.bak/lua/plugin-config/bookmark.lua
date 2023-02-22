vim.g.bookmark_sign = '♥'
vim.g.bookmark_highlight_lines = 1


-- vim.keymap.set('n', 'ma', "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>")
-- vim.keymap.set('n', 'mn', "<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>")

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- map("n", "mc", "<cmd>Telescope vim_bookmarks current_file<cr>", opts)
map("n", "ma", "<cmd>Telescope vim_bookmarks all<cr>", opts)
