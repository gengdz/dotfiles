return {
  { "folke/todo-comments.nvim", enabled = false },
  {
    "monaqa/dial.nvim",
    opts = function(_, opts)
      table.remove(opts.groups.default, 2)
    end,
  },
  {
    "tiagovla/scope.nvim",
    lazy = true,
    event = "VeryLazy",
    config = true,
    -- config = function()
    --   vim.opt.sessionoptions = { -- required
    --     "buffers",
    --     "tabpages",
    --     "globals",
    --   }
    --   -- init.lua
    --   require("scope").setup({})
    -- end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = {
      filesystem = {
        find_args = { -- you can specify extra args to pass to the find command.
          fd = {
            "--ignore",
            "--exclude",
            ".git",
          },
        },
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
    "echasnovski/mini.files",
    opts = {
      -- options = {
      --   -- Whether to use for editing directories
      --   -- Disabled by default in LazyVim because neo-tree is used for that
      --   -- use_as_default_explorer = true,
      -- },
      mappings = {
        synchronize = "<C-s>",
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
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<Cmd>TmuxNavigateLeft<CR>" },
      { "<C-h>", "<Cmd>TmuxNavigateRight<CR>" },
      { "<C-h>", "<Cmd>TmuxNavigateDown<CR>" },
      { "<C-h>", "<Cmd>TmuxNavigateUp<CR>" },
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>fr", LazyVim.pick("oldfiles", { filter = { cwd = true } }), desc = "Recent (cwd)" },
      { "<leader>fR", LazyVim.pick("oldfiles"), desc = "Recent" },
    },
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["<c-j>"] = { "history_forward", mode = { "i", "n" } },
              ["<c-k>"] = { "history_back", mode = { "i", "n" } },
              ["<c-t>"] = { "edit_tab", mode = { "i", "n" } },
            },
          },
          list = {
            keys = {
              ["<c-t>"] = { "edit_tab", mode = { "i", "n" } },
            },
          },
        },
        sources = {
          grep = {
            hidden = true,
            follow = true,
          },
          files = {
            hidden = true,
            follow = true,
          },
          explorer = {
            hidden = true,
            ignored = true,
            exclude = { "node_modules", ".git" },
          },
        },
        formatters = {
          file = {},
        },
      },
    },
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
    keys = {
      {
        "ma",
        function()
          local G = require("util.bookmark")
          local cwd = require("lazyvim.util").root()
          local bookmarks = G.get_bookmarks(vim.fn["bm#all_files"](), { cwd = cwd })

          local itmes = {}
          for i, bookmark in ipairs(bookmarks) do
            local item = {
              idx = i,
              score = i,
              text = bookmark.text,
              file = bookmark.file,
              lnum = bookmark.lnum,
              filename = bookmark.filename,
              pos = { [1] = bookmark.lnum, [2] = 1 },
              map_key = string.format("%d:%s:%s", bookmark.lnum, bookmark.text, bookmark.file),
            }
            table.insert(itmes, item)
            G.bookmarks_map[item.map_key] = bookmark
          end
          return Snacks.picker.pick({
            source = "Bookmarks",
            title = "Bookmarks",
            items = itmes,
            format = function(item)
              local ret = {}
              Snacks.picker.highlight.format(item, G.pad_right_or_cut(item.text, 45), ret)
              ret[#ret + 1] = { " ┃ ", "SnacksPickerComment" }
              ret[#ret + 1] = { item.filename, "Text" }
              -- ret[#ret + 1] = {
              --   Snacks.picker.util.truncpath(item.file, 30),
              --   "Text",
              -- }

              return ret
            end,
            confirm = { "jump", "close" },
            actions = {
              delete_bookmark = function(picker, item)
                picker:close()
                local entry = G.bookmarks_map[item.map_key]
                G.delete_bookmark(entry)
                -- vim.api.nvim_input("ma") -- 如果不加延迟，会导致删除报错
                vim.defer_fn(function()
                  vim.api.nvim_input("ma")
                end, 100)
              end,
            },
            win = {
              input = {
                keys = {
                  ["<c-x>"] = { "delete_bookmark", desc = "delet bookmark", mode = { "i", "n" } },
                },
              },
            },
          })
        end,
        desc = "Bookmarks all marks",
      },
    },
  },
}
