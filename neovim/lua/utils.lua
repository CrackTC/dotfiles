-- [[util functions]] --

-- [maps] --

local map = vim.keymap.set

function _G.noremap(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = true
    map(mode, lhs, rhs, opts)
end

function _G.nnoremap(lhs, rhs, opts)
    noremap('n', lhs, rhs, opts)
end

function _G.inoremap(lhs, rhs, opts)
    noremap('i', lhs, rhs, opts)
end

function _G.vnoremap(lhs, rhs, opts)
    noremap('v', lhs, rhs, opts)
end

function _G.cnoremap(lhs, rhs, opts)
    noremap('c', lhs, rhs, opts)
end

function _G.tnoremap(lhs, rhs, opts)
    noremap('t', lhs, rhs, opts)
end

function _G.nmap(lhs, rhs)
    map('n', lhs, rhs, { remap = true })
end

function _G.xmap(lhs, rhs)
    map('x', lhs, rhs, { remap = true })
end

function _G.omap(lhs, rhs)
    map('o', lhs, rhs, { remap = true })
end

function _G.buffered_inoremap(lhs, rhs)
    vim.keymap.set('i', lhs, rhs, { buffer = true })
end

-- [filetype] --

function _G.on_filetype(filetype, fn)
    vim.api.nvim_create_augroup(filetype, { clear = true })
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        group = filetype,
        pattern = { "*." .. filetype },
        callback = fn
    })
end

-- [higroup] --
function _G.print_higroup()
    local synID = vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1)
    local name = vim.fn.synIDattr(synID, 'name')
    local transName = vim.fn.synIDattr(vim.fn.synIDtrans(synID), 'name')
    print(name .. " -> " .. transName)
end

-- [compile and run] --

local function split_run(command)
    vim.opt.splitbelow = true
    vim.cmd('split')
    vim.cmd('resize -5')
    vim.cmd('terminal ' .. command)
end

function _G.compile_run()
    vim.cmd('write')

    if vim.fn.filereadable('Makefile') == 1 then
        split_run('make clean build run')
    elseif vim.fn.filereadable(vim.fn.expand('%:p:h') .. '/Makefile') == 1 then
        split_run('make clean build run -C ' .. vim.fn.expand('%:p:h'))
    elseif vim.bo.filetype == 'c' then
        vim.cmd('exec "!clang -Wall -g -lm -o %< %"')
        split_run('time ./%<')
    elseif vim.bo.filetype == 'cpp' then
        vim.cmd('exec "!clang++ -O0 -std=c++11 -Wall -g -o %< %"')
        split_run('time ./%<')
    elseif vim.bo.filetype == 'java' then
        vim.cmd('exec "!javac %"')
        split_run('!time java %<')
    elseif vim.bo.filetype == 'sh' then
        split_run('!time bash %')
    elseif vim.bo.filetype == 'lisp' then
        split_run('sbcl --script %')
    elseif vim.bo.filetype == 'python' then
        split_run('python3 %')
    elseif vim.bo.filetype == 'html' then
        vim.cmd('silent! execute "!chromium % &"')
    elseif vim.bo.filetype == 'markdown' then
        vim.cmd('MarkdownPreview')
    elseif vim.bo.filetype == 'javascript' then
        split_run('export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .')
    elseif vim.bo.filetype == 'go' then
        split_run('go run .')
    elseif vim.bo.filetype == 'cs' then
        split_run('dotnet run')
    elseif vim.bo.filetype == 'php' then
        split_run('php %')
    elseif vim.bo.filetype == 'scheme' then
        split_run('mit-scheme < "%"')
    end
end
