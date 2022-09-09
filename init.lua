vim.g.mapleader = " "

require("config.lazy")
require("config")



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


set.wrap = false
set.scrolloff = 10
set.fileencoding = 'utf-8'
set.termguicolors = true
set.colorcolumn = {80}

set.number = true
set.cursorline = true
set.hidden = true


local os = vim.loop.os_uname().sysname
-- Keymaps
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
vim.cmd('set list listchars=tab:»·,trail:·,eol:$')

map("n", "<leader><Tab>", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>f", ":Telescope find_files<CR>", opts)
map("n", "<leader>r", ":Telescope lsp_dynamic_workspace_symbols<CR>", opts)
map("n","<leader>b",":GitBlameToggle<CR>",opts)
--map("n", "<leader>v", "gg=G<C-o>", opts)
map("n", "<leader>v", ":ClangFormat<CR>", opts)
map("n", "L", ":BufferLineCycleNext<CR>", opts)
map("n", "H", ":BufferLineCyclePrev<CR>", opts)
map("n", "<leader>x", ":bdelete<CR>", opts)
map("n", "<leader>X", ":bdelete!<CR>", opts)
map("n","gd",":Telescope lsp_definitions<CR>",opts)

if os == "Darwin" then
    map("n", "∆", ":m+<CR>", opts)
    map("n", "˚", ":m--<CR>", opts)
    map("v","∆", ":m '>+1<CR>gv=gv",opts)
    map("v","˚" ,":m '<-2<CR>gv=gv",opts)
else
    map("n","<A-j>",":m+<CR>",opts)
    map("n", "<A-k>", ":m--<CR>", opts)
    map("v","<A-j>", ":m '>+1<CR>gv=gv",opts)
    map("v","<A-k>" ,":m '<-2<CR>gv=gv",opts)
end
map("n","<leader>s",":w<CR>",opts)

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
let.gitblame_enabled = 0

