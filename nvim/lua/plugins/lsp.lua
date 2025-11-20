return {
  {
    "mason-org/mason.nvim",
    keys = {
      { "<leader>cm", false },
      { "<leader>cM", "<cmd>Mason<cr>", desc = "Mason" },
    },
    opts = {
      ensure_installed = {
        "css-lsp",
        "tailwindcss-language-server",
        "emmet-language-server",
        "rust-analyzer",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    -- opts = {
    --   servers = {
    --     -- 这样改会覆盖掉默认的 keymaps 设置
    --     ["*"] = {
    --       keys = {
    --         { "<leader>cM", false },
    --         {
    --           "<leader>cm",
    --           LazyVim.lsp.action["source.addMissingImports.ts"],
    --           desc = "Add missing imports",
    --         },
    --       },
    --     },
    --   },
    -- },
    opts = function(_, opts)
      -- opts.inlay_hints = { enabled = false }
      -- disable a keymap
      local vtslsKeys = opts.servers.vtsls.keys or {}
      vtslsKeys[#vtslsKeys + 1] = { "<leader>cM", false }
      vtslsKeys[#vtslsKeys + 1] = { "<c-k>", false, mode = "i" }
      vtslsKeys[#vtslsKeys + 1] = {
        "<leader>cm",
        LazyVim.lsp.action["source.addMissingImports.ts"],
        desc = "Add missing imports",
      }
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
