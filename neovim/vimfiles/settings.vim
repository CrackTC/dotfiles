" ===
" === System
" ===
let t_ut=''
set clipboard+=unnamedplus
set mouse=
set fileencodings=ucs-bom,utf-8,default,gbk,latin1

" ===
" === Editor Behavior
" ===
set number
set relativenumber
set cursorline
set hlsearch
set ruler
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set nowrap
" set linebreak " Reserve Whole Word While Wrapping
set timeoutlen=500
set textwidth=0
set indentexpr=""
set foldmethod=indent
set foldlevel=99
set foldenable
set noshowmode
set hidden
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split " Quick Preview While Replacing Words
set completeopt=longest,noinsert,menuone,noselect,preview " Build-in Completion Config
set lazyredraw
silent !mkdir -p ~/.config/nvim/tmp/backup
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
silent !mkdir -p ~/.config/nvim/tmp/undo
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set updatetime=90
set virtualedit=block

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
exec "nohlsearch"

