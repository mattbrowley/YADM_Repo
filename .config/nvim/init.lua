-- Enable the impatient loader to improve startup time
vim.loader.enable()

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require "plugins" -- A few plugins seem incompatible with 10.0. . . check on them later
require "options"
require "keymaps"
require "aesthetics.colorscheme"
require "coding.cmp"
require "lsp.lsp"
require "coding.telescope"
require "coding.treesitter"
require "coding.autopairs"
require "coding.comment"
require "coding.nvim-tree"
require "coding.toggleterm"
require "coding.project"
-- require coding.symbols" -- Aerial might be better
require "coding.aerial"
require "aesthetics.web-devicons"
require "aesthetics.bufferline"
require "aesthetics.lualine"
require "aesthetics.ducks"
require "aesthetics.gitsigns"
require "aesthetics.alpha"
-- require "aesthetics.shade" -- seems to mess with mason
require "snippets.luasnip"
-- require "aesthetics.image" -- doesn't seem to work right. Luarock magick is not being loaded
-- require "utility.whichkey" -- Need to review configuation before I use it

-- plugins with default setup functions
require 'notify'.setup()
require 'colorizer'.setup()
require 'neodev'.setup()

-- #TODO
-- 1) Learn how to use luasnips
-- 3) Learn how to set spell dictionaries based on filetypes
-- 4) Learn how to do folding
-- 5) Learn how to use gitsigns, etc.
-- 6) Learn about debugging and the best dap plugins (ui, telescope, virtual_text)
-- 7) replace lspinstaller with mason

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  -- { import = 'custom.plugins' },
