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
        "bash",
        "help",
        "html",
        "css",
        "scss",
        "javascript",
        "json",
        "lua",
        "bash",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "tsx",
        "typescript",
        "vim",
      },
    },
    init = function()
      -- 开启 Folding
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
      -- 默认不要折叠
      -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
      vim.wo.foldlevel = 99
    end,
  },
}
