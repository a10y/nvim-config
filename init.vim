""" Andrew Duffy init.vim
""" Copyright Andrew Duffy 2017

""" Plugins
call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'eagletmt/neco-ghc'

Plug 'fatih/vim-go', {'for': 'go'}
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'junegunn/goyo.vim'

Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'reewr/vim-monokai-phoenix'
call plug#end()

""" Basic
syn on
inoremap kj <esc>
set number
set ignorecase smartcase
set hlsearch
set scrolloff=5
set expandtab
set tabstop=4 shiftwidth=4

set list
set listchars=trail:•,extends:#,precedes:<,nbsp:•,tab:→\ 
set fillchars=vert:\ ,fold:-

"set background=light
colorscheme monokai-phoenix
let g:solarized_termcolors=256
" let g:seoul256_background = 233 " Darkest
"colorscheme nord


""" Term mode
" The following binds Alt-h/j/k/l so that they can be used to switch between
" buffers in both terminal and normal modes
tnoremap ˙ <C-\><C-n><C-w>h
tnoremap ∆ <C-\><C-n><C-w>j
tnoremap ˚ <C-\><C-n><C-w>k
tnoremap ¬ <C-\><C-n><C-w>l

noremap ˙ <C-\><C-n><C-w>h
noremap ∆ <C-\><C-n><C-w>j
noremap ˚ <C-\><C-n><C-w>k
noremap ¬ <C-\><C-n><C-w>l


""" Airline
" Trying to get a nice powerline-less statusbar.
" For more info: http://vi.stackexchange.com/a/3363
" Basically we just override the airline symbols to use nothing, so we get
" nice boxes.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''

""" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


""" Haskell
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc


""" Golang
augroup golang
  autocmd!
  autocmd FileType go set shiftwidth=8 tabstop=8 noexpandtab textwidth=89
  autocmd FileType go nnoremap gr :GoRun<cr>
  autocmd FileType go set nolist
augroup END

let g:go_fmt_command = 'goimports'
let g:go_term_mode = 'split'

" Rust
let g:racer_cmd = "/Users/andrew/.cargo/bin/racer"
let g:rustfmt_autosave = 1
au FileType rust nnoremap gd <Plug>(rust-def)
au FileType rust nnoremap gs <Plug>(rust-def-split)
au FileType rust nnoremap gx <Plug>(rust-def-vertical)
au FileType rust nnoremap <leader>gd <Plug>(rust-doc)
