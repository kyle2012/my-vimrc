set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set splitright
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
call vundle#begin()

set clipboard=unnamed

syntax enable
set background=dark
set expandtab
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number
set list
set hlsearch
set nowrap
set foldenable
set guifont=Monaco:h12

" set relative line numbers
"set rnu

" visual mode: don't deselect text when identing
vnoremap > >gv
vnoremap < <gv

let g:jsx_ext_required = 0 " allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
"highlight link SyntasticErrorSign SignColumn
"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn

let mapleader = "\<Space>"

" config for 'kien/ctrlp.vim'
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'raw'
let g:ctrlp_show_hidden = 1

" ignores entries specified in .gitignore.
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others | grep -v "^\..*$"'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .']
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

" leader y as yank to OS clipboard
"vmap <leader>y "+y

" leader leader as :nohlsearch
map <leader><Esc> :nohlsearch<CR>

" set leader w as :w
noremap <leader>w :w<CR>

" set leader q as :q
noremap <leader>q :q<CR>

" reload vim
map <silent> <leader>r :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" set mapping to navigate between open split windows
noremap <C-J> <C-W>j<C-W>_
noremap <C-k> <C-W>k<C-W>_
noremap <C-h> <C-W>h<C-W>_
noremap <C-l> <C-W>l<C-W>_

noremap <leader>] :GtagsCursor<CR>
"noremap <leader>[ <C-w><C-v><C-]>
noremap <leader>' ciw''<Esc>P
noremap <Leader>" ciw""<Esc>P
vnoremap <Leader>' s''<Esc>P
vnoremap <Leader>" s""<Esc>P
vnoremap <Leader>p s<C-r>0<Esc>
noremap <Leader>o o<Esc>
noremap <Leader><Enter> i<Enter><Esc>
noremap <Leader>u :CtrlPMRU<CR>

"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>

map <F3> :NERDTreeFind<CR>
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-sensible'
Plugin 'ervandew/supertab'
Plugin 'sheerun/vim-polyglot'
"Plugin 'Raimondi/delimitMate'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'
Plugin 'plasticboy/vim-markdown'
Plugin 'ap/vim-css-color'
Plugin 'mxw/vim-jsx'
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-endwise'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-projectionist'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'crusoexia/vim-monokai'
"there exists ctrlp mru support
"Plugin 'vim-scripts/mru.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'neomake/neomake'
Plugin 't9md/vim-choosewin'
Plugin 'gtags.vim'
"Plugin 'sbdchd/neoformat'
Plugin 'majutsushi/tagbar'
"Plugin 'haya14busa/incsearch.vim'
"Plugin 'haya14busa/incsearch-easymotion.vim'

map <F2> :NERDTreeToggle<CR>

call vundle#end()
filetype plugin indent on

" nerdtree"
map <C-n> :NERDTreeToggle<CR>
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

let NERDTreeShowHidden=1

" column 80 indication"
"let &colorcolumn=join(range(81,999),",")
"let &colorcolumn="80".join(range(120,999),",")
let &colorcolumn="80"
"highlight ColorColumn ctermbg=235 guibg=#2c2d27

set runtimepath^=~/.vim/bundle/ag
let g:ag_working_path_mode="r"
let g:ag_highlight=1

nmap - <Plug>(choosewin)
"let g:choosewin_overlay_enable = 1

if executable('ag')
  " note we extract the column as well as the file and line number
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
endif
call neomake#configure#automake('nw', 750)
"augroup fmt
  "autocmd!
  "autocmd BufWritePre * undojoin | Neoformat
"augroup END
ca ag Ag!
nnoremap ,c :let @* = expand("%:p").":".line('.')<cr>
syntax on
"set background=dark
"colorscheme janah
"colorscheme molokai
"colorscheme soruby
"colorscheme railscasts
"colorscheme base
"colorscheme lucid
colorscheme lizard256
"
set cursorline
"hi clear CursorLine
"hi CursorLine gui=underline cterm=underline

hi Search ctermbg=118
hi Search guibg=#A6E22E
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
