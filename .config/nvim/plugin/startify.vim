lua << EOF
function _G.webDevIcons(path)
  local filename = vim.fn.fnamemodify(path, ':t')
  local extension = vim.fn.fnamemodify(path, ':e')
  return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
end
EOF

function! StartifyEntryFormat() abort
  return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
endfunction
let g:startify_custom_header = [
\ '    |                                                                                                                    ',
\ '    |\     _____                  _                _____                                     _       _             _     ',
\ '      \   |  __ \                | |              |  __ \                                   | |     | |           | |    ',
\ '       \  | |__) | ___ __      __| |  ___  _   _  | |__) | ___  ___   ___   __ _  _ __  ___ | |__   | |      __ _ | |__  ',
\ '        \ |  _  / / _ \\ \ /\ / /| | / _ \| | | | |  _  / / _ \/ __| / _ \ / _` || `__|/ __||  _ \  | |     / _` ||  _ \ ',
\ '        / | | \ \| (_) |\ V  V / | ||  __/| |_| | | | \ \|  __/\__ \|  __/| (_| || |  | (__ | | | | | |____| (_| || |_) |',
\ '       /  |_|  \_\\___/  \_/\_/  |_| \___| \__, | |_|  \_\\___||___/ \___| \__,_||_|   \___||_| |_| |______|\__,_||_.__/ ',
\ '      /                                     __/ |                                                                        ',
\ '   __/__                                   |___/                                                                         ',
\ '                                                                                                                         ',
\]
