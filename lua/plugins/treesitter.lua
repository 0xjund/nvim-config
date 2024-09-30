return {
	"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
    auto_install = true,
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "python", "solidity", "go" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  }
