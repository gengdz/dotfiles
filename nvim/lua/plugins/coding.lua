return {
  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = {
      filetypes = { ["*"] = true },
    },
  },
  {
    "saghen/blink.cmp",
    optional = true,
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
