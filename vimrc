" Vundle initialization
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'

" Github repos of the user 'vim-scripts'
" => can omit the username part


" non github repos


filetype plugin indent on     " required!

"tab settings
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start

"colorscheme koehler

"highlight searching
set hlsearch

"line numbering
set nu
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set numberwidth=3

" make j and k work as expected for long lines
map j gj
map k gk
map <Down> gj
map <Up> gk

" lsit increment
function! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

"Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
"Close NERDTree if only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Standard CtrlP also in insert mode
imap <C-p> <ESC>:CtrlP<CR>

" Shortcuts
imap <C-w> <Esc><C-w> " move through windows in insert mode
imap <C-v> <Esc><C-v> " allow block selection in insert mode

"  " Stupid shift key fixes
cmap WQ wq
cmap Wq wq

imap jk <Esc>

" IDE like curly braces
inoremap {<cr> {<cr>}<c-o>O
" inoremap [<cr> [<cr>]<c-o>O
" inoremap (<cr> (<cr>)<c-o>O)

let g:Tex_DefaultTargetFormat='pdf'

let g:slime_target = "tmux"
