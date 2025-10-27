return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "css-lsp",
        "tailwindcss-language-server",
        "emmet-language-server",
        "rust-analyzer",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- opts.inlay_hints = { enabled = false }
      -- local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      -- keys[#keys + 1] = { "<c-k>", false, mode = "i" }
      -- keys[#keys + 1] = { "gt", false }

      -- local vtsls = opts.servers.vtsls
      -- vtsls.settings.vtsls.experimental.maxInlayHintLength = 30
      -- disable vtsls key
      -- vtsls.keys[#vtsls.keys + 1] = { "<leader>co", false }

      -- local eslint = opts.servers.eslint
      -- eslint.on_init = function(client, _)
      --   local new_root_dir = client.config.root_dir
      --
      --   local use_flat_config = false
      --   if new_root_dir then
      --     local flat_config_files = {
      --       "eslint.config.js",
      --       "eslint.config.mjs",
      --       "eslint.config.cjs",
      --       "eslint.config.ts",
      --       "eslint.config.mts",
      --       "eslint.config.cts",
      --     }
      --     for _, file in ipairs(flat_config_files) do
      --       if vim.fn.filereadable(new_root_dir .. "/" .. file) == 1 then
      --         use_flat_config = true
      --         break
      --       end
      --     end
      --   end
      --
      --   client.config.settings.experimental = {
      --     useFlatConfig = use_flat_config,
      --   }
      -- client.config.settings.rules = {
      --   -- ["@typescript-eslint/no-unused-vars"] = "off",
      -- }
      -- end
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
