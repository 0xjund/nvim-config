
return {
  "loctvl842/monokai-pro.nvim",
  config = function()
    require("monokai-pro").setup({
      transparent_background = false,
      terminal_colors = true,
      devicons = true,
      styles = {
        comment = { italic = true },
        keyword = { italic = true },
        type = { italic = true },
        storageclass = { italic = true },
        structure = { italic = true },
        parameter = { italic = true },
        annotation = { italic = true },
        tag_attribute = { italic = true },
      },
      filter = "spectrum",
      day_night = {
        enable = false,
        day_filter = "spectrum",
        night_filter = "spectrum",
      },
      inc_search = "background",
      background_clear = {
        "toggleterm",
        "telescope",
        "renamer",
        "notify",
        "neo-tree",
      },
      plugins = {
        bufferline = {
          underline_selected = false,
          underline_visible = false,
        },
        indent_blankline = {
          context_highlight = "default",
          context_start_underline = false,
        },
      },
      ---@param cs Colorscheme
      ---@param p ColorschemeOptions
      ---@param Config MonokaiProOptions
      ---@param hp Helper
      override = function(cs, p, Config, hp)
        -- Custom overrides here
      end,
    })
  end
}

