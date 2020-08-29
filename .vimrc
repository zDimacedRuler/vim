syntax on

set noerrorbells
set belloff=all
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8
set cursorline
set noshowmode
set encoding=utf-8

"Enable yanking across vim
set clipboard=unnamed

" Search Settings
set hlsearch
set incsearch
set ignorecase
" Show search count
set shortmess-=S

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme gruvbox
set background=dark
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'


if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "
nnoremap <C-p> :Files<CR>

nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>dr :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>n :tabn<CR>
nnoremap <leader>p :tabp<CR>

nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

" Disable YCM PopUp
set completeopt-=preview

" fzf settings
let $FZF_DEFAULT_OPTS='--reverse'

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='luna'

let g:netrw_browse_split=4
let g:netrw_banner=0
let g:netrw_winsize=25

"Remove all trailing whitespace by pressing F6
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Compiling C++ Mappings
autocmd BufNewFile *.cpp execute "0r ~/.vim/template/".input("Template name: ").".cpp"
nnoremap <F9> :!g++ -g % -o %:r && ./%:r <CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <F2> :w <CR>
nnoremap <F12> :!gdb ./%:r <CR>

