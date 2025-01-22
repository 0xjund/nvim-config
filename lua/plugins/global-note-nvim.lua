
return {
  'backdround/global-note.nvim',
  opts = {},
  config = function(_, opts)
    local global_note = require("global-note")
    global_note.setup(opts)

    vim.keymap.set("n", "<leader>n", global_note.toggle_note, {
      desc = "Toggle global note",
    })
  end,
}
