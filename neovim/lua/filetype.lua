vim.cmd([[
" Markdown {{{
augroup Markdown
    autocmd!
    autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
augroup END
" }}}
]])
