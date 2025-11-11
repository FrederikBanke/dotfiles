return {
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
