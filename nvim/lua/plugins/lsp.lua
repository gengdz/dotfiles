return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "css-lsp", "tailwindcss-language-server" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "<c-k>", false, mode = "i" }
      -- keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "gt", false }
      -- keys[#keys + 1] = { "gh", vim.lsp.buf.hover, desc = "Hover" }
    end,
    opts = {
      servers = {
        html = {
          filetypes = { "html" },
        },
      },
    },
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
