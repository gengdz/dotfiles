require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local servers = {
  "tsserver",
  "cssls",
  "html",
  "jsonls",
  "eslint",
  "tailwindcss",
  "sumneko_lua",
}

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = servers,
  automatic_installation = true,
})

local on_attach = function(_, bufnr)
  -- format on save
  -- vim.api.nvim_create_autocmd('BufWritePre', {
  --   group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
  --   buffer = bufnr,
  --   callback = function()
  --     vim.lsp.buf.format()
  --   end
  -- })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

local lsp_config = {
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end
}

require('mason-lspconfig').setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup(lsp_config)
  end,
  sumneko_lua = function()
    require('lspconfig').sumneko_lua.setup(vim.tbl_extend('force', lsp_config, {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }))
  end,
  tsserver = function()
    require('typescript').setup({
      server = vim.tbl_extend('force', lsp_config, {
        on_attach = function(_, bufnr)
          on_attach(_, bufnr)
        end,
        init_options = {
          preferences = {
            importModuleSpecifierPreference = 'project=relative',
            jsxAttributeCompletionStyle = 'none'
          }
        }
      })
    })
  end

})


--
-- require("lspconfig").sumneko_lua.setup {
--   capabilities = capabilities,
-- }


-- local nvim_lsp = require('lspconfig')
--
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--
--
-- local on_attach = function(client, bufnr)
--
--   local bufopts = { noremap = true, silent = true, buffer = bufnr }
--   vim.keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
--
--   -- Code action
--   vim.keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
--
--   -- Rename
--   vim.keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
--
--   -- 跳转到声明
--   vim.keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
--
--   -- Go to definition
--   -- keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")
--
--
--   -- Diagnostic jump
--   -- You can use <C-o> to jump back to your previous location
--   vim.keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
--   vim.keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
--
--
--   -- Toggle outline
--   keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")
--
--   -- 跳转到声明
--   -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--   -- -- 跳转到定义
--   -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--   -- vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
--   -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--   -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
--   -- -- 跳转到引用位置
--   -- vim.keymap.set('n', '<leader>u', vim.lsp.buf.references, bufopts)
--   -- vim.keymap.set('n', '<leader>d', '<cmd>Telescope lsp_document_symbols<cr>', bufopts)
--   -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
-- end
--
--
-- nvim_lsp.pyright.setup {
--   on_attach = on_attach,
-- }
-- require('lspconfig')['tsserver'].setup{
--   on_attach = on_attach,
--   flags = lsp_flags,
-- }
-- require("typescript").setup({
--   disable_commands = false, -- prevent the plugin from creating Vim commands
--   debug = false, -- enable debug logging for commands
--   go_to_source_definition = {
--     fallback = true, -- fall back to standard LSP definition on failure
--   },
--   server = { -- pass options to lspconfig's setup method
--     on_attach = on_attach,
--   },
-- })
--
-- vim.keymap.set('n', "<leader>o","<Cmd>TypescriptOrganizeImports<CR>")
-- vim.keymap.set('n', "<leader>a","<Cmd>TypescriptAddMissingImports<CR>")
-- vim.keymap.set('n', "<leader>r","<Cmd>TypescriptRemoveUnused<CR>")
