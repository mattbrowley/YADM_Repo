-- ftplugin/python.lua

-- Use 4 spaces for a tab in python files
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- Execute Python code with <F5> instead of running :Make!
vim.keymap.set('n', '<F5>', function()
  -- Save the file first so you are always running the latest version!
  vim.cmd("write")
  
  -- Get the full path of the current file
  local run_cmd = "python3 " .. vim.fn.expand('%:p')
  
  vim.cmd("split | resize 15 | term " .. run_cmd)
  
  -- Automatically enter insert mode to interact with the script
  vim.cmd("startinsert")
end, { buffer = true, desc = "Run Python Script" })
