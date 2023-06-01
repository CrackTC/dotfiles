-- [[plugins]] --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
        {
            "shaunsingh/nord.nvim",
            priority = 1000,
            config = function()
                vim.g.nord_contrast = true
                vim.g.nord_borders = true
                vim.g.nord_disable_background = false
                vim.g.nord_cursorline_transparent = true
                vim.g.nord_enable_sidebar_background = false
                vim.g.nord_italic = true
                vim.g.nord_uniform_diff_background = true
                vim.g.nord_bold = true

                require("nord").set()

                vim.opt.background = "dark"
                vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#d8dee9", bg = "#2e3440", })
                vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#d8dee9", bg = "#2e3440", })
                vim.cmd([[hi! NonText ctermfg=gray guifg=#434c5e]])
            end
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                require('nvim-treesitter.configs').setup({
                    ensure_installed = {
                        "c",
                        "c_sharp",
                        "cpp",
                        "lua",
                        "markdown",
                        "markdown_inline",
                        "python",
                        "query",
                        "vim",
                        "vimdoc",
                        "gitignore",
                        "fish",
                        "toml"
                    },

                    highlight = { enable = true },
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "<CR>",
                            node_incremental = "<CR>",
                            node_decremental = "<BS>",
                            scope_incremental = false,
                        },
                    },
                    indent = { enable = false },
                    matchup = { enable = true },
                })

                vim.opt.foldmethod = "expr"
                vim.opt.foldexpr = "nvim_treesitter#foldexpr()";
                vim.opt.foldenable = false -- Disable folding at startup.

                vim.api.nvim_set_hl(0, "@text.emphasis", { italic = true, fg = "#88c0d0" })
                vim.api.nvim_set_hl(0, "@text.strong", { bold = true, fg = "#88c0d0" })
                vim.api.nvim_set_hl(0, "@text.strike", { strikethrough = true, fg = "#88c0d0" })
                vim.api.nvim_set_hl(0, "@text.literal", { link = "@punctuation.delimiter" })
                vim.api.nvim_set_hl(0, "@text.uri", { underline = true, fg = "#a3be8c" })
            end
        },
        {
            "lukas-reineke/headlines.nvim",
            dependencies = "nvim-treesitter/nvim-treesitter",
            ft = { "markdown" },
            config = function()
                require("headlines").setup({
                    markdown = {
                        dash_string = "—",
                        headline_highlights = {
                            "Headline1",
                            "Headline2",
                            "Headline3",
                            "Headline4",
                            "Headline5",
                            "Headline6"
                        }
                    }
                })
            end
        },
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons", "neoclide/coc.nvim", "shaunsingh/nord.nvim" },
            config = function()
                local colors = require("nord.colors")
                local nord = require("lualine.themes.nord")
                nord.normal.c = { fg = colors.nord2_gui, bg = colors.nord0_gui }

                require('lualine').setup({
                    options = {
                        theme = nord,
                        globalstatus = true,
                        section_separators = { left = '', right = '' },
                        component_separators = { left = '·', right = '·' },
                    },
                    sections = {
                        lualine_a = {
                            {
                                function() return '' end,
                                padding = 0,
                                separator = { left = '', right = '' },
                                color = { fg = '#2e3440', gui = "reverse" }
                            },
                            {
                                "filename",
                                path = 0,
                                padding = 0,
                                file_status = true,
                                newfile_status = true,
                                color = { gui = "bold" },
                                symbols = { modified = " ", readonly = " ", unnamed = "󰉩 nil", newfile = " " }
                            },
                        },
                        lualine_b = {
                            { "branch", icon = '󰘬' },
                        },
                        lualine_c = {
                            {
                                'fileformat',
                                color = { fg = "#d8dee9", },
                                fmt = function(str) return "%=" .. str end,
                                symbols = { unix = ' ', dos = '󰍲 ', mac = ' ', }
                            },
                            {
                                'encoding',
                                color = { fg = "#d8dee9" },
                                cond = function() return vim.bo.fileencoding ~= 'utf-8' end
                            },
                            {
                                "diagnostics",
                                always_visible = true,
                                update_in_insert = false,
                                diagnostics_color = {
                                    error = { fg = '#bf616a' },
                                    warn  = { fg = '#d08770' },
                                    info  = { fg = '#8fbcbb' },
                                    hint  = { fg = '#a3be8c' },
                                },
                                sources = { "nvim_diagnostic", "coc" },
                                symbols = { error = '󰝥 ', warn = '󰝥 ', info = '󰝥 ', hint = '󰝥 ', },
                            },
                            {
                                'filetype',
                                colored = false,
                                color = { fg = "#d8dee9", }
                            },
                        },
                        lualine_x = {
                            {
                                "diff",
                                symbols = { added = '+', modified = '~', removed = '-' },
                                padding = 0
                            }
                        },
                        lualine_y = {},
                        lualine_z = {
                            {
                                'location',
                                icon = '󰍍',
                                padding = 0,
                                color = { gui = "bold", },
                                separator = { left = ' ', right = '' }
                            },
                            {
                                function() return '' end,
                                padding = 0,
                                color = { fg = '#2e3440', gui = "reverse", }
                            },
                        }
                    }
                })
            end
        },
        {
            "romgrk/barbar.nvim",
            dependencies = { 'lewis6991/gitsigns.nvim', 'nvim-tree/nvim-web-devicons', },
            init = function() vim.g.barbar_auto_setup = false end,
            config = function()
                require("barbar").setup({
                    tabpages = false,
                    animation = false,
                    auto_hide = true,
                    clickable = true,
                    exclude_ft = {},
                    exclude_name = { "undotree_2", "diffpanel_3" },
                    focus_on_close = 'left',
                    highlight_visible = true, -- highlight all buffers in split window
                    highlight_alternate = false,
                    highlight_inactive_file_icons = false,
                    hide = { extensions = false, inactive = false, alternate = false, current = false, visible = false, },
                    icons = {
                        buffer_index = false,
                        buffer_number = false,
                        -- button = '󰅖',
                        button = '',
                        diagnostics = {
                            [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
                            [vim.diagnostic.severity.WARN] = { enabled = false },
                            [vim.diagnostic.severity.INFO] = { enabled = false },
                            [vim.diagnostic.severity.HINT] = { enabled = true },
                        },
                        gitsigns = {
                            added = { enabled = true, icon = '+' },
                            changed = { enabled = true, icon = '~' },
                            deleted = { enabled = true, icon = '-' },
                        },
                        filetype = { custom_colors = "Normal", enabled = true, },

                        separator = { left = '', right = '' },

                        modified = { button = '', separator = { left = '', right = '' }, },
                        pinned = { button = '', filename = true, separator = { left = '', right = '' }, },

                        current = { separator = { left = '', right = '' }, },
                        inactive = { separator = { left = '', right = '' }, },
                        visible = { separator = { left = '', right = '' }, },
                    },
                    insert_at_start = false,
                    insert_at_end = true,
                    maximum_padding = 1000,
                    semantic_letters = true,
                    sidebar_filetypes = { undotree = { text = 'undotree' }, coctree = { text = "coctree" } },
                    letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
                    no_name_title = "[zzz]",
                })

                vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = "#3b4252", bg = "#2e3440", })
                vim.api.nvim_set_hl(0, "BufferCurrentADDED", { fg = "#a3be8c", bg = "#3b4252", })
                vim.api.nvim_set_hl(0, "BufferCurrentCHANGED", { fg = "#ebcb8b", bg = "#3b4252", })
                vim.api.nvim_set_hl(0, "BufferCurrentDELETED", { fg = "#bf616a", bg = "#3b4252", })

                vim.api.nvim_set_hl(0, "BufferInactiveSign", { fg = "#2e3440", bg = "#2e3440", })
                vim.api.nvim_set_hl(0, "BufferInactiveADDED", { fg = "#a3be8c", bg = "#2e3440", })
                vim.api.nvim_set_hl(0, "BufferInactiveCHANGED", { fg = "#ebcb8b", bg = "#2e3440", })
                vim.api.nvim_set_hl(0, "BufferInactiveDELETED", { fg = "#bf616a", bg = "#2e3440", })

                vim.api.nvim_set_hl(0, "BufferVisible", { fg = "#d8dee9", bg = "#2e3440", })
                vim.api.nvim_set_hl(0, "BufferVisibleIcon", { fg = "#d8dee9", bg = "#2e3440", })
                vim.api.nvim_set_hl(0, "BufferVisibleSign", { fg = "#2e3440", bg = "#2e3440", })
                vim.api.nvim_set_hl(0, "BufferVisibleADDED", { fg = "#a3be8c", bg = "#2e3440", })
                vim.api.nvim_set_hl(0, "BufferVisibleCHANGED", { fg = "#ebcb8b", bg = "#2e3440", })
                vim.api.nvim_set_hl(0, "BufferVisibleDELETED", { fg = "#bf616a", bg = "#2e3440", })
            end
        },
        {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup({
                    signs = {
                        add          = { text = '+' },
                        change       = { text = '~' },
                        changedelete = { text = '*' },
                        untracked    = { text = '┆' },
                        delete       = { text = '-' },
                        topdelete    = { text = '^' },
                    },
                    signcolumn = true,
                    numhl = false,
                    linehl = false,
                    word_diff = false,
                    watch_gitdir = {
                        interval = 1000,
                        follow_files = true
                    },
                    attach_to_untracked = true,
                    current_line_blame = true,
                    current_line_blame_opts = {
                        virt_text = true,
                        virt_text_pos = 'eol',
                        delay = 1000,
                        ignore_whitespace = true,
                    },
                    current_line_blame_formatter = '<author>|<author_time:%Y-%m-%d>|<summary>',
                    sign_priority = 6,
                    update_debounce = 100,
                    status_formatter = nil,
                    max_file_length = 40000, -- in lines
                    preview_config = {
                        border = 'rounded',
                        style = 'minimal',
                        relative = 'cursor',
                        height = 15,
                        row = 1,
                        col = 1,
                    },
                    yadm = { enable = false },
                    on_attach = function(_)
                        local gitsigns = package.loaded.gitsigns
                        local utils = require("utils")

                        utils.buffered_nnoremap('gp', function()
                            if vim.wo.diff then return '[c' end
                            vim.schedule(function() gitsigns.prev_hunk() end)
                            return '<Ignore>'
                        end, { expr = true })

                        utils.buffered_nnoremap('gn', function()
                            if vim.wo.diff then return ']c' end
                            vim.schedule(function() gitsigns.next_hunk() end)
                            return '<Ignore>'
                        end, { expr = true })

                        utils.buffered_nnoremap('<leader>g', gitsigns.preview_hunk)
                    end
                })

                vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#d08770" })
                vim.api.nvim_set_hl(0, "GitSignsAddPreview", { fg = "#a3be8c" })
                vim.api.nvim_set_hl(0, "GitSignsDeletePreview", { fg = "#bf616a" })
            end
        },
        {
            "dkarter/bullets.vim",
            ft = { "text", "markdown", "gitcommit", "scratch" }
        },
        {
            "mbbill/undotree",
            cmd = { "UndotreeToggle" },
            init = function()
                local utils = require("utils")
                utils.nnoremap("<leader>j", ":UndotreeToggle<CR>")

                vim.g.undotree_SetFocusWhenToggle = 1
                vim.g.undotree_ShortIndicators    = 1
                vim.g.undotree_WindowLayout       = 2
                vim.g.undotree_DiffpanelHeight    = 8
                vim.g.undotree_SplitWidth         = 24
            end
        },
        {
            "iamcco/markdown-preview.nvim",
            ft = { "markdown" },
            build = function() vim.fn["mkdp#util#install"]() end
        },
        {
            "tpope/vim-surround",
            config = function()
                local utils = require("utils")

                local maps = {
                    ["H"] = '"',
                    ["h"] = "'",
                    ["l"] = ")",
                    ["{"] = "}",
                    ["["] = "]",
                    ["t"] = "t",
                }

                local map_surrounds = function(from, to)
                    -- add surrounds
                    utils.xmap("s" .. from, "S" .. to)

                    -- select surrounds
                    utils.xnoremap("i" .. from, "i" .. to)
                    utils.xnoremap("a" .. from, "a" .. to)
                    utils.omap("i" .. from, "i" .. to)
                    utils.omap("a" .. from, "a" .. to)

                    -- remove surrounds
                    utils.nmap("ds" .. from, "ds" .. to)
                end

                for from, to in pairs(maps) do map_surrounds(from, to) end
            end
        },
        {
            "tpope/vim-repeat"
        },
        -- { "yianwillis/vimcdoc" },
        { "numToStr/Comment.nvim", config = function() require('Comment').setup() end },
        {
            'mg979/vim-visual-multi',
            branch = 'master',
            keys = { { "<C-n>", nil } },
            config = function()
                local maps = {}
                maps['Find Under'] = '<C-n>'
                maps['Find Subword Under'] = '<C-n>'
                vim.g.VM_maps = maps
            end
        },
        {
            'andymass/vim-matchup',
            config = function() vim.g.matchup_matchparen_offscreen = { method = "popup" } end
        },
        {
            "RRethy/vim-illuminate",
            config = function()
                require('illuminate').configure({ providers = { 'lsp', 'treesitter' }, delay = 100, })
                vim.cmd([[hi! IlluminatedWordText cterm=undercurl gui=undercurl]])
                vim.cmd([[hi! IlluminatedWordRead cterm=underdashed gui=underdashed]])
                vim.cmd([[hi! IlluminatedWordWrite cterm=underdouble gui=underdouble]])
            end
        },
        {
            "theniceboy/joshuto.nvim",
            keys = { { "<leader>ra", function() require("joshuto").joshuto() end } }
        },
        {
            "godlygeek/tabular",
            cmd = "Tabularize",
            init = function()
                local utils = require("utils")
                utils.xnoremap("A", ":Tabularize /")
            end
        },
        {
            "svermeulen/vim-subversive",
            config = function()
                local utils = require("utils")

                utils.nmap("r", "<Plug>(SubversiveSubstitute)")
                utils.nmap("rr", "<Plug>(SubversiveSubstituteLine)")
                utils.nmap('<leader>rr', 'r$')
            end
        },
        {
            "github/copilot.vim",
            build = function()
                vim.cmd([[Copilot setup]])
            end,
            init = function()
                vim.g.copilot_filetypes = { markdown = true }
                vim.g.copilot_no_tab_map = true

                local utils = require("utils")
                utils.imap("<C-j>", 'copilot#Accept("")', {
                    expr = true,
                    silent = true,
                    replace_keycodes = false
                })
            end
        },
        {
            "neoclide/coc.nvim",
            branch = "release",
            config = function()
                vim.g.coc_global_extensions = {
                    "coc-clangd",
                    "coc-css",
                    "coc-gitignore",
                    "coc-go",
                    "coc-highlight",
                    "coc-html",
                    "coc-json",
                    "coc-lua",
                    "coc-marketplace",
                    "coc-pairs",
                    "coc-snippets",
                    "coc-translator",
                    "coc-tsserver",
                    "coc-vimlsp",
                    "coc-yaml",
                }

                vim.cmd([[hi! CocMarkdownLink ctermfg=12 guifg=#8fbcbb]])
                vim.cmd([[hi! CocInlayHint    ctermfg=12 guifg=#616e88]])

                -- pum highlighting
                vim.cmd([[hi! CocFloating          ctermbg=8       guibg=None                           ]])
                vim.cmd([[hi! CocSearch            cterm=undercurl gui=undercurl                        ]])
                vim.cmd([[hi! CocMenuSel           ctermbg=14      guibg=#8fbcbb ctermfg=8 guifg=#2E3440]])
                vim.cmd([[hi! CocFloatThumb        ctermbg=7       guibg=#d8dee9 ctermfg=8 guifg=#2E3440]])
                vim.cmd([[hi! CocFloatSbar         ctermfg=8       guifg=#2E3440 ctermbg=8 guibg=#2E3440]])
                vim.cmd([[hi! CocFloatDividingLine ctermfg=7       guifg=#d8dee9                        ]])

                vim.g.coc_status_error_sign = "󰈸 "
                vim.g.coc_status_warning_sign = " "

                local utils = require('utils')

                utils.inoremap("<Tab>", function()
                    if vim.fn["coc#pum#visible"]() == 1 then
                        return vim.fn["coc#pum#confirm"]()
                    elseif vim.fn["coc#expandableOrJumpable"]() then
                        return "<Plug>(coc-snippets-expand-jump)"
                    else
                        return "<Tab>"
                    end
                end, { silent = true, expr = true })

                utils.inoremap("<CR>", function()
                    return "<C-g>u<CR><C-r>=coc#on_enter()<CR>"
                end, { silent = true, expr = true })

                utils.inoremap("<C-Space>", "coc#refresh()", { silent = true, expr = true })

                utils.nnoremap("gd", "<Plug>(coc-definition)", { silent = true })
                utils.nnoremap("gy", "<Plug>(coc-type-definition)", { silent = true })
                utils.nnoremap("gi", "<Plug>(coc-implementation)", { silent = true })
                utils.nnoremap("gr", "<Plug>(coc-references)", { silent = true })
                utils.nnoremap("dh", "<Plug>(coc-diagnostic-prev)", { silent = true })
                utils.nnoremap("dl", "<Plug>(coc-diagnostic-next)", { silent = true })
                utils.nnoremap("dm", "<Plug>(coc-format)", { silent = true })
                utils.nnoremap("rn", "<Plug>(coc-rename)", { silent = true })
                utils.nnoremap("<A-h>", "<Plug>(coc-float-hide)", { silent = true })
                utils.nnoremap("<leader>a", "<Plug>(coc-codeaction-cursor)", { silent = true })
                utils.nnoremap("<leader>cl", "<Plug>(coc-codelens-action)", { silent = true })

                local function show_docs()
                    local current_word = vim.fn.expand('<cword>')
                    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
                        vim.api.nvim_command('h ' .. current_word)
                    elseif vim.api.nvim_eval('coc#rpc#ready()') then
                        vim.fn.CocActionAsync('doHover')
                    else
                        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. current_word)
                    end
                end

                utils.nnoremap("dc", show_docs, { silent = true })

                vim.api.nvim_create_augroup("CocGroup", {})
                vim.api.nvim_create_autocmd("User", {
                    group = "CocGroup",
                    pattern = "CocJumpPlaceholder",
                    command = "call CocActionAsync('showSignatureHelp')",
                    desc = "Update signature help on jump placeholder"
                })

                utils.xnoremap("if", "<Plug>(coc-funcobj-i)")
                utils.xnoremap("af", "<Plug>(coc-funcobj-a)")
                utils.onoremap("if", "<Plug>(coc-funcobj-i)")
                utils.onoremap("af", "<Plug>(coc-funcobj-a)")
                utils.xnoremap("ic", "<Plug>(coc-classobj-i)")
                utils.onoremap("ic", "<Plug>(coc-classobj-i)")
                utils.xnoremap("ac", "<Plug>(coc-classobj-a)")
                utils.onoremap("ac", "<Plug>(coc-classobj-a)")

                utils.nnoremap("<leader>ts", "<Plug>(coc-translator-p)", { silent = true })
                utils.vnoremap("<leader>ts", "<Plug>(coc-translator-pv)", { silent = true })
            end
        },
        {
            "shellRaining/hlchunk.nvim",
            event = { "UIEnter" },
            config = function()
                require("hlchunk").setup({
                    chunk = {
                        enable = true,
                        use_treesitter = true,
                        chars = {
                            horizontal_line = "─",
                            vertical_line = "│",
                            left_top = "╭",
                            left_bottom = "╰",
                            right_arrow = ">"
                        },
                        style = { { fg = "#8fbcbb" } }
                    },
                    indent = { enable = false, },
                    line_num = {
                        enable = true,
                        use_treesitter = true,
                        style = { { fg = "#8fbcbb" } }
                    },
                    blank = { enable = false }
                })
            end
        },
        {
            "rcarriga/nvim-notify",
            config = function()
                local notify = require("notify")
                notify.setup({
                    stages = "fade",
                    render = "compact"
                })

                vim.notify = notify

                local coc_status_record = {}

                local function reset_coc_status_record(_)
                    coc_status_record = {}
                end

                local function coc_status_do_notify(msg, level)
                    local notify_opts = {
                        title = "LSP Status",
                        timeout = 500,
                        hide_from_history = true,
                        on_close = reset_coc_status_record
                    }
                    if coc_status_record ~= {} then
                        notify_opts["replace"] = coc_status_record.id
                    end
                    coc_status_record = notify(msg, level, notify_opts)
                end

                local coc_diag_record = {}

                local function reset_coc_diag_record(_)
                    coc_diag_record = {}
                end

                local function coc_diagnostic_do_notify(msg, level)
                    local notify_opts = {
                        title = "LSP Diagnostics",
                        timeout = 500,
                        on_close = reset_coc_diag_record
                    }
                    if coc_diag_record ~= {} then
                        notify_opts["replace"] = coc_diag_record.id
                    end
                    coc_diag_record = notify(msg, level, notify_opts)
                end

                local function coc_diagnostic_notify()
                    local info = vim.b.coc_diagnostic_info
                    if info == nil then
                        return ""
                    end

                    local messages = {}
                    local level = "info"

                    if info.warning > 0 then
                        level = "warn"
                    end

                    if info.error > 0 then
                        level = "error"
                    end

                    if info.error > 0 then
                        messages[#messages + 1] = "󰃤 Errors: " .. info.error
                    end

                    if info.warning > 0 then
                        messages[#messages + 1] = "󱐋 Warnings: " .. info.warning
                    end

                    if info.information > 0 then
                        messages[#messages + 1] = "󰋼 Infos: " .. info.information
                    end

                    if info.hint > 0 then
                        messages[#messages + 1] = "󰌵 Hints: " .. info.hint
                    end

                    local message = table.concat(messages, "\n")

                    if vim.trim(message) == "" then
                        message = " All OK"
                    end

                    coc_diagnostic_do_notify(message, level)
                end

                local function coc_status_notify()
                    local status = vim.g.coc_status
                    local level = "info"
                    if status == nil then
                        return ""
                    end
                    coc_status_do_notify(status, level)
                end

                vim.api.nvim_create_autocmd("User", {
                    pattern = "CocStatusChange",
                    callback = coc_status_notify
                })
                vim.api.nvim_create_autocmd("User", {
                    pattern = "CocDiagnosticChange",
                    callback = coc_diagnostic_notify
                })

                notify("今日もいい天気だよ～", "info", {
                    timeout = 500
                })
            end
        }
    },
    { ui = { border = "rounded" } }
)
