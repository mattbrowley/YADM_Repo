-- default values listed [like so]
HOME = os.getenv("HOME")

local options = {
  fileencoding = "utf-8", -- Set file encoding to UTF-8
  laststatus = 2, -- Always show the status line change to 3 for one line across the whole screen
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  number = true, -- Show the current line number
  relativenumber = true, -- Show the relative line numbers
  shiftwidth = 2, -- Num. of spaces used for autoindent
  tabstop = 2, -- Num of spaces for a tab
  softtabstop = 2, -- Num of spaces for a soft tab
  expandtab = true, -- [false] Replace tabs with spaces
  smartindent = true, -- [false] Autoindent according to syntax
  foldmethod = "expr", -- Fold based on foldexpr
  foldlevelstart = 99, -- Don't fold anything when opening a new buffer
  swapfile = true, -- [true] make a swapfile
  autowrite = true, -- [false] Save before :next, :make, etc.
  scrolloff = 6, -- Scroll early to keep cursor from the edge of the screen
  sidescrolloff = 6, -- Scroll early to keep cursor from the edge of the screen
  cursorline = true, -- [false] highlight the current row
  clipboard = "unnamedplus", -- Allow access to the system clipboard
  mouse = "a", -- Allow nvim to access the mouse in all modes
  ignorecase = true, -- [false] ignore case in searches
  smartcase = true, -- [false] ... but not if search begins with a capital
  termguicolors = true, -- [false] enable more colors in the terminal
  completeopt = { 'menuone', 'noselect' }, -- configure popup menus to work well with cmp
  pumheight = 10, -- Popup menus have max size of 10
  splitbelow = true, -- [false] Vertical splits place new window below
  splitright = true, -- [false] Horizontal splits place new window to the right
  textwidth = 0, -- Set the width to 0 columns to disable splitting long lines
  colorcolumn = "+1", -- Draw a highlighted column at 80
  timeoutlen = 1000, -- Time to wait for a mapped sequence to complete
  updatetime = 300, -- Time up inactivity which triggers things like writing to swap or updating completion lists
  fileformats = { 'unix', 'dos', 'mac' }, -- Prefer Unix over Windows over OS9
  lazyredraw = true, -- [false] Do not redraw during macros, etc.
  backup = true, -- [false] keep a backup file when saving
  linebreak = true, -- Wrap lines after a word break
  -- wrap = true, -- [true] wrap lines longer than the window width (display only)
  -- smarttab = true,  -- [true] Backspace removes an entire tabs worth of spaces
  -- showcmd = true, -- [true] Show what I'm typing
  -- autoread = true, -- [true] Read files if they are edited in another program
  -- autoindent = true,  -- [true]
  -- backspace = {"indent","eol","start"}, -- Make backspace more powerful
  -- errorbells = false -- [false] no annoying beeps
  -- hlsearch = true, -- [true] Highilight search results
  -- hidden = true, -- [true] Keep buffers open in the background
  -- Save persistent undo files in the .vim folder
  undodir = HOME .. "/.vim/undo//",
  undofile = true,
  -- Save swap and backup files in the .vim folder
  directory = HOME .. "/.vim/swap//",
  backupdir = HOME .. "/.vim/backup//",
}

-- remove the need to keypress on prompts related to searches
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- Register my vimwiki
-- vim.cmd "let g:vimwiki_list =[{'path': '~/Documents/Wiki/', 'ext':'.wiki', 'index':'RowleyWiki', 'syntax':'default'}]"
vim.cmd "let g:vimwiki_list =[{'path': '~/Documents/Wiki/', 'ext':'.md', 'index':'RowleyWiki', 'syntax':'markdown'}]"
-- vim.g.vimwiki_list = "[{'path': '~/Documents/Wiki/', 'ext':'.wiki', 'index':'RowleyWiki', 'syntax':'default'}]"
-- Do not register any .md files as wikis
vim.cmd "let g:vimwiki_global_ext = 0"
-- vim.g.vimwiki_global_ext = false

-- set the cursorhold time to something that feels comfortable
vim.g.cursorhold_updatetime = 200

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function() vim.highlight.on_yank({ higroup = 'Visual', timeout = 300 }) end,
})
