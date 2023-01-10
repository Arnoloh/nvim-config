require("plugins")

local set = vim.opt


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


-- Keymaps
let.mapleader = " "
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map("n", "<leader><Tab>", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>f", ":Telescope find_files<CR>", opts)
map("n", "<leader>v", "gg=G<CR>", opts)
map("n", "L", ":BufferLineCycleNext<CR>", opts)
map("n", "H", ":BufferLineCyclePrev<CR>", opts)
map("n", "<leader>x", ":bdelete<CR>", opts)
map("n", "<leader>X", ":bdelete!<CR>", opts)
map("n", "∆", ":m+<CR>", opts)
map("n", "˚", ":m--<CR>", opts)
map("v","∆", ":m '>+1<CR>gv=gv",opts)
map("v","˚" ,":m '<-2<CR>gv=gv",opts)


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

