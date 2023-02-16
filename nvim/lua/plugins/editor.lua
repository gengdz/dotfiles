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
      -- {
      --   "<leader>ff",
      --   function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
      --   desc = "Find Plugin File",
      -- },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  {
    "phaazon/hop.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "s", "<cmd>HopChar2<cr>" },
    },
    opts = {},
  },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   lazy = true,
  --   event = "VeryLazy",
  --   opts = {},
  --   build = function()
  --     vim.fn["mkdp#util#install"]()
  --   end,
  -- },
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

  { "ggandor/flit.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "folke/todo-comments.nvim", enabled = false },
}
