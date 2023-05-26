vim.cmd([[
call plug#begin('~/.config/nvim/plugged')

" Color Scheme
" Plug 'rakr/vim-one'
" Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" cool status line
Plug 'itchyny/lightline.vim'

" Git diff markers in sign column
Plug 'airblade/vim-gitgutter'

Plug 'ryanoasis/vim-devicons'

" TODO: Learn how to use.
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Automatic labeling
Plug 'dkarter/bullets.vim', { 'for': ['text', 'markdown', 'vim-plug', 'gitcommit', 'scratch'] }

" conquer of completion~
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Quick find file
Plug 'junegunn/fzf.vim'

" Tim Pope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" Press <Enter> to quickly select nearest text object.
Plug 'gcmt/wildfire.vim'

" Press <C-n> to create cursors that match the current word.
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Vim manuals in chinese.
Plug 'yianwillis/vimcdoc'

" Highlight the same word in document after a delay
Plug 'RRethy/vim-illuminate'

" gs to switch
Plug 'theniceboy/antovim'

" daa to delete an argument
Plug 'CrackTC/argtextobj.vim'

" enhanced f and t motions
Plug 'rhysd/clever-f.vim'

" handle privilledge issues
Plug 'lambdalisue/suda.vim'

" align lines with specific pattern
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" rainbow brackets
Plug 'luochen1990/rainbow'

Plug 'junegunn/vim-after-object'

Plug 'mg979/vim-xtabline'

" smarter replace motions
Plug 'svermeulen/vim-subversive'

" auto switch cwd
Plug 'airblade/vim-rooter'

Plug 'chrisbra/NrrwRgn', { 'on': 'NR' }

" highlighting for gitignore
Plug 'theniceboy/vim-gitignore'

" ss to quick jump
Plug 'easymotion/vim-easymotion'

" fish syntax highlighting
Plug 'nickeb96/fish.vim'

" Github Copilot
Plug 'github/copilot.vim'

call plug#end()
]])
