return {
  {
    "folke/noice.nvim",
    -- 这里注意一定是小写字母
    keys = {
      { "<c-f>", false, mode = { "i", "n", "s" } },
      { "<c-b>", false, mode = { "i", "n", "s" } },
    },
  },

  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[]]
      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("e", " " .. " Explorer NeoTree", ":Neotree<CR>"),
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 9
      return dashboard
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    keys = {
      -- 快速在buffer间跳转
      { "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>" },
      { "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>" },
      { "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>" },
      { "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>" },
      { "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>" },
      { "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>" },
      { "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>" },
      { "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>" },
      { "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>" },
      { "<leader>bp", "<Cmd>BufferLinePick<CR>" },

      -- 选择关闭buffer
      { "<leader>bc", "<Cmd>BufferLinePickClose<CR>" },

      -- 关闭除此外的所有buffer 理解为，bufer only
      { "<leader>bo", "<Cmd>BufferLineCloseLeft<CR><Cmd>BufferLineCloseRight<CR>" },

      -- 左右切换
      { "<S-j>", "<Cmd>BufferLineCyclePrev<CR>" },
      { "<S-k>", "<Cmd>BufferLineCycleNext<CR>" },
    },
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
}
