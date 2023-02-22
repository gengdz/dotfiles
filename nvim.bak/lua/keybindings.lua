map = vim.api.nvim_set_keymap
dmap = vim.api.nvim_del_keymap
bmap = vim.api.nvim_buf_set_keymap
opts = { noremap = true, silent = true }

-- 之后就可以这样映射按键了
-- map('模式' , '按键' , '映射为XX' , opts)
-- 模式：
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", 
--   command_mode = "c",


-- 打开和保存配置文件
map("n", "<leader>co", ":vs $MYVIMRC<CR>", opts)
map("n", "<leader>cs", ":wq<CR>:source $MYVIMRC<CR>", opts)

-- 在插入模式下使删除键失效
-- map("i", "<bs>", "<nop>", opts)


-- 分屏 s 理解成 split
-- map("n", "sv", ":vsp<CR>", opts)
-- map("n", "sh", ":sp<CR>", opts)
-- map("n", "sc", ":close<CR>", opts)
-- map("n", "so", ":only<CR>", opts)

-- 窗口切换
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- 窗口大小 size -> s
map("n", "sj", ":resize +5<CR>", opts)
map("n", "sk", ":resize -5<CR>", opts)
map("n", "sl", ":vertical resize +5<CR>", opts)
map("n", "sh", ":vertical resize -5<CR>", opts)


-- 使用 Enter 插入空行
map("n", "<CR>", "o<Esc>", opts)

-- FileExpoless
map("n", "<leader>et", ":NvimTreeToggle<cr>", opts)
map("n", "<leader>ef", ":NvimTreeFindFile<cr>", opts)

-- 查找文件
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
-- map("n", "<Space>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- map("n", "<Space>f", "<cmd>lua require('telescope').extensions.frecency.frecency(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
-- map("n", "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<cr>", opts)

-- 取消高亮
map("n", "<ESC>", ":nohlsearch<cr>", opts)

-- 保存
map("n", "<C-s>", ":wa!<cr>", opts)
map("n", "<leader>w", ":wa!<cr>", opts)

-- 退出当前窗口
map("n", "<leader>q", ":q<cr>", opts)

-- delete cur buffer
map("n", "<leader>d", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
map("n", "<leader>D", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
-- exit whole program
map("n", "ZZ", ":lua require('utils').SaveAndExit()<cr>", opts)

-- center cursor
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)
-- map("n", "j", "jzz", opts)
-- map("n", "k", "kzz", opts)

-- toggleterm 绑定
-- 打开普通终端
map("n", "<leader>tt", "<cmd>exe v:count.'ToggleTerm'<CR>", opts)
-- 退出终端插入模式
map("t", "<Esc>", "<C-\\><C-n>", opts)
-- 进入浮动式终端
map("n", "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<CR>", opts)
-- 打开lazygit
map("n", "<leader>tg", "<cmd>lua require('toggleterm').lazygit_toggle()<CR>", opts)
-- 打开或者关闭所有终端
map("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", opts)
-- undotree 撤销更改

map("n", "<leader>u", ":UndotreeToggle<CR>", opts)


map("n", "H", "^", opts)
map("n", "L", "$", opts)
map("v", "H", "^", opts)
map("v", "L", "$", opts)

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
map("i", "jj", "<ESC>", opts)
map("i", "<C-a>", "<Home>", opts)
map("i", "<C-e>", "<End>", opts)
map("i", "<C-b>", "<Left>", opts)
map("i", "<C-f>", "<Right>", opts)

-- Visual --
-- 使用 < > 进行代码缩进
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- 单行或多行移动
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

map("v", "p", '"_dP', opts)


-- git diff view
map('n', '<leader>j', ']c', opts)
map('n', '<leader>k', '[c', opts)


