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
  },

  {
    "williamboman/mason.nvim",
    keys = {
      { "<leader>M", "<Cmd>Mason<CR>" },
    },
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettier.with({
            -- 比默认少了 markdown
            filetypes = {
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
              "vue",
              "css",
              "scss",
              "less",
              "html",
              "json",
              "yaml",
              "graphql",
            },
            prefer_local = "node_modules/.bin",
          }),
          -- nls.builtins.diagnostics.eslint,
          nls.builtins.formatting.stylua,
          nls.builtins.completion.spell,
        },
      }
    end,
  },
}
