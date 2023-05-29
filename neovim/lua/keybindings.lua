-- [[key bindings]] --

vim.g.mapleader = ' '

-- [basic mappings] --

nnoremap(';', ':')
vnoremap(';', ':')

nnoremap('Y', 'y$')
nmap('<leader>rr', 'r$')

nnoremap('S', ':w<CR>')
nnoremap('Q', ':q<CR>')

nnoremap('<', '<<')
nnoremap('>', '>>')

nnoremap('N', '$')
nnoremap('P', '0')

nnoremap('H', '5h')
nnoremap('J', '5j')
nnoremap('K', '5k')
nnoremap('L', '5l')

vnoremap('H', '5h')
vnoremap('J', '5j')
vnoremap('K', '5k')
vnoremap('L', '5l')

nnoremap('<A-n>', '5<C-e>')
nnoremap('<A-p>', '5<C-y>')

-- [searching] --

nnoremap('-', 'Nzz')
nnoremap('=', 'nzz')
nnoremap('<leader><CR>', ':nohlsearch<CR>', { silent = true })
cnoremap('<CR>', function()
    local cmdtype = vim.fn.getcmdtype()
    if cmdtype == '/' or cmdtype == '?' then
        vim.opt.hlsearch = false
        vim.api.nvim_feedkeys('\nzz', 'n', true)
    else
        vim.api.nvim_feedkeys('\n', 'n', true)
    end
end)

-- [window management] --

nnoremap('s', '<nop>')
nnoremap('sl', ':set splitright<CR>:vsplit<CR>')
nnoremap('sh', ':set nosplitright<CR>:vsplit<CR>:set splitright<CR>')
nnoremap('sj', ':set splitbelow<CR>:split<CR>')
nnoremap('sk', ':set nosplitbelow<CR>:split<CR>:set splitbelow<CR>')

nnoremap('gj', '<C-w>j')
nnoremap('gk', '<C-w>k')
nnoremap('gh', '<C-w>h')
nnoremap('gl', '<C-w>l')

nnoremap('<UP>', ':resize +5<CR>')
nnoremap('<DOWN>', ':resize -5<CR>')
nnoremap('<LEFT>', ':vertical resize-5<CR>')
nnoremap('<RIGHT>', ':vertical resize+5<CR>')

-- [tab management] --

nnoremap('tj', ':-tabe<CR>')
nnoremap('tk', ':tabe<CR>')

nnoremap('th', ':-tabnext<CR>')
nnoremap('tl', ':+tabnext<CR>')

nnoremap('tmh', ':-tabmove<CR>')
nnoremap('tml', ':+tabmove<CR>')

nnoremap('<leader>1', '1gt')
nnoremap('<leader>2', '2gt')
nnoremap('<leader>3', '3gt')
nnoremap('<leader>4', '4gt')
nnoremap('<leader>5', '5gt')
nnoremap('<leader>6', '6gt')
nnoremap('<leader>7', '7gt')
nnoremap('<leader>8', '8gt')
nnoremap('<leader>9', '9gt')

-- [terminal behavior] --

vim.api.nvim_create_autocmd('TermOpen', {
    pattern = 'term://*',
    command = 'startinsert'
})

tnoremap('<C-q>', [[<C-\><C-n>]])
tnoremap('<C-o>', [[<C-\><C-n><C-o>]])
tnoremap('<C-h>', [[<C-\><C-n><C-w>h]])
tnoremap('<C-j>', [[<C-\><C-n><C-w>j]])
tnoremap('<C-k>', [[<C-\><C-n><C-w>k]])
tnoremap('<C-l>', [[<C-\><C-n><C-w>l]])

-- open kitty in cwd

nnoremap('<leader>tt', function()
    os.execute('kitty&')
end)

-- [command mode cursor movement] --

cnoremap('<C-a>', '<Home>')
cnoremap('<C-e>', '<End>')
cnoremap('<C-p>', '<Left>')
cnoremap('<C-n>', '<Right>')

-- [other useful mappings] --

-- open fold
nnoremap('<leader>o', 'za', { silent = true })

-- select a line (no eol)
nnoremap('vv', '0v$h')

-- replace next placeholder and insert
nnoremap('<leader><leader>', '<ESC>/<++><CR>:nohl<CR>ca>', { silent = true })

-- toggle spellcheck
nnoremap('<leader>sc', ':setlocal spell!<CR>', { silent = true })

-- toggle wrap
nnoremap('<leader>wp', ':setlocal wrap!<CR>', { silent = true })

-- change case
nnoremap('`', '~')

-- generate ascii figlet
nnoremap('<leader>f', ':r !figlet ')

-- show cwd
nnoremap('<leader>cd', ':echo getcwd()<CR>')

-- Move Lines
nnoremap("<A-j>", "<cmd>m .+1<cr>==")
nnoremap("<A-k>", "<cmd>m .-2<cr>==")
inoremap("<A-j>", "<esc><cmd>m .+1<cr>==gi")
inoremap("<A-k>", "<esc><cmd>m .-2<cr>==gi")
vnoremap("<A-j>", ":m '>+1<cr>gv=gv")
vnoremap("<A-k>", ":m '<-2<cr>gv=gv")

-- show higroup
nnoremap('<A-s>', print_higroup)

-- quick surround
xmap('"', 'S"')
xmap("'", "S'")
xmap("}", "S}")
xmap("]", "S]")
xmap("t", "St")
-- xmap("0", "S)")
-- xmap(">", "S>")
xmap("i0", "i)")
xmap("a0", "a)")
omap("i0", "i)")
omap("a0", "a)")
nmap("ds0", "ds")

-- compile and run

nnoremap("R", compile_run)

-- open init.lua
nnoremap("<leader>rc", ":e $MYVIMRC<CR>")

-- quick uppercase
inoremap("<C-u>", "<ESC>mzgUiw`za")
nnoremap("<C-u>", "mzgUiw`z")

-- switch between buffer
nnoremap("b-", ":bp<CR>")
nnoremap("b=", ":bn<CR>")

