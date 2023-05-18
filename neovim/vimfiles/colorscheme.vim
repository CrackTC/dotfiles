set termguicolors

" one
" let g:one_allow_italics = 1

set background=dark

" nord
let g:nord_bold                          = 1
let g:nord_italic                        = 1
let g:nord_italic_comments               = 1
let g:nord_underline                     = 1
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines          = 1
let g:nord_bold_vertical_split_line      = 1
let g:nord_uniform_diff_background       = 1

colorscheme nord

" gruvbox
" let g:gruvbox_italic            = 1
" let g:gruvbox_contrast_dark     = 'soft'
" let g:gruvbox_contrast_light    = 'soft'
" let g:gruvbox_invert_selection  = 0
" let g:gruvbox_improved_strings  = 1
" let g:gruvbox_improved_warnings = 1

hi! Normal     ctermbg = NONE guibg = #2E3440
hi! SignColumn ctermbg = NONE guibg = NONE
hi! VertSplit  ctermbg = NONE guibg = NONE
hi! NonText    ctermfg = gray guifg = grey10

let g:coc_status_error_sign   = '󰈸 '
let g:coc_status_warning_sign = ' '

let g:lightline = {
			\ 'colorscheme' : "nord",
			\ 'component': {
			\   'lineinfo': ' %3l:%-2c'
			\ },
			\ 'separator': { 'left': '', 'right': '' },
			\ 'subseparator': { 'left': '', 'right': '' },
			\ 'component_function': {
			\   'readonly'   : 'LightlineReadonly',
			\   'fugitive'   : 'LightlineFugitive',
			\   'cocstatus'  : 'LightlineCoc',
			\   'filetype'   : 'MyFiletype',
			\   'fileformat' : 'MyFileformat',
			\   'git'        : 'GitStatus',
			\ },
			\ 'active'       : {
			\ 'left': [ [ 'filename' ],
			\             [ 'git', 'cocstatus', 'readonly', 'fugitive', 'modified' ] ]
			\ }
			\ }

let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator

function! LightlineCoc()
  if empty(get(g:, 'coc_status', '')) && empty(get(b:, 'coc_diagnostic_info', {}))
    return ''
  endif
  return trim(coc#status())
endfunction

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
    if exists('*FugitiveHead')
        let branch = FugitiveHead()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
