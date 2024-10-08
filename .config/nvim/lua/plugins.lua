-- Use the lazy package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  -- Trial plugins{
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    -- Wiki style note-taking
    "nvim-neorg/neorg",
    --build = ":Neorg sync-parsers",
    dependencies = {"luarocks.nvim"},
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.summary"] = {}, -- Generates a workspace summary
          ["core.presenter"] = { config = { zen_mode = "zen-mode" } }, -- Distraction-free mode
          ["core.concealer"] = { config = { icon_preset = "basic" } }, -- Adds pretty icons to your documents
          ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } }, -- Adds autocompletion
          ["core.integrations.nvim-cmp"] = {},
          -- ["core.ui.calendar"] = {},
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
                rpgs = "~/RPGs/Pathfinder2e/Adventures",
              },
            },
          },
        },
      }
    end,
  },
  -- 'samodostal/image.nvim', -- Convert image files to ascii art in the buffer
  'Weyaaron/nvim-training', -- Practice with nvim idioms
  { 'folke/which-key.nvim', opts = {} }, -- Useful plugin to show you pending keybinds.
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  'vim-scripts/TaskList.vim', -- #TODO etc.

  -- Other filetype plugins
  'stevearc/vim-arduino', -- Write and upload Arduino sketches
  'lervag/vimtex', -- Some LaTeX tools
  'vimwiki/vimwiki', -- Compose wikis in Vim
  -- 'fatih/vim-go', -- Plugin for all sorts of Golang tools

  -- Aesthetic plugins
  'gruvbox-community/gruvbox', -- Colorscheme
  'folke/zen-mode.nvim', -- Distraction-free typing mode
  --'arcticicestudio/nord-vim',  -- Colorscheme
  'goolord/alpha-nvim', -- Fancy start screen
  'psliwka/vim-smoothie', -- Smooth scrolling
  'norcalli/nvim-colorizer.lua', -- Display colors rgb(25,100,95)
  'stevearc/dressing.nvim', -- A nice windowed chooser
  'nvim-tree/nvim-web-devicons', -- Put filetype icons in various explorers, etc.
  'nvim-tree/nvim-tree.lua', -- A slick replacement for netrw with some neat extra commands
  -- 'akinsho/bufferline.nvim', -- List open buffers in order like tabs #TODO fix this
  'moll/vim-bbye', -- provides :Bdelete command, which closes buffers without ever exiting vim
  'nvim-lualine/lualine.nvim', -- A fancy status line in lua
  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },  -- Add indentation guides even on blank lines #TODO fix this 
  -- '3rd/image.nvim', -- View images in the buffer
  'sunjon/shade.nvim', -- Dim inactive windows
  -- 'stevearc/stickybuf.nvim', -- Lock nvim-tree and aerial windows

  -- Useless but fun plugins
  'eandrju/cellular-automaton.nvim', -- Create animations with your text
  {'tamton-aquib/duck.nvim', -- Spawn a duck friend who walks around your text
    config = function()
      vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
    end
  },

  -- General/Utility Plugins
  'nvim-neorg/lua-utils.nvim', -- Utility functions required by neorg
  'nvim-lua/plenary.nvim', -- Basically essential for many other plugins to work
  'nvim-lua/popup.nvim', -- Utility plugin for popup windows
  { 'numToStr/Comment.nvim', opts = {} }, -- Comment or uncomment text objects (gcc)
  'rcarriga/nvim-notify', -- Log and access vim notifications easily
  'akinsho/toggleterm.nvim', -- toggle a floating terminal
  'JoosepAlviste/nvim-ts-context-commentstring', -- Comments in context
  'mbbill/undotree', -- Visualize the vim undo tree #TODO: map :UndotreeToggle
  'AndrewRadev/splitjoin.vim', -- Switch between single lines and multi-lines
  'tpope/vim-surround', -- Tool for automating brackets, html tags, etc.
  'mileszs/ack.vim', -- Use ack (a grep-like tool) in vim
  'vim-scripts/restore_view.vim', -- Remembers your position, folds, etc. in files when opened

  -- Telescope related plugins
  {
    'nvim-telescope/telescope.nvim', -- Telescope iteself
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-media-files.nvim', -- View image files as images in telescope
      'nvim-telescope/telescope-project.nvim', -- Manage projects within telescope
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  -- LSP Configuration & Plugins
  'williamboman/mason-lspconfig.nvim',
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp', -- Asynchronous Lua Autocompletion
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip', -- Snippet engine implemented in Lua
      'saadparwaiz1/cmp_luasnip', -- Interface LuaSnip with cmp

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp', -- Provide LSP completions for cmp
      'hrsh7th/cmp-nvim-lua', -- Provide completions for cmp within lua config files
      'hrsh7th/cmp-buffer', -- Provide completions from the current buffer to cmp
      'hrsh7th/cmp-path', -- Provide completions from the filepath to cmp
      'hrsh7th/cmp-cmdline', -- Provide completions for the command line

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets', -- Collection of useful snippets
      'molleweide/LuaSnip-snippets.nvim', -- More snippets from the community
    },
  },

  -- Git-related plugins
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({'n', 'v'}, ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true, buffer = bufnr, desc = "Jump to next hunk"})
        vim.keymap.set({'n', 'v'}, '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true, buffer = bufnr, desc = "Jump to previous hunk"})
      end,
    },
  },

  -- Treesitter, etc.
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  'stevearc/aerial.nvim', -- Show project symbols outline
  --'liuchengxu/vista.vim', -- Show project tags, etc in a separate pane
  --'simrat39/symbols-outline.nvim', -- Show project symbols in a separate pane
}, {})
