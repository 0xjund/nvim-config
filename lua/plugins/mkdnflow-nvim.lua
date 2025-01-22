return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    -- Gruvbox Material options
    vim.g.gruvbox_material_background = "hard" -- Options: 'hard', 'medium', 'soft'
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_palette = "material" -- Options: 'original', 'material', 'mix'

    -- Apply the colorscheme
    vim.cmd("colorscheme gruvbox-material")
  end,
}
