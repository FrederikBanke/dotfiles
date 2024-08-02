return {
	"folke/neodev.nvim",
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"elkowar/yuck.vim",
	--  { "rmagatti/igs.nvim", opts = { default_mappings = true } },
	--  "tveskag/nvim-blame-line",
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",         -- required
			"sindrets/diffview.nvim",        -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua",              -- optional
		},
		config = true,
		lazy = false,
	},
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	"tpope/vim-fugitive",
}
