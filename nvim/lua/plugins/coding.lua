return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = vim.tbl_deep_extend("force", opts.keymap, {
        ["<C-e>"] = { "fallback" },
      })
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
  {
    "echasnovski/mini.surround",
    opts = function(_, opts)
      opts.mappings = vim.tbl_deep_extend("force", opts.mappings, {
        add = "ys", -- Add surrounding in Normal and Visual modes
        delete = "ds", -- Delete surrounding
        replace = "cs", -- Replace surrounding
      })
    end,
  },
}
