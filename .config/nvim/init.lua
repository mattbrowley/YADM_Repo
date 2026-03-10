-- Enable the impatient loader to improve startup time
vim.loader.enable()

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set core editor settings
require("options")
require("keymaps")

-- Load plugins
require("plugins")

-- Plugin settings
-- Coding & LSP
require("lsp.mason")
require("snippets.luasnip")

-- #TODO
-- 1) Learn how to use luasnips
-- 3) Learn how to set spell dictionaries based on filetypes
-- 4) Learn how to do folding
-- 5) Learn how to use gitsigns, etc.
-- 6) Learn about debugging and the best dap plugins (ui, telescope, virtual_text)
-- 7) Map :UndoTreeToggle

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
