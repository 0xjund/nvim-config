return {

    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',           -- Optional: for snippet support
            'saadparwaiz1/cmp_luasnip',    -- Optional: for LuaSnip integration
        },
        config = function()
            -- The basic setup for nvim-cmp
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    -- REQUIRED: You must specify a snippet engine
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = {
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- Optional: for snippet support
                }, {
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'orgmode'},
                })
            })

            -- Optional: Setup for `/` and `:` command line mode
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end
    },
}
