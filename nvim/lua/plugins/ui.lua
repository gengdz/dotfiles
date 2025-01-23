return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
      bigfile = {
        size = 100 * 1024,
      },
      terminal = {
        win = {
          position = "float",
        },
      },
      scroll = { enabled = false },
      lazygit = {
        config = {
          os = {
            editPreset = "nvim-remote",
            edit = '[ -z "$NVIM" ] && (nvim -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{filename}})',
          },
        },
      },
      gitbrowse = {
        url_patterns = {
          ["gitlab%.alibaba%-inc%.com"] = {
            branch = "/tree/{branch}",
            file = "/blob/{branch}/{file}#L{line_start}",
            commit = "/commit/{commit}",
          },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    -- 这里注意一定是小写字母
    keys = {
      { "<c-f>", false, mode = { "i", "n", "s" } },
      { "<c-b>", false, mode = { "i", "n", "s" } },
    },
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
