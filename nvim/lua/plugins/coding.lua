return {
  {
    "saghen/blink.cmp",
    dependencies = {
      { "saghen/blink.compat", lazy = true },
      { "hrsh7th/cmp-emoji", lazy = true },
    },
    opts = function(_, opts)
      opts.keymap = vim.tbl_deep_extend("force", opts.keymap, {
        ["<C-e>"] = { "fallback" },
        ["<C-b>"] = { "fallback" },
        ["<C-f>"] = { "fallback" },
      })

      table.insert(opts.sources.compat, "emoji")
      opts.sources.providers.emoji = {
        score_offset = -4,
        kind = require("blink.cmp.types").CompletionItemKind.Text,
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
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
    "keaising/im-select.nvim",
    opts = {
      default_command = "im-select",
      set_default_events = { "TermLeave", "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
    },
  },
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
}
