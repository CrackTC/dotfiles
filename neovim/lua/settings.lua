-- [[main settings for neovim]] --

vim.o.mouse = ""                                                -- disable mouse
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"              -- use system clipboard
vim.o.fileencodings = "ucs-bom,utf-8,default,gbk,latin1"

-- [editor behavior] --

vim.o.number = true                                             -- show line numbers
vim.o.relativenumber = true                                     -- show relative line numbers
vim.o.cursorline = true                                         -- highlight current line
vim.o.hlsearch = true                                           -- highlight search results
vim.o.ruler = true                                              -- show cursor position
vim.o.expandtab = true                                          -- use spaces instead of tabs
vim.o.tabstop = 4                                               -- tab size, number of spaces
vim.o.shiftwidth = 4                                            -- indent size, number of spaces, used for >>, <<, ==, etc.
vim.o.autoindent = true                                         -- copy indent from current line when starting a new line
vim.o.list = true                                               -- show whitespace characters
vim.o.listchars = [[tab:󰌒 ,trail:·]]                            -- whitespace characters
vim.o.scrolloff = 4                                             -- minimum number of lines to keep above and below cursor
vim.o.wrap = false                                              -- don't wrap lines
vim.o.linebreak = false                                         -- wrap long lines at characters in 'breakat'
vim.o.timeoutlen = 500                                          -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.textwidth = 0                                             -- don't wrap lines

vim.o.foldenable = true                                         -- enable folding
vim.o.foldmethod = "indent"                                     -- fold based on indent
vim.o.foldlevel = 99                                            -- open all folds by default

vim.o.showmode = false                                          -- don't show mode
vim.o.hidden = true                                             -- allow switching between buffers without saving
vim.o.showcmd = true                                            -- show command in bottom bar
vim.o.wildmenu = true                                           -- show completion menu
vim.o.ignorecase = true                                         -- ignore case when searching
vim.o.smartcase = true                                          -- ignore case when searching lowercase, but not when searching uppercase
vim.o.shortmess = vim.o.shortmess .. "c"                        -- don't show completion messages
vim.o.inccommand = "split"                                      -- quick preview while replacing words
vim.o.completeopt = "longest,noinsert,menuone,noselect,preview" -- build-in completion config
vim.o.lazyredraw = true                                         -- don't redraw while executing macros
vim.o.virtualedit = "block"                                     -- allow cursor to move anywhere in visual block mode

-- [backup] --

if not vim.fn.isdirectory(vim.fn.expand("~/.config/nvim/tmp/backup")) then
    vim.fn.mkdir(vim.fn.expand("~/.config/nvim/tmp/backup"), "p")
end

if not vim.fn.isdirectory(vim.fn.expand("~/.config/nvim/tmp/undo")) then
    vim.fn.mkdir(vim.fn.expand("~/.config/nvim/tmp/undo"), "p")
end

vim.o.backupdir = "~/.config/nvim/tmp/backup,."
vim.o.directory = "~/.config/nvim/tmp/backup,."

if vim.fn.has("persistent_undo") then
    vim.o.undofile = true
    vim.o.undodir = "~/.config/nvim/tmp/undo"
end

vim.o.updatetime = 90                                           -- time to wait for a mapped sequence to complete (in milliseconds)

-- [recover cursor position] --

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd([[normal! g`"]])
        end
    end
})
