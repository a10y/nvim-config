""" Andrew Duffy init.vim
""" Copyright Andrew Duffy 2017

set nocompatible
filetype off

""" Plugins
call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/unite.vim'                   " buffer
Plug 'Shougo/vimfiler.vim'                " file explorer
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'airblade/vim-gitgutter'             " git show diffs
Plug 'altercation/vim-colors-solarized'
Plug 'autozimu/LanguageClient-neovim'
Plug 'bronson/vim-trailing-whitespace'    " :FixWhiteSpace
Plug 'ctrlpvim/ctrlp.vim'                 " fuzzy search
Plug 'derekwyatt/vim-scala', { 'for': ['scala', 'sbt.scala'] }
Plug 'eagletmt/neco-ghc'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'gmarik/Vundle.vim'                  " Plugin installation
Plug 'jdkanani/vim-material-theme'        " material theme
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'            " alignment plugin select => enter <num> space
Plug 'leafgarland/typescript-vim'         " typescript syntax
Plug 'majutsushi/tagbar'
Plug 'mhartington/oceanic-next'           " oceanic theme
Plug 'othree/html5.vim'                   " html5 syntax
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'reewr/vim-monokai-phoenix'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'ryanoasis/vim-devicons'             " utf8 icons
Plug 'scrooloose/nerdcommenter'           " commenting plugin
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'                 " git wrapper
Plug 'vim-airline/vim-airline'            " better status bar
Plug 'vim-airline/vim-airline-themes'     " status bar themes
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
call plug#end()

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" Set tab in deoplete to go down through suggestions
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><return> pumvisible() ? "\<c-y>" : "\<return>"

" Enable true colors
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
"colorscheme OceanicNext
set background=dark
colorscheme material-theme

filetype plugin indent on

set cursorline
set laststatus=2


""" Basic
let mapleader = "-"
syn on
inoremap kj <esc>
set number
set ignorecase smartcase
set hlsearch
set scrolloff=5
set expandtab
set tabstop=4 shiftwidth=4
set visualbell

"set list
"set listchars=trail:•,extends:#,precedes:<,nbsp:•,tab:→\ 
"set fillchars=vert:\ ,fold:-


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


""""""""""""""""""""""""""""""""""
"  Airline
""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1


"""""""""""""""""""""""""""""""""
" Focus mode
"""""""""""""""""""""""""""""""""
let g:focus_use_default_mapping = 0


"""""""""""""""""""""""""""""""""
" Basics
"""""""""""""""""""""""""""""""""
set number
set autoindent
set cindent
set ruler
set ignorecase
set showmatch
set incsearch

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




""" General Keyboard shortcuts
nnoremap sc :sp $MYVIMRC<cr>:echom expand("opening $MYVIMRC")<cr>
nnoremap sr :source $MYVIMRC<cr>:echom expand("reloaded $MYVIMRC")<cr>
nnoremap <S-D-}> gt
nnoremap <S-D-{> gT



" Explorer like NERDTree
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'
nnoremap <space>f :VimFiler -toggle<CR>

" clipboard sharing Linux:
"vnoremap <C-c> "+y

" opening files
nnoremap <space><space> :CtrlP .<CR>
nnoremap <space>b :CtrlPBuffer<CR>

" remap ¤ to end of line
nnoremap ¤ <End>

" macOS settings
nnoremap € <End>
set backspace=indent,eol,start
set list
"set listchars=nbsp:¬
set listchars=trail:•,extends:#,precedes:<,nbsp:•,tab:→\ 

" Clear highlighting on escape in normal mode
set hlsearch
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](_site|target|target-0.9.5|\.(git|hg|svn))$',
  \ 'file': '\v\.(swp|so|o|out|bbl|blg|aux|log|toc|jar|class)$',
  \ }

" fix whitespaec marking at end of file
let g:extra_whitespace_ignored_filetypes = ['unite']

" EasyAlign stuff
" From visual mode, select portion to align, press enter then space
vnoremap <silent> <Enter> :EasyAlign<cr>

" Rebind leader key
let mapleader = ","

" Buffered tab bindings
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Normalnavigation on wrapped lines
map j gj
map k gk

" Set tab rules
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

" Set scala-docstrings
" let g:scala_scaladoc_indent = 1

" Highlight characters that go over 80 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd BufNewFile,BufRead *.* match OverLength /\%81v.\+/
autocmd BufNewFile,BufRead *.scala match OverLength /\%121v.\+/
autocmd BufNewFile,BufRead *.html  match OverLength /\%251v.\+/
autocmd BufNewFile,BufRead *.js  match OverLength /\%251v.\+/

" Braces
inoremap {<CR> {<CR>}<Esc>ko

" Move lines with C-j/k
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Enable markdown syntax in md files
au BufRead,BufNewFile *.md set filetype=markdown
