
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"ts_ls",
					"solidity_ls_nomicfoundation",
					"gopls"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- LSP Initial Setup
			lspconfig.lua_ls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.solidity_ls_nomicfoundation.setup({})
			lspconfig.gopls.setup({
				cmd = { "gopls" },
				filetypes = { "go", "gomod" },
				root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
			})

			-- Vyper LSP Setup 
			require('lsp.vyper').setup()

			-- Key mappings for LSP actions
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

