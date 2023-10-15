return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/vim-vsnip",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = {
        {
          name = "nvim_lsp",
          entry_filter = function(entry)
            return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
          end,
        },
        { name = "luasnip" }, -- For luasnip users.
        { name = "vsnip" },
        { name = "buffer" },
        { name = "path" },
      }

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.abort(),
        ["<C-f>"] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      })
    end,
  },
  { "brglng/vim-im-select" },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "ys", -- Add surrounding in Normal and Visual modes
        delete = "ds", -- Delete surrounding
        replace = "cs", -- Replace surrounding
      },
    },
  },
}
