require('nvim-treesitter.configs').setup({
  -- 支持的语言
  ensure_installed = {"html", "scss", "vim", "help", "bash", "c", "cpp", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "markdown", "markdown_inline" },

  -- 启用代码高亮
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },

  --启用增量选择
  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>'
    }
  },

  -- 启用基于 Treesitter 的代码格式化(=)
  indent = {
    enable = true
  },

  autopairs = {
    enable = true,
  },

  -- 不同括号颜色区分
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
})

 -- 开启 Folding
 vim.wo.foldmethod = "expr"
 vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
 -- 默认不要折叠
 -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
 vim.wo.foldlevel = 99
