-- [[main settings for neovim]] --

vim.opt.mouse = ""                                    -- disable mouse
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus" -- use system clipboard
vim.opt.fileencodings = "ucs-bom,utf-8,default,gbk,latin1"

-- [editor behavior] --

vim.opt.number = true                                             -- show line numbers
vim.opt.relativenumber = true                                     -- show relative line numbers
vim.opt.cursorline = true                                         -- highlight current line
vim.opt.hlsearch = true                                           -- highlight search results
vim.opt.ruler = true                                              -- show cursor position
vim.opt.expandtab = true                                          -- use spaces instead of tabs
vim.opt.tabstop = 4                                               -- tab size, number of spaces
vim.opt.shiftwidth = 4                                            -- indent size, number of spaces, used for >>, <<, ==, etc.
vim.opt.autoindent = true                                         -- copy indent from current line when starting a new line
vim.opt.list = true                                               -- show whitespace characters
vim.opt.listchars = [[tab:󰌒 ,trail:·]]                        -- whitespace characters
vim.opt.scrolloff = 4                                             -- minimum number of lines to keep above and below cursor
vim.opt.wrap = false                                              -- don't wrap lines
vim.opt.linebreak = false                                         -- wrap long lines at characters in 'breakat'
vim.opt.timeoutlen = 500                                          -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.textwidth = 0                                             -- don't wrap lines

vim.opt.foldenable = true                                         -- enable folding
vim.opt.foldmethod = "indent"                                     -- fold based on indent
vim.opt.foldlevel = 99                                            -- open all folds by default

vim.opt.showmode = false                                          -- don't show mode
vim.opt.hidden = true                                             -- allow switching between buffers without saving
vim.opt.showcmd = true                                            -- show command in bottom bar
vim.opt.wildmenu = true                                           -- show completion menu
vim.opt.ignorecase = true                                         -- ignore case when searching
vim.opt.smartcase = true                                          -- ignore case when searching lowercase, but not when searching uppercase
vim.opt.shortmess = vim.opt.shortmess + "c"                       -- don't show completion messages
vim.opt.inccommand = "split"                                      -- quick preview while replacing words
vim.opt.completeopt = "longest,noinsert,menuone,noselect,preview" -- build-in completion config
vim.opt.lazyredraw = true                                         -- don't redraw while executing macros
vim.opt.virtualedit = "block"                                     -- allow cursor to move anywhere in visual block mode

-- [backup] --

if not vim.fn.isdirectory(vim.fn.expand("$HOME/.config/nvim/tmp/backup")) then
    os.execute("mkdir -p $HOME/.config/nvim/tmp/backup")
end

if not vim.fn.isdirectory(vim.fn.expand("$HOME/.config/nvim/tmp/undo")) then
    os.execute("mkdir -p $HOME/.config/nvim/tmp/undo")
end

vim.opt.backupdir = vim.fn.expand("$HOME/.config/nvim/tmp/backup") .. ",."
vim.opt.directory = vim.fn.expand("$HOME/.config/nvim/tmp/backup") .. ",."

if vim.fn.has("persistent_undo") then
    vim.opt.undofile = true
    vim.opt.undodir = vim.fn.expand("$HOME/.config/nvim/tmp/undo") .. ",."
end

vim.opt.updatetime = 90 -- time to wait for a mapped sequence to complete (in milliseconds)

-- [recover cursor position] --

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd([[normal! g`"]])
        end
    end
})
