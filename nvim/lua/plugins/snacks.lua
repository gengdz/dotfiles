return {
  { "indent-blankline.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = {
        size = 100 * 1024,
      },
      terminal = {
        win = {
          position = "float",
        },
      },
      input = {},
      indent = {
        scope = {
          treesitter = {
            -- blocks = true,
            enabled = true,
          },
        },
      },
      scroll = {},
    },
  },
}
