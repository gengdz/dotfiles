local prettier_with_lsp = { "prettier", lsp_format = "first" }

---@module "lazy"
---@type LazySpec[]
return {
  {
    -- https://github.com/LazyVim/LazyVim/issues/5861
    "stevearc/conform.nvim",
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        javascript = prettier_with_lsp,
        javascriptreact = prettier_with_lsp,
        typescript = prettier_with_lsp,
        typescriptreact = prettier_with_lsp,
      },
    },
  },
}
