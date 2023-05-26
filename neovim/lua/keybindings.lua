vim.cmd([[
" ===
" === Basic Mappings
" ===
let mapleader=" "
noremap ; :

nnoremap S :w<CR>
nnoremap Q :q<CR>

nnoremap Y y$

nnoremap < <<
nnoremap > >>

noremap N $
noremap P 0
noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l

nnoremap <A-n> 5<C-e>
nnoremap <A-p> 5<C-y>

" ===
" === Searching
" ===
nnoremap - N
nnoremap = n
noremap <LEADER><CR> :nohlsearch<CR>

" ===
" === Window Management
" ===
noremap s <nop>

nnoremap sl :set splitright<CR>:vsplit<CR>
nnoremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nnoremap sj :set splitbelow<CR>:split<CR>
nnoremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>

nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gh <C-w>h
nnoremap gl <C-w>l

noremap <UP> :resize +5<CR>
noremap <DOWN> :resize -5<CR>
noremap <LEFT> :vertical resize-5<CR>
noremap <RIGHT> :vertical resize+5<CR>

" ===
" === Tab Management
" ===
nnoremap tj :-tabe<CR>
nnoremap tk :tabe<CR>

nnoremap th :-tabnext<CR>
nnoremap tl :+tabnext<CR>

nnoremap tmh :-tabmove<CR>
nnoremap tml :+tabmove<CR>

nnoremap <LEADER>1 1gt
nnoremap <LEADER>2 2gt
nnoremap <LEADER>3 3gt
nnoremap <LEADER>4 4gt
nnoremap <LEADER>5 5gt
nnoremap <LEADER>6 6gt
nnoremap <LEADER>7 7gt
nnoremap <LEADER>8 8gt
nnoremap <LEADER>9 9gt

" ===
" === Terminal Behavior
" ===
autocmd TermOpen term://* startinsert
tnoremap <C-q> <C-\><C-n>
tnoremap <C-o> <C-\><C-n><C-o>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Open Simple Terminal(St) With The Cwd
nnoremap <LEADER>st :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-n>:q<CR>

" Open A New Terminal Window
nnoremap <LEADER>ty :set splitbelow<CR>:split<CR>:resize +10<CR>:term<CR>

" ===
" === Insert Mode Cursor Movement
" ===
" Move To The End Of A Line
inoremap <C-a> <ESC>A

" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <HOME>
cnoremap <C-e> <END>
cnoremap <C-p> <LEFT>
cnoremap <C-n> <RIGHT>

nmap <LEADER>rr r$
]])
