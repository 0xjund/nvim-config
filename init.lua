
-- Ensure lazy.nvim is properly installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load vim options
require("vim-options")

-- Setup lazy.nvim with plugin directory and SSH configuration
require("lazy").setup("plugins", {
  git = {
    url_format = "git@github.com:%s", -- Force SSH for all plugin installations
  },
})

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.termguicolors = true

-- vim floating window
vim.diagnostic.config({
  virtual_text = false,  -- Disables inline text diagnostics
  float = {
    show_header = true,
    source = 'always',  -- Shows the source of the diagnostic
    border = 'rounded',  -- Makes the popup rounded
  },
})

vim.api.nvim_create_autocmd({"CursorHold"}, {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

vim.cmd[[colorscheme eldritch]]

-- Set vyper filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.vy",
  command = "set filetype=vyper",
})

-- Set CursorHold update time to 300ms
vim.o.updatetime = 300

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Set org filetype
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'org',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'i', '<CR>', '<CR>', { noremap = true, silent = true })
  end
})

