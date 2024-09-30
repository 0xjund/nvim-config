
return {
     {
        '3rd/image.nvim',
        lazy = false, -- Set to false to load on startup; adjust if you want lazy loading
        config = function()
            require('image').setup({
                render = {
                    min_padding = 5,     -- Minimum padding between images
                    show_label = true,    -- Whether to show the image label
                    use_dither = true,    -- Use dithered image rendering
                },
                events = {
                    update_on_nvim_resize = true, -- Automatically resize images when Neovim window is resized
                },
            })
        end,
    },
}
