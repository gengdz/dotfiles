return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-b>"] = cmp.mapping.abort(),
        ["<C-f>"] = cmp.mapping.abort(),
      })
      -- table.insert(opts.sources, {
      --   {
      --     name = "nvim_lsp",
      --     entry_filter = function(entry)
      --       return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
      --     end,
      --   },
      -- })
    end,
  },
  { "brglng/vim-im-select" },
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
