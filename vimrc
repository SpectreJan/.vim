execute pathogen#infect()

" Set Indent
set autoindent
filetype plugin on
filetype on
filetype indent on
syntax on

" Set Indentation
set shiftwidth=4
set softtabstop=4
set expandtab

" Config vim-lsp
augroup lsp_clangd
	au!
	autocmd User lsp_setup call lsp#register_server({
		\ 'name': 'clangd',
		\ 'cmd': {server_info->['clangd']},
		\ 'whitelist': ['c', 'cpp', 'cxx', 'cc'],
		\ })
	autocmd FileType cpp setlocal omnifunc=lsp#complete
	autocmd Filetype cpp setlocal signcolumn=yes
augroup end

" config search
set nohlsearch
highlight Search ctermbg=lightblue guibg=lightblue

" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" config line numbers
set number
highlight LineNr ctermfg=darkgrey guifg=darkgrey

" Set clang_complete
" let g:clang_library_path='/usr/lib/libclang.so'

" autohighlight leading/trailing whitespaces
highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen
match WhiteSpaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/

" Netrw stuff
let g:netrw_browse_split=0
let g:netrw_banner = 0


"Term Color stuff
set term=screen-256color
colors darkspectrum

" Omnicomplete
set omnifunc=syntaxcomplete#Complete

" Show Indent with color
let g:indentLine_color_term = 240

nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>

" CTAGS stuff
map <C-\> :tab split<CR>:exec("tselect ".expand("<cword>"))<CR>
map g<C-\> :vsp <CR>:exec("tselect ".expand("<cword>"))<CR>
