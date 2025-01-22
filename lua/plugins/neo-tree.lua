return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- Key mappings
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
        vim.keymap.set('n', '<C-h>', ':Neotree toggle<CR>', {})

        -- Show hidden files
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true, -- This makes hidden files visible
                    hide_dotfiles = false, -- This makes dotfiles visible
                    hide_gitignored = false, -- This makes gitignored files visible
                },
            },
        })
    end
}

