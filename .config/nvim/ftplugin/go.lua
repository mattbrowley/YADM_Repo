-- ftplugin/go.lua

-- Use actual tabs for Go
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- Run Go code with <F5>
vim.keymap.set('n', '<F5>', function()
  vim.cmd("write")
  
  -- Run the current Go file
  local run_cmd = "go run " .. vim.fn.expand('%:p')
  
  vim.cmd("split | resize 15 | term " .. run_cmd)
  
  -- Automatically enter insert mode to interact with the terminal
  vim.cmd("startinsert")
end, { buffer = true, desc = "Run Go File" })
