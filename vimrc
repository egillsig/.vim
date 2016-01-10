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
Bundle 'derekwyatt/vim-scala'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'jpalardy/vim-slime'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'
Bundle 'altercation/vim-colors-solarized'
Plugin 'jelera/vim-javascript-syntax'

" Clojure
Bundle 'tpope/vim-fireplace'
Bundle 'guns/vim-clojure-static'

" snippets
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'


" Github repos of the user 'vim-scripts'
" => can omit the username part
Bundle 'AutomaticLaTeXPlugin'


" non github repos


filetype plugin indent on     " required!

"tab settings
set expandtab
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start

" Show tab characters
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

syntax enable
set background=dark
" colorscheme solarized

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

" noremap K i<CR><Esc> " Split line

"  " Stupid shift key fixes
cmap WQ wq
cmap Wq wq

imap jk <Esc>
vmap <CR> <Esc>

" IDE like curly braces
inoremap {<cr> {<cr>}<c-o>O
" inoremap [<cr> [<cr>]<c-o>O
" inoremap (<cr> (<cr>)<c-o>O)

let g:Tex_DefaultTargetFormat='pdf'

let g:slime_target = "tmux"


" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
"
" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key 
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

autocmd FileType scheme setlocal shiftwidth=2 softtabstop=2
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2
autocmd FileType sml setlocal shiftwidth=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
let g:syntastic_scala_checkers = ['']
let g:syntastc_disabled_filetypes=['java']

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

augroup filetypedetect
    au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
augroup END

augroup filetypedetect
    au! BufRead,BufNewFile *.decaf setfiletype java
augroup END

au Filetype clojure nmap <c-c><c-k> :Require<cr>  
