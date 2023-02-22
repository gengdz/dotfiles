local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- require('telescope').setup{
--   defaults = {
--     file_ignore_patterns = {"node_modules",".git/*"},
--   },
--   pickers = {
--     find_files = {
--       theme = "dropdown",
--       find_command = { "fd", "-H" , "-I"},  -- "-H" search hidden files, "-I" do not respect to gitignore
--     },
--   },
--   extensions = {
--   },
--   builtin = {
--     find_files = {
--       no_ignore = false,
--     }
--   }
-- }
--
