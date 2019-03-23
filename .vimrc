colorscheme desert
syntax enable

"
" Tabs & Spacing
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab


"
" Indentation
"
set autoindent
set expandtab
set cino=l1
set cino=t-0
set cino+=(0
set cindent


"
" Cursor Line
"
set cursorline
hi CursorLine term=bold cterm=bold

"
" Other
"
set number
set showcmd
set lazyredraw
set showmatch
set incsearch
set hlsearch


"
" Key Remap
"
nnoremap j gj
nnoremap k gk
