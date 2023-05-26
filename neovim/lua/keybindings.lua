-- [[key bindings]] --

vim.g.mapleader = ' '

local map = vim.keymap.set

local function noremap(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = true
    map(mode, lhs, rhs, opts)
end

local function nnoremap(lhs, rhs, opts)
    noremap('n', lhs, rhs, opts)
end

local function vnoremap(lhs, rhs, opts)
    noremap('v', lhs, rhs, opts)
end

local function cnoremap(lhs, rhs, opts)
    noremap('c', lhs, rhs, opts)
end

local function tnoremap(lhs, rhs, opts)
    noremap('t', lhs, rhs, opts)
end

local function nmap(lhs, rhs, opts)
    map('n', lhs, rhs, { remap = true })
end


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

nnoremap('-', 'N')
nnoremap('=', 'n')
nnoremap('<leader><CR>', ':nohlsearch<CR>', { silent = true })

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

