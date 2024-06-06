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
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
          },
        },
      },
    },
  },
  {
    "tiagovla/scope.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      vim.opt.sessionoptions = { -- required
        "buffers",
        "tabpages",
        "globals",
      }
      require("telescope").load_extension("scope")
      -- init.lua
      require("scope").setup({})
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        keys = {
          {
            "<leader>sg",
            function()
              local cwd = require("lazyvim.util").root()
              require("telescope").extensions.live_grep_args.live_grep_args({ search_dirs = { cwd } })
            end,
            desc = "Grep (root dir)",
          },
        },
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
      },
      {
        "ahmedkhalf/project.nvim",
        opts = {
          manual_mode = false,
        },
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<c-k>"] = function(prompt_bufnr)
              return require("telescope-live-grep-args.actions").quote_prompt()(prompt_bufnr)
            end,
            ["<c-t>"] = "select_tab",
          },
        },
      },
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
    keys = {
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>" },
      { "<leader>gdh", "<cmd>DiffviewFileHistory %<cr>" },
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
      vim.g.bookmark_sign = "♥ "
      vim.g.bookmark_highlight_lines = 1
      vim.g.bookmark_save_per_working_dir = 1
      vim.g.bookmark_auto_save = 1
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<Cmd>TmuxNavigateLeft<CR>" },
      { "<C-h>", "<Cmd>TmuxNavigateRight<CR>" },
      { "<C-h>", "<Cmd>TmuxNavigateDown<CR>" },
      { "<C-h>", "<Cmd>TmuxNavigateUp<CR>" },
    },
  },
  { "folke/todo-comments.nvim", enabled = false },
}
