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
    "folke/snacks.nvim",
    opts = function(_, snacks)
      local dashboard = snacks.dashboard
      dashboard.preset.keys = vim.tbl_deep_extend("force", dashboard.preset.keys, {
        {
          action = ":Neotree<CR>",
          desc = " Explorer NeoTree",
          icon = " ",
          key = "e",
          key_format = "  %s",
        },
      })
      dashboard.sections = {
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      }
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
