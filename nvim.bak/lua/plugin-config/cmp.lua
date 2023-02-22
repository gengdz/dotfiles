local cmp = require("cmp")
local lspkind = require("lspkind")

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  -- 设置代码片段引擎，用于根据代码片段补全
  -- snippet = {
  --     expand = function(args)
  --         vim.fn["vsnip#anonymous"](args.body)
  --     end,
  -- },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  window = {
  },

  mapping = cmp.mapping.preset.insert({
    -- 出现补全
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- 确认使用某个补全项
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
  }),

  -- 补全来源
  --  -- 这里重要
  sources = cmp.config.sources({
    { name = 'nvim_lsp',
      entry_filter = function(entry)
        return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
      end
    },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'vsnip' },
    { name = 'path' },
  }, {
      { name = 'buffer' },
    }),

  --根据文件类型来选择补全来源
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      {name = 'buffer'}
    })
  }),

  -- 命令模式下输入 `/` 启用补全
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  }),

  -- 命令模式下输入 `:` 启用补全
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
        { name = 'cmdline' }
      })
  }),

  -- 设置补全显示的格式
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50,
      before = function(entry, vim_item)
        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
        return vim_item
      end
    }),
  },
})


