
return require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- 在这里安装插件

  -- 主题
  -- use 'sainnhe/everforest'
  use 'folke/tokyonight.nvim'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    'nvim-lualine/lualine.nvim',  -- 状态栏
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }  -- 状态栏图标
  }

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- 自动保存
  use "Pocco81/auto-save.nvim"


  use {
    "phaazon/hop.nvim", -- like easymotion, but more powerful
    branch = "v1", -- optional but strongly recommended
  }
  use "terrortylor/nvim-comment"
  use "tpope/vim-surround" -- vim surround

  -- 终端 toggleterm
  use {"akinsho/toggleterm.nvim", tag = '*'}

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- 文件检索
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  -- 代码高亮等
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate'
  -- }
  use "nvim-treesitter/nvim-treesitter" -- 语法高亮
  use "p00f/nvim-ts-rainbow" -- 配合treesitter，不同括号颜色区分

  -- enhance texetobject selection
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    commit = "c81382328ad47c154261d1528d7c921acad5eae5",
  }
  -- use "romgrk/nvim-treesitter-context" -- show class/function at the top

  -- nvim-cmp 自动补全
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"
  -- vsnip
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  use {'rafamadriz/friendly-snippets'}
  -- lspkind
  use {'onsails/lspkind-nvim'}
  -- lspsaga
  use {'glepnir/lspsaga.nvim'}
  use {'simrat39/symbols-outline.nvim'}
  use 'jose-elias-alvarez/typescript.nvim'

  -- lsp 语法提示
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig"
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })


  use "windwp/nvim-autopairs" -- 自动补全括号

  use "lewis6991/gitsigns.nvim" -- git提示
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }


  -- 格式化
  use "jose-elias-alvarez/null-ls.nvim"

  use 'MattesGroeger/vim-bookmarks'
  use 'tom-anders/telescope-vim-bookmarks.nvim'

  -- use "folke/which-key.nvim" -- which  key

  use {"brglng/vim-im-select"}
end)
