return {
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{ "williamboman/mason.nvim" }, -- Install LSPs
	{ "williamboman/mason-lspconfig.nvim" }, -- Automatically enable LSPs (don't need to call vim.lsp.enalbe
	{ "nvimtools/none-ls.nvim" },
	{ "MunifTanjim/prettier.nvim" },
	{ "stevearc/conform.nvim" },
	{ "mfussenegger/nvim-lint" },
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			-- optional picker via telescope
			-- { "nvim-telescope/telescope.nvim" },
			-- optional picker via fzf-lua
			-- { "ibhagwan/fzf-lua" },
			-- .. or via snacks
			{ "folke/snacks.nvim" },
		},
		event = "LspAttach",
		opts = {},
	},
}
