return {
	{
		"hrsh7th/cmp-nvim-lsp",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- enable autocompletion for every lsp server
			local capabilities = cmp_nvim_lsp.default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})
		end,
	},
	{ "nvimtools/none-ls.nvim", event = "VeryLazy" },
	{ "MunifTanjim/prettier.nvim" },
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
	{
		"dmmulroy/tsc.nvim",
		opts = {},
		cmd = {
			"TSC",
		},
	},
	{ "folke/lazydev.nvim", opts = {} },
}
