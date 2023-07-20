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
    optional = true,
    opts = function(_, dashboard)
      local logo = [[]]
      dashboard.section.header.val = vim.split(logo, "\n")
      local buttons = {
        dashboard.button("e", " " .. " Explorer NeoTree", ":Neotree<CR>"),
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      }
      for _, button in ipairs(buttons) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      table.remove(dashboard.section.buttons.val, 1)
      table.insert(dashboard.section.buttons.val, 1, buttons[1])
      table.insert(dashboard.section.buttons.val, 2, buttons[2])
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    keys = {
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
