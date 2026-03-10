-- default values listed [like so]

-- Core options
local options = {
	fileencoding = "utf-8",
	laststatus = 3, -- One line across the whole screen Change to 2 to always show the status line
	cmdheight = 0, -- Hide when empty
	number = true, -- Show the current line number
	relativenumber = true, -- Show the relative line numbers
	shiftwidth = 2, -- Num. of spaces used for autoindent
	tabstop = 2, -- Num of spaces for a tab
	softtabstop = 2, -- Num of spaces for a soft tab
	expandtab = true, -- [false] Replace tabs with spaces
	smartindent = true, -- [false] Autoindent according to syntax
	foldmethod = "expr", -- Fold based on foldexpr
	foldlevelstart = 99, -- Don't fold anything when opening a new buffer

	-- File management (Files saved to ~/.local/state/nvim/)
	autowrite = true, -- [false] Save before :next, :make, etc.
	undofile = true, -- Undo persists after close

	-- UI and scrolling
	scrolloff = 6, -- Scroll early to keep cursor from the edge of the screen
	sidescrolloff = 6, -- Scroll early to keep cursor from the edge of the screen
	cursorline = true, -- [false] highlight the current row
	termguicolors = true, -- [false] enable more colors in the terminal
	colorcolumn = "80", -- Draw a highlighted column at 80 Set to +1 to draw relative to a set textwidth

	-- System and behavior
	clipboard = "unnamedplus", -- Allow access to the system clipboard
	mouse = "a", -- Allow nvim to access the mouse in all modes
	ignorecase = true, -- [false] ignore case in searches
	smartcase = true, -- [false] ... but not if search begins with a capital
	splitbelow = true, -- [false] Vertical splits place new window below
	splitright = true, -- [false] Horizontal splits place new window to the right
	textwidth = 0, -- Set the width to 0 columns to disable splitting long lines
	linebreak = true, -- Wrap lines after a word break
	breakindent = true, -- Match first line indent when a line wraps
	timeoutlen = 500, -- Time to wait for a mapped sequence to complete
	updatetime = 300, -- Time of inactivity which triggers things like writing to swap or updating completion lists
	fileformats = { "unix", "dos", "mac" }, -- Prefer Unix over Windows over OS9

	-- Completion menu
	completeopt = { "menuone", "noselect" },
	pumheight = 10, -- Popup menus have max size of 10
}

-- Apply the above options
for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Appended Options and Modifiers
vim.opt.shortmess:append("c") -- Hide redundant search/completion messages
vim.opt.whichwrap:append("<,>,[,],h,l") -- Allow keys to move cursor to next/prev line
vim.opt.iskeyword:append("-") -- Treat dash-separated words as one word

-- Global Variables and Plugin Setup
vim.g.cursorhold_updatetime = 200

-- Autocommands
-- Briefly highlight yanked text
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_group,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
	end,
})
