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
      servers = {
        html = {
          -- filetypes = { "html" },
        },
      },
      -- setup = {
      --   html = function(_, opts)
      --     local capabilities = vim.lsp.protocol.make_client_capabilities()
      --     capabilities.textDocument.completion.completionItem.snippetSupport = true
      --     require("lspconfig").html.setup({
      --       on_attach = function() end,
      --       capabilities = capabilities,
      --     })
      --   end,
      -- },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettier)
      -- return {
      --   sources = {
      --     nls.builtins.formatting.prettier,
      --     nls.builtins.formatting.stylua,
      --     nls.builtins.completion.spell,
      --   },
      -- }
    end,
  },
}
