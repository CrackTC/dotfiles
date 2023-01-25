" TODO: Install and config these plugins:
" Plug 'skywind3000/asynctasks.vim'
" Plug 'skywind3000/asyncrun.vim'

call plug#begin('~/.config/nvim/plugged')

" Custom Color Scheme and Bar

Plug 'arcticicestudio/nord-vim'
" Plug 'rakr/vim-one'
" Plug 'morhetz/gruvbox'

" Start screen for vim
Plug 'mhinz/vim-startify'

" TODO: Configuration
Plug 'itchyny/lightline.vim'

" Git diff markers in sign column
Plug 'airblade/vim-gitgutter'

" TODO: Switch to another alternative:'RRethy/vim-hexokinase'.
" Plug 'ap/vim-css-color'

Plug 'ryanoasis/vim-devicons'

" TODO: Learn how to use.
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" Markdown

" TODO: Learn how to use.
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for':['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" TODO: Learn how to use
" Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }

" Auto Generate Toc
" Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }

" Automatic labeling
Plug 'dkarter/bullets.vim', { 'for': ['text', 'markdown', 'vim-plug', 'gitcommit', 'scratch'] }

" TODO: Install & Configuration.
" Plug 'vimwiki/vimwiki'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'liuchengxu/vista.vim', {'on': 'Vista'}

" Plug 'OmniSharp/omnisharp-vim', {'for' :['cs', 'vim-plug']}

" ===
" Plug 'dense-analysis/ale', {'for' :['cs', 'vim-plug']}
Plug 'jackguo380/vim-lsp-cxx-highlight', {'for' :['c', 'cpp', 'vim', 'vim-plug']}

" TODO: Learn how to use.
" Plug 'mattn/emmet-vim', {'for' :['html', 'xml', 'css', 'vim-plug']}

" TODO: Learn how to use.
" Manual: https://puremourning.github.io/vimspector-web/
" Plug 'puremourning/vimspector'

" Quick find file
" TODO: Configuration
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

Plug 'theniceboy/antovim' " gs to switch

Plug 'CrackTC/argtextobj.vim' " daa to delete an argument

Plug 'rhysd/clever-f.vim'

Plug 'lambdalisue/suda.vim'

Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

Plug 'luochen1990/rainbow'

Plug 'junegunn/vim-after-object'

Plug 'mg979/vim-xtabline'

" Plug 'kevinhwang91/rnvimr', { 'on': 'RnvimrToggle' }

Plug 'svermeulen/vim-subversive'

Plug 'airblade/vim-rooter'

Plug 'chrisbra/NrrwRgn', { 'on': 'NR' }

" Gitignore Highlighting
Plug 'theniceboy/vim-gitignore'

" Plug 'itchyny/calendar.vim', { 'on': 'Calendar' }

" gS to split & gJ to join
" Plug 'AndrewRadev/splitjoin.vim'

Plug 'easymotion/vim-easymotion'

Plug 'pechorin/any-jump.vim'

" fish syntax highlighting
Plug 'nickeb96/fish.vim'

call plug#end()

