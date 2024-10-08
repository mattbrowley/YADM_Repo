" Use 4 spaces for a tab in python files
setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 
" Set up nvim-tree and symbol explorers
" :NvimTreeOpen
" :SymbolsOutlineOpen
"
" Below is a lua script to execute code with f5 #TODO: something!
" -- F5, execute code!
" local execute_code = function()
"   if vim.bo.filetype == "python" then
"     local run_cmd = "python " .. vim.fn.expand('%:p')
"     vim.cmd("split | resize 10 | term " .. run_cmd)
"     vim.cmd("startinsert")
"   end
" end
"
" vim.keymap.set('n', '<F5>', execute_code, {})

