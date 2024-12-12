return {
  { "folke/todo-comments.nvim", enabled = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
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
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
    },
  },
  {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    opts = function(_, opts)
      local config = require("fzf-lua.config")
      local actions = require("fzf-lua.actions")

      opts.grep = vim.tbl_deep_extend("force", opts.grep, {
        no_header = true,
        rg_glob = true,
        rg_glob_fn = function(query, _opts)
          local regex, flags = query:match("^(.-)%s%-%-(.*)$")
          -- If no separator is detected will return the original query
          return (regex or query), flags
        end,
        fzf_opts = {
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
        },
      })

      opts.files = vim.tbl_deep_extend("force", opts.files, {
        no_header = true,
        fzf_opts = {
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
        },
      })

      config.defaults.keymap.fzf["ctrl-j"] = "next-history"
      config.defaults.keymap.fzf["ctrl-k"] = "prev-history"
      config.defaults.keymap.fzf["ctrl-n"] = "down"
      config.defaults.keymap.fzf["ctrl-p"] = "up"
      config.defaults.actions.files["ctrl-t"] = actions.file_tabedit
    end,
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
          local fzf_lua = require("fzf-lua")
          local cwd = require("lazyvim.util").root()
          local G = require("util.bookmark")
          local bookmarks = G.get_bookmarks(vim.fn["bm#all_files"](), { cwd = cwd })

          local lines = {}
          for _, bookmark in ipairs(bookmarks) do
            local filename = vim.fn.fnamemodify(bookmark.filename, ":t") -- 得到文件名
            local line = string.format(
              "%s ┃ %s ┃ %s",
              G.pad_right_or_cut(string.format("%d", bookmark.lnum), 4),
              G.pad_right_or_cut(bookmark.text, 60),
              filename
            )
            table.insert(lines, line)
            G.bookmarks_map[line] = bookmark
          end

          fzf_lua.fzf_exec(lines, {
            winopts = {
              title = "Bookmarks",
              title_pos = "center",
              preview = {
                horizontal = "right:40%",
                layout = "horizontal",
              },
            },
            previewer = G.MyPreviewer,
            actions = {
              ["default"] = function(selected, opts)
                local line, text, file = selected[1]:match("(%d+)%s+┃%s+(.-)%s+┃%s+(.+)")
                local path = G.bookmarks_map[selected[1]].filename
                fzf_lua.actions.file_edit({ string.format("%s:%s:%s", path, line, 1) }, opts)
              end,
              ["ctrl-x"] = function(selected, opts)
                local entry = G.bookmarks_map[selected[1]]
                G.delete_bookmark(entry)
                vim.api.nvim_input("ma")
              end,
            },
          })
        end,
        desc = "Bookmarks all marks",
      },
    },
  },
}
