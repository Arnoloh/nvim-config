
require("config.lsp")
require("config.comment")
require("config.gitblame")
require("config.lualine-config")
require("config.telescope-config")

require('neoscroll').setup()
require("bufferline").setup()
require('nvim-autopairs').setup()
require("ibl").setup()

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

local luasnip = require("luasnip")
local cmp = require('cmp')
cmp.setup({
    enabled = function()
        return vim.api.nvim_buf_get_option(0, 'modifiable')
    end,
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
     ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
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

