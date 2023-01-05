autocmd FileType markdown inoremap <buffer> ,f <ESC>/<++><CR>:nohl<CR>ca>
autocmd FileType markdown inoremap <buffer> ,b **** <++><ESC>2F*i
autocmd FileType markdown inoremap <buffer> ,i ** <++><ESC>F*i
autocmd FileType markdown inoremap <buffer> ,w ****** <++><ESC>3F*i
autocmd FileType markdown inoremap <buffer> ,d `` <++><ESC>F`i
autocmd FileType markdown inoremap <buffer> ,c ```<CR><++><CR>```<CR><++><ESC>4kA
autocmd FileType markdown inoremap <buffer> ,s ~~~~ <++><ESC>2F~i
autocmd FileType markdown inoremap <buffer> ,p ![](<++>) <++><ESC>F]i
autocmd FileType markdown inoremap <buffer> ,a [](<++>) <++><ESC>F]i
autocmd FileType markdown inoremap <buffer> ,l --------<CR>
autocmd FileType markdown inoremap <buffer> ,m - [ ] 
autocmd FileType markdown inoremap <buffer> ,1 #<SPACE><CR><++><ESC>kA
autocmd FileType markdown inoremap <buffer> ,2 ##<SPACE><CR><++><ESC>kA
autocmd FileType markdown inoremap <buffer> ,3 ###<SPACE><CR><++><ESC>kA
autocmd FileType markdown inoremap <buffer> ,4 ####<SPACE><CR><++><ESC>kA
autocmd FileType markdown inoremap <buffer> ,5 #####<SPACE><CR><++><ESC>kA
autocmd FileType markdown inoremap <buffer> ,6 ######<SPACE><CR><++><ESC>kA
