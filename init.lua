vim.g.mapleader = " "
require("config.lazy")
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = { ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" })
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nerdfont' },
    },
    formatting = {
        format = function(entry, vim_item)
            local icons = {
                Text = "󰗴 ",
                Method = " ",
                Function = "󰊕 ",
                Constructor = " ",
                Field = " ",
                Variable = "󰬟 ",
                Class = " ",
                Interface = " ",
                Module = " ",
                Property = " ",
                Unit = " ",
                Value = " ",
                Enum = " ",
                Keyword = " ",
                Snippet = " ",
                Color = " ",
                File = " ",
                Reference = "",
                Folder = " ",
                EnumMember = " ",
                Constant = " ",
                Struct = " ",
                Event = " ",
                Operator = " ",
                TypeParameter = " ",
            }
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                buffer = "[BUF]",
                luasnip = "[Snip]"
            })[entry.source.name]

            return vim_item
        end,
    }
})


cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{ name = 'buffer' }}
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {{ name = 'path' }},
        {{ name = 'cmdline' }}
    )
})
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
require('neoscroll').setup()
require("bufferline").setup{}
require('nvim-autopairs').setup({})
local set = vim.opt
vim.opt.background = "dark" -- set this to dark or light
vim.cmd.colorscheme "oxocarbon"
-- General options
set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4

local let = vim.g

require("config.lualine-config")
require("config.telescope-config")

set.wrap = false
set.scrolloff = 10
set.fileencoding = 'utf-8'
set.termguicolors = true
set.colorcolumn = {80}

set.number = true
set.cursorline = true
set.hidden = true

-- Keymaps
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map("n", "<leader><Tab>", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>f", ":Telescope find_files<CR>", opts)
map("n", "<leader>v", "gg=G", opts)
map("n", "L", ":BufferLineCycleNext<CR>", opts)
map("n", "H", ":BufferLineCyclePrev<CR>", opts)
map("n", "<leader>x", ":bdelete<CR>", opts)
map("n", "<leader>X", ":bdelete!<CR>", opts)
map("n", "<A-j>", ":m+<CR>", opts)
map("n", "<A-k>", ":m--<CR>", opts)
map("v","<A-j>", ":m '>+1<CR>gv=gv",opts)
map("v","<A-k>" ,":m '<-2<CR>gv=gv",opts)
map("n","<leader>s",":w<CR>",opts)
map("n","<leader>q",":wq<CR>",opts)
-- Disable base plugins
let.loaded_matchparen        = 1
let.loaded_matchit           = 1
let.loaded_logiPat           = 1
let.loaded_rrhelper          = 1
let.loaded_tarPlugin         = 1
let.loaded_man               = 1
let.loaded_gzip              = 1
let.loaded_zipPlugin         = 1
let.loaded_2html_plugin      = 1
let.loaded_shada_plugin      = 1
let.loaded_spellfile_plugin  = 1
let.loaded_netrw             = 1
let.loaded_netrwPlugin       = 1
let.loaded_tutor_mode_plugin = 1
let.loaded_remote_plugins    = 1
