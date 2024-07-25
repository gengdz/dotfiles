return {
  {
    "hotoo/pangu.vim",
    ft = { "markdown", "text" },
    lazy = true,
    event = "VeryLazy",
    enabled = false,
  },
  -- {
  --   "stevearc/conform.nvim",
  --   optional = true,
  --   opts = {
  --     formatters_by_ft = {
  --       markdown = { "pangu", "prettier" },
  --     },
  --     formatters = {
  --       pangu = {
  --         command = "/home/xingya/.local/share/pnpm/pangu",
  --         args = { "-f", "$FILENAME" },
  --       },
  --     },
  --   },
  -- },
}
