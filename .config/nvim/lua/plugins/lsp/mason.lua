return {
	"mason-org/mason-lspconfig.nvim", -- Automatically enable LSPs (don't need to call vim.lsp.enable
	opts = {
		ensure_installed = {
			"ts_ls",
			"tailwindcss",
			"lua_ls",
			"biome",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"neovim/nvim-lspconfig", -- Since v0.11+, this is just some preconfigured options for language servers
			dependencies = {
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim",
				},
				config = function()
					local navbuddy = require("nvim-navbuddy")
					navbuddy.setup({ lsp = { auto_attach = true } })
					vim.keymap.set("n", "<C-n>", navbuddy.open, { desc = "Open Navbuddy" })
				end,
			},
		},
	},
}
