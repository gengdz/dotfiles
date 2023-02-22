local Toggleterm = require("toggleterm")

Toggleterm.setup(
    {
        -- 开启的终端默认进去插入模式
        start_in_insert = true,
        -- 设置终端大小
        size = 6,
        -- 打开终端时，关闭拼写检查
        on_open = function()
            vim.cmd("setlocal nospell")
        end
    }
)

-- 新建终端
local Terminal = require("toggleterm.terminal").Terminal

local function inInsert()
    -- 删除ESC 映射
    dmap("t", "<Esc>")
end

-- 新建浮动终端
local floatTerm =:new(
    {
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double"
        },
        on_open = function(term)
            inInsert()
            bmap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>:close<CR>", opts)
        end,

        on_close = function()
            -- 重新映射Esc
            map("t", "<Esc>", "<C-\\><C-n>", opts)
        end
    }
)


-- 新建lazygit 终端
local lazygit = Terminal:new(
    {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double"
        },

        on_open = function(term)
            inInsert()
            bmap(term.bufnr, "i", "q", "<cmd>close<CR>", opts)
        end,

        on_close = function()
            -- 重新映射Esc
            map("t", "<Esc>", "<C-\\><C-n>", opts)
        end
    }
)

-- 定义方法开启终端
Toggleterm.float_toggle = function()
    floatTerm:toggle()
end

Toggleterm.lazygit_toggle = function()
    lazygit:toggle()
end
