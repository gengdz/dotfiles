return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-b>"] = cmp.mapping.abort(),
        ["<C-f>"] = cmp.mapping.abort(),
      })
      -- table.insert(opts.sources, 1, {
      --   name = "cmp_tabnine",
      --   group_index = 1,
      --   priority = 1,
      -- })
    end,
  },
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup({})
    end,
  },
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
