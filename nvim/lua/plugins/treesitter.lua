return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        disable = { "json" },
      },
      indent = {
        disable = { "json" },
      },
      incremental_selection = {
        disable = { "json" },
      },
      ensure_installed = {
        "css",
        "scss",
      },
    },
  },
}
