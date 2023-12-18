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
    "nvimdev/dashboard-nvim",
    opts = function(_, dashboard)
      local buttons = {
        {
          action = ":Neotree<CR>",
          desc = " Explorer NeoTree",
          icon = " ",
          key = "e",
          key_format = "  %s",
        },
      }
      dashboard.config.header = vim.split(string.rep("\n", 8) .. [[]] .. "\n\n", "\n")
      dashboard.config.center[1].icon = " "
      dashboard.config.center[8] = buttons[1]
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
}
