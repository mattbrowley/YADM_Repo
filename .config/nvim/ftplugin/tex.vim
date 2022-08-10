" Setup forward and backward search for LaTeX pdfs with okular
"if empty(v:servername) && exists('*remote_startserver')
"  call remote_startserver('VIM')
"endif

"let g:vimtex_view_general_viewer = 'okular'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
"let g:vimtex_view_general_options_latexmk = '--unique'

" Setup forward and backward search for LaTeX pdfs with zathura
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
