local Util = require("lazyvim.util")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["o"] = "open",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
        },
      },
    },
  },

  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", Util.telescope("find_files"), desc = "Find Plugin File" },
      { "<leader>fg", Util.telescope("live_grep"), desc = "Find in Files (Grep)" },
      { "<leader>fb", Util.telescope("buffers"), desc = "Find in Buffers" },
      { "<leader>fo", Util.telescope("oldfiles"), desc = "Find in Old Files" },
    },
  },

  -- add telescope-fzf-native
  -- {
  --   "telescope.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope-fzf-native.nvim",
  --     build = "make",
  --     config = function()
  --       require("telescope").load_extension("fzf")
  --     end,
  --   },
  -- },
  --
  {
    "phaazon/hop.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "s", "<cmd>HopChar2<cr>" },
    },
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install", -- build 会失败，我手动执行了这一步。
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_command_for_global = 1
      -- vim.g.mkdp_auto_close = 0
      -- vim.g.mkdp_theme = "dark"
    end,
    ft = { "markdown" },
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<cr>" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs` 显示变更的符号如 + -
      numhl = true, -- Toggle with `:Gitsigns toggle_numhl` 显示变更的行号
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl` 高亮显示变更的的行
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff` 在两行显示变更前后的内容
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame` 显示该行的提交记录
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 200,
        ignore_whitespace = false,
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>dv", "<cmd>DiffviewOpen<cr>" },
    },
  },
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "ma", "<Cmd>Telescope vim_bookmarks all<CR>" },
    },
    opts = {},
  },

  {
    "MattesGroeger/vim-bookmarks",
    lazy = true,
    event = "VeryLazy",
    init = function()
      vim.g.bookmark_sign = "♥"
      vim.g.bookmark_highlight_lines = 1
    end,
  },

  { "ggandor/flit.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "folke/todo-comments.nvim", enabled = false },
}
