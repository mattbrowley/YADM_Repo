local opts = { noremap = true, silent = true }

-- Modern Neovim keymap API
local keymap = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Swap ; and : for quicker access to command mode
keymap("n", ";", ":", opts)
keymap("n", ":", ";", opts)

-- Window navigation
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

-- Clear search highlights with esc
keymap("n", "<esc>", ":noh<cr><esc>", opts)

-- Center search items on the screen
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Visual linewise up and down by default
keymap("n", "<Up>", "gk", opts)
keymap("n", "<Down>", "gj", opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Quickfix list navigation
keymap("n", "]q", "<cmd>cnext<CR>", { desc = "Next Quickfix" })
keymap("n", "[q", "<cmd>cprev<CR>", { desc = "Prev Quickfix" })
keymap("n", "<leader>a", ":cclose<CR>", opts)

-- Make and Spell check
keymap("n", "<f6>", ":setlocal spell!<CR>", opts)
keymap({ "n", "v", "i" }, "<f5>", "<esc>:make!<CR>", opts)

-- Toggle distraction-free editing mode
keymap("n", "<leader><S-z>", ":ZenMode<CR>", opts)

-- Visual --
-- Stay in visual mode while modifying indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected text up and down (Visual & Visual Block)
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Do not replace the anonymous register when putting over selected text
keymap("v", "p", '"_dP', opts)

-- Plugin Keymaps --
-- pomo.nvim (pomodoro timer)
-- Start the standard Pomodoro session (25m work / 5m break)
vim.keymap.set("n", "<leader>ps", "<cmd>TimerSession pomodoro<CR>", { desc = "Start Pomodoro Session" })

-- Stop the current active timer
vim.keymap.set("n", "<leader>px", "<cmd>TimerStop<CR>", { desc = "Stop Pomodoro Timer" })

-- Optional: Opens the command line ready for you to type a custom time (e.g., 10m)
vim.keymap.set("n", "<leader>pc", ":TimerStart ", { desc = "Start Custom Timer" })

-- Persistence (Session Management)
vim.keymap.set("n", "<leader>sl", function()
	require("persistence").load()
end, { desc = "Restore Session for Current Directory" })
vim.keymap.set("n", "<leader>ss", function()
	require("persistence").select()
end, { desc = "Select a Session to Restore" })
vim.keymap.set("n", "<leader>sd", function()
	require("persistence").stop()
end, { desc = "Don't Save Current Session" })

-- Snacks File Explorer
keymap("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "Toggle Explorer" })

-- Snacks Buffer Delete
keymap("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })

-- Snacks Pickers
keymap("n", "<leader>ff", function()
	Snacks.picker.smart()
end, { desc = "Find Files" })
keymap("n", "<leader>fg", function()
	Snacks.picker.grep()
end, { desc = "Live Grep" })
keymap("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Find Buffers" })
keymap("n", "<leader>fk", function()
	Snacks.picker.keymaps()
end, { desc = "Search Keymaps" })
keymap("n", "<leader>fc", function()
	Snacks.picker.colorschemes()
end, { desc = "Search Colorschemes" })
keymap("n", "<leader>td", function()
	Snacks.picker.todo_comments()
end, { desc = "Search TODOs" })
keymap("n", "<leader>fn", function()
	Snacks.notifier.show_history()
end, { desc = "Notification History" })
keymap("n", "<leader>u", function()
	Snacks.picker.undo()
end, { desc = "Undo Tree" })
keymap("n", "<leader>fs", function()
	Snacks.picker.lsp_symbols()
end, { desc = "Find Symbols" })
keymap("n", "<leader>fd", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })

-- Snacks Floating Terminal
keymap("n", "<c-/>", function()
	Snacks.terminal()
end, { desc = "Toggle Terminal" })

-- Snacks Lazygit
keymap("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })

-- Aerial Symbols Outline
keymap("n", "<leader>o", ":AerialToggle!<cr>", opts)

-- Code Formatting (Conform)
keymap("n", "<leader>fo", function()
	require("conform").format()
end, { desc = "Format Code" })

-- LSP Keymaps --
keymap("n", "gD", vim.lsp.buf.declaration, opts)
keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "Hover Documentation" })
keymap("n", "gi", vim.lsp.buf.implementation, opts)
keymap("n", "gk", vim.lsp.buf.signature_help, opts)
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymap("n", "gr", vim.lsp.buf.references, opts)
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
keymap("n", "gl", vim.diagnostic.open_float, opts)
keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)
keymap("n", "[d", function()
	vim.diagnostic.goto_prev({ border = "rounded" })
end, opts)
keymap("n", "]d", function()
	vim.diagnostic.goto_next({ border = "rounded" })
end, opts)

-- Silly Stuff --
keymap("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", opts)
