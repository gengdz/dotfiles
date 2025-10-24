return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "moyiz/blink-emoji.nvim",
    },
    opts = function(_, opts)
      opts.keymap = vim.tbl_deep_extend("force", opts.keymap, {
        ["<C-e>"] = { "fallback" },
        ["<C-b>"] = { "fallback" },
        ["<C-f>"] = { "fallback" },
      })

      table.insert(opts.sources.default, "emoji")
      opts.sources.providers.emoji = {
        module = "blink-emoji",
        name = "Emoji",
        score_offset = 15, -- Tune by preference
        opts = {
          insert = true, -- Insert emoji (default) or complete its name
          ---@type string|table|fun():table
          trigger = function()
            return { ":" }
          end,
        },
        should_show_items = function()
          return vim.tbl_contains(
            -- Enable emoji completion only for git commits and markdown.
            -- By default, enabled for all file-types.
            { "gitcommit", "markdown" },
            vim.o.filetype
          )
        end,
      }

      -- -- table.insert(opts.sources.default, "codecompanion")
      -- table.insert(opts.sources.compat, "codecompanion")
      -- opts.sources.providers.codecompanion = {
      --   name = "CodeCompanion",
      --   module = "codecompanion.providers.completion.blink",
      --   kind = "CodeCompanion",
      --   score_offset = 100,
      --   async = true,
      -- }
    end,
  },
  {
    "keaising/im-select.nvim",
    opts = {
      default_command = "im-select",
      set_default_events = {
        "TermEnter",
        "TermLeave",
        "InsertLeave",
        "InsertEnter",
        "VimEnter",
        "FocusGained",
        "CmdlineEnter",
        "CmdlineLeave",
      },
    },
  },
}
