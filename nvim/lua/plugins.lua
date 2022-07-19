return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'antoinemadec/FixCursorHold.nvim'
  use 'tpope/vim-repeat'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use {
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_keymaps()
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require("notify")
    end
  }
  use {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  }
  use {
    "tpope/vim-surround",
    keys = { "c", "d", "y" }
  }
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }
  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {
        default_mappings = true
      }
    end
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "packer" }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        }
      }
    end
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
  use {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end
  }
  use { "akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
    require("toggleterm").setup()
  end }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.code_actions.gitsigns
        },
      })
    end
  }
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'davidsierradz/cmp-conventionalcommits'
  use 'rafamadriz/friendly-snippets'
  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  }
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins/cmp').setup()
    end
  }
  use "folke/lua-dev.nvim"
  use 'williamboman/nvim-lsp-installer'
  use {
    'neovim/nvim-lspconfig',
    after = 'nvim-cmp',
    config = function()
      require('plugins.lsp').setup()
    end
  }
  use { 'dracula/vim', config = 'vim.cmd("colorscheme dracula")' }
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("bufferline").setup {
        options = {
          numbers = 'ordinal',
          diagnostics = "nvim_lsp",
          show_close_icon = false,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "center"
            }
          },
          custom_areas = {
            right = function()
              return require('utils').bufferline_custom()
            end,
          }
        }
      }
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'windwp/nvim-ts-autotag'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = _G.MY_TREESITTER_ENURE_INSTALLED,
        highlight = { enable = true },
        autotag = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            node_incremental = "v",
            node_decremental = "V",
          },
        },
      }
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require 'treesitter-context'.setup {}
    end
  }
  use {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function()
      require("nvim-tree").setup {
        sync_root_with_cwd = true,
        view = {
          adaptive_size = true,
          mappings = {
            list = {
              { key = "h", action = "close_node" },
              { key = "l", action = "edit" },
            },
          },
        },
      }
    end
  }
  use 'nvim-telescope/telescope-project.nvim'
  use 'olacin/telescope-cc.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'tknightz/telescope-termfinder.nvim' }
  use { 'jvgrootveld/telescope-zoxide',
    requires = {
      { 'nvim-lua/popup.nvim' },
    },
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('zoxide')
      require('telescope').load_extension('conventional_commits')
      require('telescope').load_extension('project')
      require('telescope').load_extension('termfinder')
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require('plugins/which-key').setup()
    end
  }
end)
