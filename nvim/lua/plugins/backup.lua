return {
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
