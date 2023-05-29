-- [[color scheme]] --

vim.opt.termguicolors = true
vim.opt.background = "dark"

-- [nord] --
vim.g.nord_bold = true
vim.g.nord_italic = true
vim.g.nord_italic_comments = true
vim.g.nord_underline = true
vim.g.nord_cursor_line_number_background = true
vim.g.nord_uniform_status_lines = true
vim.g.nord_bold_vertical_split_line = true
vim.g.nord_uniform_diff_background = true

vim.cmd.colorscheme("nord")

vim.cmd([[hi! Normal          ctermbg = NONE guibg = #2E3440]])
vim.cmd([[hi! SignColumn      ctermbg = NONE guibg = NONE   ]])
vim.cmd([[hi! VertSplit       ctermbg = NONE guibg = NONE   ]])
vim.cmd([[hi! NonText         ctermfg = gray guifg = #434c5e]])
vim.cmd([[hi! CocMarkdownLink ctermfg = 12   guifg = #8fbcbb]])
vim.cmd([[hi! CocInlayHint    ctermfg = 12   guifg = #616e88]])

vim.g.coc_status_error_sign = "󰈸 "
vim.g.coc_status_warning_sign = " "
vim.g.lightline = {
    colorscheme        = "nord",
    component          = { lineinfo = " %3l:%-2c", },
    separator          = { left = "", right = "" },
    subseparator       = { left = "", right = "" },
    component_function = {
        readonly   = "LightlineReadonly",
        fugitive   = "LightlineFugitive",
        cocstatus  = "LightlineCoc",
        filetype   = "MyFiletype",
        fileformat = "MyFileformat",
        git        = "GitStatus",
    },
    active             = {
        left = { { "filename" }, { "git", "cocstatus", "readonly", "fugitive", "modified" } },
    },
}

vim.g.lightline.tabline_separator = vim.g.lightline.separator
vim.g.lightline.tabline_subseparator = vim.g.lightline.subseparator

vim.cmd([[
function! LightlineCoc()
  if empty(get(g:, 'coc_status', '')) && empty(get(b:, 'coc_diagnostic_info', {}))
    return ''
  endif
  return trim(coc#status())
endfunction
]])

vim.cmd([[
function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction
]])

vim.cmd([[
function! LightlineFugitive()
    if exists('*FugitiveHead')
        let branch = FugitiveHead()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction
]])

vim.cmd([[
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
]])

vim.cmd([[
function! MyFileformat()
  return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol()) : ''
endfunction
]])

vim.cmd([[
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
]])

vim.api.nvim_create_autocmd("User", {
    pattern = {"CocStatusChange", "CocDiagnosticChange"},
    command = "call lightline#update()"
})
