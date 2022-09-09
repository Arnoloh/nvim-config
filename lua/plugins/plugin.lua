return {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    --git blame
    'f-person/git-blame.nvim',
    -- FIXME
    -- Comment 
    {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies={"nvim-lua/plenary.nvim"},
        opts={}
    },
    -- LSP
    'williamboman/nvim-lsp-installer', 
    'neovim/nvim-lspconfig' ,
    'j-hui/fidget.nvim',
    'liuchengxu/vista.vim',
    { "nvim-telescope/telescope.nvim", dependencies = "tsakirist/telescope-lazy.nvim" },
    "nvim-lua/plenary.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        keys = {
        },
        opts = {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "make" , "rust" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    node_incremental = "<Space>",
                    scope_incremental = false,
                    node_decremental = "<BS>",
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    "lukas-reineke/indent-blankline.nvim",
    "nyoom-engineering/oxocarbon.nvim",
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
  
    {
        'bufferline.nvim',  branch= "main"
    },
   
    { 'nvim-tree/nvim-web-devicons',
        commit = "20921d33c605ba24c8d0b76b379a54a9c83ba170"
    },
    -- Lualine (THE NEW EXTENSION ADDED IN CONFIGURATION)
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Which-key
    {
        'folke/which-key.nvim',
        lazy = true,
    },
    'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly',
    'rhysd/vim-clang-format',
    requires = {
        'kana/vim-operator-user'
    },
    'sbdchd/neoformat',
    "karb94/neoscroll.nvim",
    { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" },
    'dstein64/vim-startuptime',
    'lewis6991/gitsigns.nvim',
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} ,
    'petertriho/cmp-git',
    'karb94/neoscroll.nvim',
}
