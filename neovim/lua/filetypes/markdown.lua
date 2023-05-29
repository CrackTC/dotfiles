-- [[markdown settings]] --

local function apply_markdown_mappings()
    buffered_inoremap(',f', '<ESC>/<++><CR>:nohl<CR>ca>')
    buffered_inoremap(',b', '**** <++><ESC>2F*i')
    buffered_inoremap(',i', '** <++><ESC>F*i')
    buffered_inoremap(',w', '****** <++><ESC>3F*i')
    buffered_inoremap(',d', '`` <++><ESC>F`i')
    buffered_inoremap(',c', '```<CR><++><CR>```<CR><++><ESC>4kA')
    buffered_inoremap(',s', '~~~~ <++><ESC>2F~i')
    buffered_inoremap(',p', '![](<++>) <++><ESC>F]i')
    buffered_inoremap(',a', '[](<++>) <++><ESC>F]i')
    buffered_inoremap(',l', '--------<CR>')
    buffered_inoremap(',m', '- [ ]')
    buffered_inoremap(',1', '#<SPACE><CR><++><ESC>kA')
    buffered_inoremap(',2', '##<SPACE><CR><++><ESC>kA')
    buffered_inoremap(',3', '###<SPACE><CR><++><ESC>kA')
    buffered_inoremap(',4', '####<SPACE><CR><++><ESC>kA')
    buffered_inoremap(',5', '#####<SPACE><CR><++><ESC>kA')
    buffered_inoremap(',6', '######<SPACE><CR><++><ESC>kA')
end

on_filetype("md", function(_)
    apply_markdown_mappings()
    -- vim.opt_local.spell = true
    vim.opt_local.wrap = false
end)
