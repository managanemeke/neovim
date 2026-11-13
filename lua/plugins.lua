vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Автоустановка пакетного менеджера
  use 'wbthomason/packer.nvim'
  ---------------------------------------------------------
  -- ПЛАГИНЫ ВНЕШНЕГО ВИДА
  ---------------------------------------------------------
  -- Информационная строка внизу
  use "kyazdani42/nvim-web-devicons"
  use { 'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = function()
      require('lualine').setup()
  end, }
  -- Тема в стиле Rose Pine
  use({
    'folke/tokyonight.nvim',
    as = 'tokyonight',
    config = function()
      require("tokyonight").setup()
      vim.cmd('colorscheme tokyonight-moon')
    end
  })
  ---------------------------------------------------------
  -- МОДУЛИ РЕДАКТОРА
  ---------------------------------------------------------
  -- Табы с вкладками сверху
  use {'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
      require("bufferline").setup{}
  end, }
  -- Структура классов и функций в файле
  use 'majutsushi/tagbar'
  -- Файловый менеджер
  use { 'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
      require'nvim-tree'.setup {}
  end, }
  --- popup окошки
  use 'nvim-lua/popup.nvim'

  ---------------------------------------------------------
  -- КОД
  ---------------------------------------------------------
  -- автоматические закрывающиеся скобки
  use { 'windwp/nvim-autopairs',
      config = function()
      require("nvim-autopairs").setup()
  end}
  -- Комментирует по <gc> все, вне зависимости от языка программирования
  use { 'numToStr/Comment.nvim',
      config = function()
      require('Comment').setup()
  end }

  ---------------------------------------------------------
  -- LSP И АВТОДОПОЛНЯЛКИ
  ---------------------------------------------------------
  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'

  -- Автодополнялка
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'

  --- Автодополнлялка к файловой системе
  use 'hrsh7th/cmp-path'

  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'

  -- Линтер, работает для всех языков
  use 'dense-analysis/ale'
  ---------------------------------------------------------
  -- РАЗНОЕ
  ---------------------------------------------------------


  -- nvim commands working even with russuan layout
  use 'powerman/vim-plugin-ruscmd'

  use({
    'm4xshen/smartcolumn.nvim',
    config = function()
      require("smartcolumn").setup({
        colorcolumn = "60",
        disabled_filetypes = {},
        custom_colorcolumn = {},
        scope = "file",
        editorconfig = true,
      })
    end
  })

  --- git

  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  })

  use({
    'YouSame2/inlinediff-nvim',
    config = function()
      require('inlinediff').setup({})
    end
  })

  use({
    'tpope/vim-fugitive',
  })

  use({
    'rbong/vim-flog',
    requires = 'tpope/vim-fugitive',
    cmd = { 'Flog', 'Flogsplit', 'Floggit' },
  })

  ---

end)
