return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        disable = { "json" },
        -- disable = function(lang, bufnr)
        --   local filesize = vim.fn.getfsize(vim.fn.expand("%:p"))
        --   return filesize > 1024 * 10
        -- end,
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
