local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- impatient should be called before all other plugins
  use 'lewis6991/impatient.nvim' -- Pre-compile lua startup scripts for faster loading

  -- Aesthetic Vim plugins
  -- use 'mhinz/vim-startify' -- Fancy start screen
  use 'goolord/alpha-nvim' -- Fancy start screen
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use 'psliwka/vim-smoothie' -- Smooth scrolling
  use 'norcalli/nvim-colorizer.lua' -- Display colors rgb(25,100,95)
  use 'gruvbox-community/gruvbox' -- Colorscheme
  --use 'arcticicestudio/nord-vim'  -- Colorscheme
  use 'stevearc/dressing.nvim' -- A nice windowed chooser
  use 'kyazdani42/nvim-web-devicons' -- Put filetype icons in various explorers, etc.
  use 'kyazdani42/nvim-tree.lua' -- A slick replacement for netrw with some neat extra commands
  use 'akinsho/bufferline.nvim' -- List open buffers in order like tabs
  use 'moll/vim-bbye' -- provides :Bdelete command, which closes buffers without ever exiting vim
  use 'nvim-lualine/lualine.nvim' -- A fancy status line in lua
  use "lukas-reineke/indent-blankline.nvim" -- show vertical rules to help with indentation
  use 'mbpowers/nvimager' -- View images in-line
  use 'sunjon/shade.nvim' -- Dim inactive windows
  use 'stevearc/stickybuf.nvim' -- Lock nvim-tree and aerial windows

  -- General editing/utility Vim plugins
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'vim-scripts/TaskList.vim' -- #TODO etc.
  use 'vim-scripts/restore_view.vim' -- Remembers your position, folds, etc. in files when opened
  use 'mileszs/ack.vim' -- Use ack (a grep-like tool) in vim
  use 'tpope/vim-surround' -- Tool for automating brackets, html tags, etc.
  use 'AndrewRadev/splitjoin.vim' -- Switch between single lines and multi-lines
  use 'mbbill/undotree' -- Visualize the vim undo tree #TODO: map :UndotreeToggle
  use 'numToStr/Comment.nvim' -- Comment or uncomment text objects (gcc)
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- Comments in context
  use 'akinsho/toggleterm.nvim' -- toggle a floating terminal
  -- use 'ahmedkhalf/project.nvim' -- Plugin for managing projects
  use 'nvim-telescope/telescope-project.nvim' -- Manage projects within telescope
  use 'rcarriga/nvim-notify' -- Log and access vim notifications easily
  -- use 'folke/which-key.nvim' -- Dynamically reveal your keymaps

  -- Git-related plugins
  use 'lewis6991/gitsigns.nvim' -- All-in-one git plugin
  -- use 'tpope/vim-git'  -- Git runtime for Vim
  -- use 'tpope/vim-fugitive'  -- Easy Git commands wrapper
  -- use 'airblade/vim-gitgutter'  -- Display changes from last commit in a gutter (like diff)

  -- Language Server and Treesitter plugins
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate", -- We recommend updating the parsers on update
  }
  use 'p00f/nvim-ts-rainbow' -- Color nested parenthesis according to their level
  use 'neovim/nvim-lspconfig' -- Language Server for neovim
  use 'williamboman/nvim-lsp-installer' -- Easily install new LSP servers
  use 'jose-elias-alvarez/null-ls.nvim' -- inject external linting engines into lsp
  -- use 'liuchengxu/vista.vim' -- Show project tags, etc in a separate pane
  use 'stevearc/aerial.nvim' -- Show project symbols outline
  -- use 'simrat39/symbols-outline.nvim' -- Show project symbols in a separate pane

  -- Completion and Snippet plugins
  use 'hrsh7th/nvim-cmp' -- Asynchronous Lua Autocompletion
  use 'hrsh7th/cmp-nvim-lsp' -- Provide LSP completions for cmp
  use 'hrsh7th/cmp-nvim-lua' -- Provide completions for cmp within lua config files
  use 'hrsh7th/cmp-buffer' -- Provide completions from the current buffer to cmp
  use 'hrsh7th/cmp-path' -- Provide completions from the filepath to cmp
  use 'hrsh7th/cmp-cmdline' -- Provide completions for the command line
  use 'L3MON4D3/LuaSnip' -- Snippet engine implemented in Lua
  use 'saadparwaiz1/cmp_luasnip' -- Interface LuaSnip with cmp
  --use 'honza/vim-snippets'  -- Collection of useful snippets
  use 'rafamadriz/friendly-snippets' -- Collection of useful snippets
  use 'molleweide/LuaSnip-snippets.nvim' -- More snippets from the community

  -- Other general coding plugins
  -- use 'reinh/vim-makegreen' -- Run make and show the status with colors
  -- use 'windwp/nvim-autopairs' -- Automatically handle bracket/parenthesis pairs

  -- Other filetype plugins
  use 'vimwiki/vimwiki' -- Compose wikis in Vim
  use 'lervag/vimtex' -- Some LaTeX tools
  -- use 'tpope/vim-rails' -- Suite of tools for editing Ruby on Rails programs
  -- use 'rstacruz/sparkup' -- Tools to make writing html faster
  use 'stevearc/vim-arduino' -- Write and upload Arduino sketches

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
