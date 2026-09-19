filetype on
filetype indent on
filetype plugin on

set expandtab
set hlsearch
set ignorecase
set incsearch
set mouse=a
set nobackup
set nocompatible
set nowrap
set number relativenumber
set shiftwidth=2
set showmatch
set smartcase
set tabstop=2

set wildignore=*.jpg,*.png,*.gif,*.pdf,*.exe,*.flv,*.img,*.xlsx,*.docx
set wildmenu
set wildmode=list:longest

syntax on

" STATUS LINE -------------------------------------------------- {{{
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2
" }}}
