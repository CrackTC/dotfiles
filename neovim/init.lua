--  __  ____   ___   ___     _____ __  __ ____   ____
-- |  \/  \ \ / / \ | \ \   / /_ _|  \/  |  _ \ / ___|
-- | |\/| |\ V /|  \| |\ \ / / | || |\/| | |_) | |
-- | |  | | | | | |\  | \ V /  | || |  | |  _ <| |___
-- |_|  |_| |_| |_| \_|  \_/  |___|_|  |_|_| \_\\____|

-- Auto Download Plugin For First Time Use.
if not vim.fn.filereadable('~/.config/nvim/autoload/plug.vim') then
    os.execute(
        'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    vim.api.nvim_create_autocmd("VimEnter", {
        pattern = { "*" },
        command = "PlugInstall --sync | source $MYVIMRC"
    })
end

require('utils')
require('settings')
require('keybindings')
require('plugin')
require('colorscheme')
require('filetype')

if vim.fn.exists('g:neovide') then
    require('neovide')
end


vim.cmd([[
noremap <LEADER>rc :e $MYVIMRC<CR>
inoremap <C-u> <ESC>mzgUiw`za
nnoremap <C-u> mzgUiw`z

noremap b- :bp<CR>
noremap b= :bn<CR>


" coc.nvim
let g:coc_global_extensions = [
    \ 'coc-clangd'      ,
    \ 'coc-css'         ,
    \ 'coc-gitignore'   ,
    \ 'coc-go'          ,
    \ 'coc-html'        ,
    \ 'coc-json'        ,
    \ 'coc-lua'         ,
    \ 'coc-marketplace' ,
    \ 'coc-pairs'       ,
    \ 'coc-snippets'    ,
    \ 'coc-translator'  ,
    \ 'coc-tsserver'    ,
    \ 'coc-vimlsp'      ,
    \ 'coc-yaml'        ,
    \ 'coc-yank'        ,
\ ]

" pum highlighting
highlight CocFloating          ctermbg = 8         guibg = None
highlight CocSearch            cterm   = undercurl gui   = undercurl
highlight CocMenuSel           ctermbg = 14        guibg = #8fbcbb   ctermfg = 8 guifg = #2E3440
highlight CocFloatThumb        ctermbg = 7         guibg = #d8dee9   ctermfg = 8 guifg = #2E3440
highlight CocFloatSbar         ctermfg = 8         guifg = #2E3440   ctermbg = 8 guibg = #2E3440
highlight CocFloatDividingLine ctermfg = 7         guifg = #d8dee9

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<TAB>'
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ CheckBackspace() ? "\<TAB>" :
            \ coc#refresh()

inoremap <silent> <CR> <C-g>u<CR><C-r>=coc#on_enter()<CR>
inoremap <silent><expr> <C-SPACE> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>m <Plug>(coc-format)
nmap <silent> <LEADER>rn <Plug>(coc-rename)
vmap <silent> m <Plug>(coc-format-selected)
nmap <silent> <A-h> <Plug>(coc-float-hide)
nnoremap <silent> <LEADER>a <Plug>(coc-codeaction)

nnoremap <C-c> :CocCommand<CR>
nnoremap <LEADER>dd :CocList diagnostics<CR>
nnoremap <LEADER>dc :call Show_documentation()<CR>

function! Show_documentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    endif
endfunction

" Text Objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Coc-Yank
nnoremap <silent> <LEADER>p :<C-u>CocList --normal yank<CR>

" Coc-Translator
nmap <silent> ts <Plug>(coc-translator-p)
vmap <silent> ts <Plug>(coc-translator-pv)

" Coc-Todolist
nnoremap tn :CocCommand todolist.create<CR>
nnoremap do :CocList --normal todolist<CR>
nnoremap <LEADER>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>

" Coc-Gitignore
nnoremap <silent> <LEADER>gi :CocList gitignore<CR>

" FZF
nnoremap <C-f> :Rg<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-h> :History<CR>
nnoremap <C-l> :Lines<CR>
nnoremap <C-w> :Buffers<CR>
nnoremap <LEADER>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
    execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
    \ 'source'  :  s:list_buffers(),
    \ 'sink*'   :  { lines -> s:delete_buffers(lines) },
    \ 'options' :  '--multi --reverse --bind ctrl-a:select-all+accept'
    \ }))

noremap <C-d> :BD<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" Undotree
nnoremap <LEADER>k :UndotreeToggle<CR>

let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators    = 1
let g:undotree_WindowLayout       = 2
let g:undotree_DiffpanelHeight    = 8
let g:undotree_SplitWidth         = 24

" Clever-F
let g:clever_f_chars_match_any_signs = ';'

" GitGutter
let g:gitgutter_map_keys = 0
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap g- :GitGutterPrevHunk<CR>
nnoremap g= :GitGutterNextHunk<CR>
nnoremap <LEADER>G :GitGutterPreviewHunk<CR>

" Tabular
vmap a :Tabularize /

" Vim-After-Object
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" Rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
    \ 'guifgs': ['#5e81ac', '#81a1c1', '#88c0d0', '#8fbcbb'],
\ }

" Xtabline
let g:xtabline_settings                 = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes   = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap to :XTabMode<CR>

" Vim-Subversive
nmap r <Plug>(SubversiveSubstitute)
nmap rr <Plug>(SubversiveSubstituteLine)

" Vim-Visual-Multi
let g:VM_maps = {}
let g:VM_maps['Find Under'] = 'n'
let g:VM_maps['Find Subword Under'] = 'n'

" Vim-Illuminate
let g:Illuminate_delay = 250
highlight IlluminatedWordText cterm = undercurl gui = undercurl

" Vim-Rooter
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

" NrrwRgn
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
noremap <c-y> :NR<CR>

" Vim-Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1

nmap ss <Plug>(easymotion-overwin-f2)

map <LEADER>J <PLUG>(easymotion-j)
map <LEADER>K <PLUG>(easymotion-k)

" Any-Jump
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9

" Copilot
let g:copilot_filetypes = {
            \ 'markdown': v:true,
            \ }
]])
