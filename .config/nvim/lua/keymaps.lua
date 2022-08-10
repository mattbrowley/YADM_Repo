local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- set the leader button to a comma
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Jump to the next and prev error with <C-n> and <C-m>
keymap("n", "<C-n>", ":cnext<CR>", opts)
keymap("n", "<C-m>", ":cprevious<CR>", opts)

-- Toggle spell checking with f-6
keymap("n", "<f6>", ":setlocal spell!<CR>", opts)

-- Make with f-5
keymap("n", "<f5>", ":make<CR>", opts)
keymap("v", "<f5>", "<esc>:make<CR>", opts)
keymap("i", "<f5>", "<esc>:make<CR>", opts)

-- TaskList
-- keymap("n", "<leader>TD", ":TaskList<CR>", opts) -- <leader>t by default

-- Close the quickfix window with <leader>a
keymap("n", "<leader>a", ":cclose<CR>", opts)

-- swap ; and : for quicker access to command mode
keymap("n", ";", ":", opts)
keymap("n", ":", ";", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with <C-arrows>
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear the search highlights with esc
keymap("n", "<esc>", ":noh<cr><esc>", opts)

-- Yank to the end of the line like D and C
keymap("n", "Y", "y$", opts)

-- Center search items on the screen
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Visual linewise up and down by default
keymap("n", "<Up>", "gk", opts)
keymap("n", "k", "gk", opts)
keymap("n", "<Down>", "gj", opts)
keymap("n", "j", "gj", opts)

-- Toggle nvim_tree file explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Toggle the Aerial Symbols Outline
keymap("n", "<leader>o", ":AerialToggle!<cr>", opts)

-- Visual --
-- Stay in indent mode while modifying indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move lines up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)

-- Do not replace the anonymous register when putting over selected text
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move selected text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
