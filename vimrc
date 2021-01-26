execute pathogen#infect()
" Set Indent
set autoindent
filetype plugin on
filetype on
filetype indent on
syntax on

" Set encoding and listchars
set encoding=utf-8
set listchars=tab:»\ 
autocmd ColorScheme darkspectrum highlight SpecialKey guifg=#3a3a3a

"Term Color stuff
set term=screen-256color
colors darkspectrum

" Set Indentation
set shiftwidth=4
set softtabstop=4
set tabstop=4
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
	autocmd FileType c setlocal omnifunc=lsp#complete
	autocmd Filetype c setlocal signcolumn=yes
augroup end

augroup lsp_rust_analyzer
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'whitelist': ['rs', 'rust', 'Rust'],
        \})
    autocmd FileType rs setlocal omnifunc=lsp#complete
    autocmd FileType rs setlocal signcolumn=yes
augroup end

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer><silent> gd :LspDefinition <cr>
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup end

" config search
set nohlsearch

" config line numbers
set number

" Netrw stuff
let g:netrw_browse_split=0
let g:netrw_banner = 0

" Omnicomplete
set omnifunc=syntaxcomplete#Complete

" Show Indent with color
let g:indentLine_color_term = 240

nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
