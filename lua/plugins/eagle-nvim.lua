return {
  "soulis-1256/eagle.nvim",
  config = function()
    -- Set up eagle plugin
    require("eagle").setup({
      -- Add your custom overrides here if needed
    })

    -- Enable mouse movement event
    vim.o.mousemoveevent = true
  end
}

