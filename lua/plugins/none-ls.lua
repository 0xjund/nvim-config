return {
    'nvim-lua/plenary.nvim',
    'nvimtools/none-ls.nvim',
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Use Prettier with Solidity support for formatting
                null_ls.builtins.formatting.prettier.with({
                    extra_args = { 
                        "--plugin", "prettier-plugin-solidity"  -- Ensure Prettier uses the Solidity plugin
                    }
                }),
                -- Add other sources if needed
            },
        })

        -- Keymap for formatting
        vim.keymap.set("n", "<leader>gf", function() vim.lsp.buf.format({ timeout_ms = 2000 }) end, {})
    end
}

