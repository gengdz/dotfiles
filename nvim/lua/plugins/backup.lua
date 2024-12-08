return {
  -- {
  --   "echasnovski/mini.surround",
  --   opts = function(_, opts)
  --     opts.mappings = vim.tbl_deep_extend("force", opts.mappings, {
  --       add = "ys", -- Add surrounding in Normal and Visual modes
  --       delete = "ds", -- Delete surrounding
  --       replace = "cs", -- Replace surrounding
  --     })
  --   end,
  -- },

  {
    "hrsh7th/nvim-cmp",
    enabled = false,
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-b>"] = cmp.mapping.abort(),
        ["<C-f>"] = cmp.mapping.abort(),
      })
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 1,
      })
    end,
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
}
