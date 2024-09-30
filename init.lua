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
-- Setup format on save for specific filetypes (optional)
-- Load vim options
require("vim-options")


-- Setup lazy.nvim with plugin directory
require("lazy").setup("plugins")
vim.opt.cursorline = true
vim.opt.number = true
vim.cmd("colorscheme monokai-pro")

--Set vyper filetype 
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.vy",
  command = "set filetype=vyper",
})

--Set org filetype 

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'i', '<CR>', '<CR>', { noremap = true, silent = true })
    end
})


