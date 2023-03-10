local null_ls = require("null-ls")
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    -- if client.supports_method("textDocument/formatting") then
    --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --   vim.api.nvim_create_autocmd("BufWritePre", {
    --     group = augroup,
    --     buffer = bufnr,
    --     callback = function()
    --       -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --       vim.lsp.buf.format({ bufnr = bufnr })
    --       -- vim.lsp.buf.formatting_sync()
    --     end,
    --   })
    -- end
    vim.keymap.set("n", "<leader>fm", function()
      vim.lsp.buf.format({
        bufnr = bufnr
      })
    end, { noremap = true, silent = true, desc = "lsp code format", buffer = bufnr })
  end,
  sources = {
    -- null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.prettier.with({
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
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
  },

})
