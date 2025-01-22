return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
  config = function()
    require("lualine").setup({
      options = {
        theme = "eldritch", -- Use Gruvbox Material theme for lualine
        icons_enabled = true,
        component_separators = "|",
        section_separators = "",
      },
    })
  end,
}

