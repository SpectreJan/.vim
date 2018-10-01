execute pathogen#infect()

" Set Indent
set autoindent
filetype on
filetype indent on

" Set Indentation
set shiftwidth=4
set softtabstop=4
set expandtab

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
let g:clang_library_path='/usr/lib/llvm-6.0/lib/libclang-6.0.so.1'

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
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Show Indent with color
let g:indentLine_color_term = 240

nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
