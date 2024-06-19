return {
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
    "tiagovla/scope.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      vim.opt.sessionoptions = { -- required
        "buffers",
        "tabpages",
        "globals",
      }
      -- init.lua
      require("scope").setup({})
    end,
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
      opts.grep = vim.tbl_deep_extend("force", opts.grep, {
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
        fzf_opts = {
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
        },
      })

      opts.keymap = {
        builtin = {
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
          ["<F1>"] = "toggle-help",
        },
        fzf = {
          ["ctrl-j"] = "next-history",
          ["ctrl-k"] = "prev-history",
          ["ctrl-n"] = "down",
          ["ctrl-p"] = "up",
        },
      }
      local config = require("fzf-lua.config")
      local actions = require("fzf-lua.actions")
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
          local G = require("util/plugin")
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
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
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
    "tom-anders/telescope-vim-bookmarks.nvim",
    enabled = false,
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "ma", "<Cmd>Telescope vim_bookmarks all<CR>" },
    },
    opts = {},
  },
  { "folke/todo-comments.nvim", enabled = false },
}
