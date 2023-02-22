require("nvim-tree").setup({
  open_on_setup = true,
  open_on_setup_file = true,
  open_on_tab = true,
  filters = {
    -- 不显示隐藏文件
    dotfiles = false,
    -- 自定义不显示的内容
    custom = { "^.git$","^node_modules$" },
    -- 显示的内容
    exclude = {},
  },
  git = {
    -- 用图标显示git 状态
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {

  },
})

