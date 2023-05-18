"  __  ____   ___   ___     _____ __  __ ____   ____
" |  \/  \ \ / / \ | \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| |\ V /|  \| |\ \ / / | || |\/| | |_) | |
" | |  | | | | | |\  | \ V /  | || |  | |  _ <| |___
" |_|  |_| |_| |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" ===
" === Auto Download Plugin For First Time Use.
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source ~/.config/nvim/vimfiles/settings.vim
source ~/.config/nvim/vimfiles/mappings.vim
source ~/.config/nvim/vimfiles/neovide.vim

" ===
" === Markdown Settings
" ===
source ~/.config/nvim/vimfiles/markdown.vim
" autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.md setlocal nowrap

" ===
" === Lisp Settings
" ===
autocmd BufRead,BufNewFile *.lisp let b:coc_pairs_disabled = ['<', "'"]

" ===
" === Other Useful Stuff
" ===
" Open Fold
nnoremap <silent> <LEADER>o za

" Select To End Of A Line (Without EOL)
nnoremap vv 0v$h

" Replace Next Place Holder And Insert
nnoremap <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>ca>

" Toggle Spelling Checking
nnoremap <LEADER>sc :setlocal spell!<CR>

" Toggle Wrap
nnoremap <LEADER>wp :setlocal wrap!<CR>

" Change Case
noremap ` ~

" Generate ASCII Image
nnoremap <LEADER>f :r !figlet 

" Show CWD
noremap \p :echo expand('%:p')<CR>

" Move Line Up/Down
nnoremap <A-k> ddkP
nnoremap <A-j> ddp

" Press <A-s> To Show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
map <A-s> :call SynGroup()<CR>

" Quick Surround
xmap " S"
xmap ' S'
xmap } S}
xmap ] S]
" xmap 0 S)
" xmap > S>
xmap t St

xmap i0 i)
xmap a0 a)
omap a0 a)
omap i0 i)
nmap ds0 ds)

" Compile Function
noremap R :call CompileRun()<CR>
function! CompileRun()
    execute "w"
    if filereadable('Makefile')
        set splitbelow
        :split
        :resize -5
        :terminal make clean build run
    elseif filereadable(expand('%:p:h') . '/Makefile')
        set splitbelow
        :split
        :resize -5
        :terminal make clean build run -C %:p:h
    elseif &filetype == 'c'
        set splitbelow
        exec "!clang % -Wall -g -lm -o %<"
        :split
        :resize -5
        :terminal time ./%<
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!clang++ -O0 -std=c++11 -Wall -g -o %< %"
        :split
        :resize -5
        :terminal time ./%<
    elseif &filetype == 'java'
        execute '!javac %'
        execute '!time java %<'
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'lisp'
        set splitbelow
        :split
        :terminal sbcl --script %
    elseif &filetype == 'python'
        set splitbelow
        :split
        :terminal python3 %
    elseif &filetype == 'html'
        silent! execute "!chromium % &"
    elseif &filetype == 'markdown'
        execute "MarkdownPreview"
    elseif &filetype == 'tex'
        silent! execute "VimtexStop"
        silent! execute "VimtexCompile"
    elseif &filetype == 'dart'
        execute "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
        silent! execute "CocCommand flutter.dev.openDevLog"
    elseif &filetype == 'javascript'
        set splitbelow
        :split
        :terminal export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
        set splitbelow
        :split
        :terminal go run .
    elseif &filetype == "cs"
        set splitbelow
        :split
        :terminal dotnet run
    elseif &filetype == "php"
        set splitbelow
        :split
        :terminal php %
    elseif &filetype == "scheme"
        set splitbelow
        :split
        :terminal mit-scheme < '%'
    endif
endfunction

noremap <LEADER>rc :e $MYVIMRC<CR>
inoremap <C-u> <ESC>mzgUiw`za
nnoremap <C-u> mzgUiw`z

noremap b- :bp<CR>
noremap b= :bn<CR>

" ===
" === Sources
" ===
source ~/.config/nvim/vimfiles/plugin.vim
source ~/.config/nvim/vimfiles/colorscheme.vim
source ~/.config/nvim/vimfiles/filetype.vim

" ===
" === Coc.Nvim
" ===
" TODO: Install & Config Coc-Explorer, Coc-Lists, Coc-Prettier, Coc-Snippets, Coc-Tasks
let g:coc_global_extensions = [
            \ 'coc-clangd'      ,
            \ 'coc-css'         ,
            \ 'coc-explorer'    ,
            \ 'coc-gitignore'   ,
            \ 'coc-go'          ,
            \ 'coc-html'        ,
            \ 'coc-json'        ,
            \ 'coc-marketplace' ,
            \ 'coc-pairs'       ,
            \ 'coc-python'      ,
            \ 'coc-snippets'    ,
            \ 'coc-tasks'       ,
            \ 'coc-translator'  ,
            \ 'coc-tsserver'    ,
            \ 'coc-vimlsp'      ,
            \ 'coc-yaml'        ,
            \ 'coc-yank'        ,
\ ]

" pum highlighting
highlight CocFloating ctermbg = 8 guibg = None
highlight CocSearch cterm = undercurl gui = undercurl
highlight CocMenuSel ctermbg = 14 guibg = #8fbcbb ctermfg = 8 guifg = #3b4252
highlight CocFloatThumb ctermbg = 7 guibg = #d8dee9
highlight CocFloatDividingLine ctermfg = 7 guifg = #d8dee9

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#confirm()
            \                   : CheckBackspace() ? "\<TAB>"
            \                                      : coc#refresh()

inoremap <silent> <CR> <C-g>u<CR><C-r>=coc#on_enter()<CR>
inoremap <silent><expr> <C-SPACE> coc#refresh()
let g:coc_snippet_next = '<TAB>'

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

nnoremap <C-c> :CocCommand<CR>
nnoremap <LEADER>a :CocAction<CR>
nnoremap <LEADER>dd :CocList diagnostics<CR>
nnoremap <LEADER>dc :call Show_documentation()<CR>

function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
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

" Coc-Explorer
nnoremap <LEADER>h :CocCommand explorer<CR>

" Coc-Translator
nmap <silent> ts <Plug>(coc-translator-p)
vmap <silent> ts <Plug>(coc-translator-pv)

" Coc-Todolist
nnoremap tn :CocCommand todolist.create<CR>
nnoremap do :CocList --normal todolist<CR>
nnoremap <LEADER>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>

" Coc-Tasks
nnoremap <silent> <LEADER>tk :CocList tasks<CR>

" Coc-Gitignore
nnoremap <silent> <LEADER>gi :CocList gitignore<CR>

" ===
" === Omnisharp
" ===
" let g:Omnisharp_typeLookupInPreview = 1
" let g:omnicomplete_fetch_full_documentation = 1
" let g:OmniSharp_server_use_net6 = 1
" let g:Omnisharp_highlight_types = 2

" autocmd FileType cs nnoremap <buffer> <LEADER>m :OmniSharpCodeFormat<CR>
" autocmd FileType cs nnoremap <buffer> <LEADER>dc :OmniSharpDocumentation<CR>
" autocmd FileType cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
" autocmd FileType cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
" autocmd FileType cs nnoremap <buffer> <LEADER>a :OmniSharpGetCodeActions<CR><C-\><C-n>:resize +5<CR>i
" autocmd FileType cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>
" autocmd FileType cs setlocal tabstop=4
" autocmd FileType cs setlocal shiftwidth=4

" sign define OmniSharpCodeActions text=💡

" augroup OSCountCodeActions
" 	autocmd!
" 	autocmd FileType cs set signcolumn=yes
" 	autocmd CursorHold *.cs call OSCountCodeActions()
" augroup END

" function! OSCountCodeActions() abort
" 	if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
" 	if !OmniSharp#IsServerRunning() | return | endif
" 	let opts = {
" 				\ 'CallbackCount': function('s:CBReturnCount'),
" 				\ 'CallbackCleanup': {-> execute('sign unplace 99')}
" 				\}
" 	call OmniSharp#actions#codeactions#Count(opts)
" endfunction

" function! s:CBReturnCount(count) abort
" 	if a:count
" 		let l = getpos('.')[1]
" 		let f = expand('%:p')
" 		execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
" 	endif
" endfunction

" ===
" === ALE
" ===
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'

let g:ale_linters = { 'cs': ['OmniSharp'] }


" ===
" === Vim Table Mode
" ===
nnoremap <LEADER>tm :TableModeToggle<CR>

" ===
" === FZF
" ===
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

" ===
" === Undotree
" ===
nnoremap <LEADER>k :UndotreeToggle<CR>

let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators    = 1
let g:undotree_WindowLayout       = 2
let g:undotree_DiffpanelHeight    = 8
let g:undotree_SplitWidth         = 24

" ===
" === Vimspector
" ===
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_sidebar_width = 35
let g:vimspector_code_minwidth = 50
let g:vimspector_terminal_minwidth = 30

noremap <A-q> :VimspectorReset<CR>
noremap <A-w> :VimspectorWatch 
noremap <A-e> :VimspectorEval 

sign define vimspectorBP text= texthl=Normal
sign define vimspectorBPDisabled text= texthl=Normal
sign define vimspectorPC text= texthl=Normal

" ===
" === Vimwiki
" ===
let g:vimwiki_list = [{
    \ 'path'             : '~/vimwiki',
    \ 'template_path'    : '~/vimwiki/templates/',
    \ 'template_default' : 'markdown',
    \ 'syntax'           : 'markdown',
    \ 'ext'              : '.md',
    \ 'path_html'        : '~/vimwiki/site_html/',
    \ 'custom_wiki2html' : 'vimwiki_markdown',
    \ 'template_ext'     : '.tpl'}]

" ===
" === Clever-F
" ===
let g:clever_f_chars_match_any_signs = ';'

" ===
" === Suda
" ===
let g:suda_smart_edit = 1

" ===
" === GitGutter
" ===
let g:gitgutter_map_keys = 0
" let g:gitgutter_sign_added = '▎'
" let g:gitgutter_sign_modified = '░'
" let g:gitgutter_sign_removed = '▏'
" let g:gitgutter_sign_removed_first_line = '▔'
" let g:gitgutter_sign_modified_removed = '▒'
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap g- :GitGutterPrevHunk<CR>
nnoremap g= :GitGutterNextHunk<CR>
nnoremap <LEADER>G :GitGutterPreviewHunk<CR>

" ===
" === Vista
" ===
noremap <LEADER>l :Vista!!<CR>
noremap <C-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent          = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive    = 'coc'
let g:vista_fzf_preview          = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons       = {
			\ "func"           : "",
			\ "function"       : "",
			\ "functions"      : "",
			\ 'var'            : "",
			\ "variable"       : "",
			\ 'variables'      : "",
			\ 'const'          : "",
			\ 'constant'       : "",
			\ 'method'         : "",
			\ 'package'        : "",
			\ 'packages'       : "",
			\ 'enum'           : "",
			\ 'enumerator'     : "",
			\ 'module'         : "",
			\ 'modules'        : "",
			\ 'type'           : "",
			\ 'typedef'        : "",
			\ 'types'          : "",
			\ 'field'          : "綠",
			\ 'fields'         : "綠",
			\ 'macro'          : "",
			\ 'macros'         : "",
			\ 'map'            : "",
			\ 'class'          : "",
			\ 'augroup'        : "",
			\ 'struct'         : "פּ",
			\ 'union'          : "",
			\ 'member'         : "",
			\ 'target'         : "",
			\ 'property'       : "襁",
			\ 'interface'      : "",
			\ 'namespace'      : "",
			\ 'subroutine'     : "羚",
			\ 'implementation' : "",
			\ 'typeParameter'  : "",
			\ 'default'        : ""
			\}

" ===
" === Tabular
" ===
vmap a :Tabularize /

" ===
" === Vim-After-Object
" ===
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" ===
" === Rainbow
" ===
let g:rainbow_active = 1
let g:rainbow_conf = {
            \ 'guifgs': ['#81A1C1', '#EBCB8B', '#8FBCBB', '#B48EAD'],
      \ }

" ===
" === Xtabline
" ===
let g:xtabline_settings                 = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes   = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap to :XTabMode<CR>

" ===
" === Vim-Markdown-Toc
" ===
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text              = 'TOC'
let g:vmt_fence_closing_text      = '/TOC'

" ===
" === Rnvimr
" ===
let g:rnvimr_enable_ex     = 1
let g:rnvimr_enable_picker = 1
let g:rnvimr_presets       = [{'width': 0.8, 'height': 0.8}]
highlight link RnvimrNormal CursorLine
nnoremap <silent> <LEADER>e :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
			\ '<C-t>': 'NvimEdit tabedit',
			\ '<C-x>': 'NvimEdit split',
			\ '<C-v>': 'NvimEdit vsplit',
			\ 'gw': 'JumpNvimCwd',
			\ 'yw': 'EmitRangerCwd'
			\ }

" ===
" === Vim-Subversive
" ===
nmap r <Plug>(SubversiveSubstitute)
nmap rr <Plug>(SubversiveSubstituteLine)

" ===
" === Vim-Visual-Multi
" ===
let g:VM_maps = {}
let g:VM_maps['Find Under'] = 'n'
let g:VM_maps['Find Subword Under'] = 'n'

" ===
" === Vim-Illuminate
" ===
let g:Illuminate_delay          = 250
highlight IlluminatedWordText cterm = undercurl gui = undercurl

" ===
" === Vim-Rooter
" ===
let g:rooter_patterns     = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

" ===
" === NrrwRgn
" ===
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
noremap <c-y> :NR<CR>

" ===
" === Calendar
" ===
" noremap \\ :Calendar -view=clock -position=here<CR>

" let g:calendar_google_calendar      = 1
" let g:calendar_google_task          = 1
" let g:calendar_google_api_key       = 'AIzaSyA6fAU5C1r5rMsiwxb7-CPNWm_M8gZpsIo'
" let g:calendar_google_client_id     = '168755098063-lbht3c3im6vlltj9p5k18sochlsa9gps.apps.googleusercontent.com'
" let g:calendar_google_client_secret = 'VPADRlMUXumXP762fLG_Kgfv'

" ===
" === Vim-Easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade   = 0
let g:EasyMotion_smartcase  = 1

nmap ss <Plug>(easymotion-overwin-f2)

map <LEADER>J <PLUG>(easymotion-j)
map <LEADER>K <PLUG>(easymotion-k)

" ===
" === Any-Jump
" ===
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9

" ===
" === semshi
" ===
" let g:semshi#excluded_hl_groups = []
" let g:semshi#mark_selected_nodes = 0
" let g:semshi#simplify_markup = 0
" let g:semshi#error_sign = 0

" ===
" === braceless
" ===
" autocmd FileType python BracelessEnable +indent +fold +highlight
