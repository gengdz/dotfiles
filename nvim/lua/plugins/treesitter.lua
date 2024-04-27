return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    -- dependencies = {
    --   { "windwp/nvim-ts-autotag" },
    -- },
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
        "lua",
        "css",
        "scss",
        "vimdoc",
        "html",
        "javascript",
      },
      autotag = {
        enable = true,
      },
    },
  },
}
