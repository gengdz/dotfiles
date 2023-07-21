return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "<c-k>", false, mode = "i" }
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "gt", false }
      keys[#keys + 1] = { "gh", vim.lsp.buf.hover, desc = "Hover" }
    end,
    opts = {
      autoformat = false,
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.stylua,
          nls.builtins.completion.spell,
        },
      }
    end,
  },
}
