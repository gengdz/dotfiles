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
      })

      opts.sources.compat = { "emoji" }
      opts.sources.providers.emoji = {
        name = "emoji",
        module = "blink.compat.source",
        score_offset = -4,
        transform_items = function(ctx, items)
          -- TODO: check https://github.com/Saghen/blink.cmp/pull/253#issuecomment-2454984622
          local kind = require("blink.cmp.types").CompletionItemKind.Text
          for i = 1, #items do
            items[i].kind = kind
          end
          return items
        end,
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
