return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "css-lsp", "tailwindcss-language-server", "emmet-ls" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- opts.inlay_hints = { enabled = false }
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "<c-k>", false, mode = "i" }
      keys[#keys + 1] = { "gt", false }

      local vtsls = opts.servers.vtsls
      -- vtsls.settings.vtsls.experimental.maxInlayHintLength = 30
      -- disable vtsls key
      vtsls.keys[#vtsls.keys + 1] = { "<leader>co", false }
    end,
  },
  {
    "AndrewRadev/inline_edit.vim",
    lazy = true,
    event = "VeryLazy",
    cmd = { "InlineEdit" },
    keys = {
      { "<leader>cI", "<cmd>InlineEdit<cr>", desc = "Inline Edit (JS inside <script> html)" },
    },
    config = function() end,
  },
}
