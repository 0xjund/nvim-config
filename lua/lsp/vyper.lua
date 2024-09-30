local M = {}

M.setup = function()
  -- Custom command to start vyper-lsp manually
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.vy" },
    callback = function()
      vim.lsp.start({
        name = "vyper-lsp",
        cmd = { "vyper-lsp" },  -- Ensure vyper-lsp is in your PATH
        root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]) or vim.fn.getcwd(),
        filetypes = { "vyper" },
        autostart = true,
      })
    end,
  })

  -- Set keymaps for LSP features globally
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

return M

