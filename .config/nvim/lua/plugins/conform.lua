return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = true,
	cmd = "ConformInfo",
	event = { "BufWritePre" },
	keys = {
		{
			"gq",
			function()
				require("conform").format()
			end,
			mode = { "n", "x" },
			desc = "Format file",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			javascript = { "biome-check", "prettierd", "prettier" },
			javascriptreact = { "biome-check", "prettierd", "prettier" },
			typescript = { "biome-check", "prettierd", "prettier" },
			typescriptreact = { "biome-check", "prettierd", "prettier" },
			json = { "biome-check" },
			jsonc = { "biome-check" },
			css = { "biome-check" },
		},
		default_format_opts = {
			-- These options will be passed to conform.format()
			-- And used in format_on/after_save
			timeout_ms = 3000,
			lsp_format = "fallback", -- not recommended to change
			stop_after_first = true,
			async = false, -- not recommended to change
			quiet = false, -- not recommended to change
		},
		format_on_save = {},
	},
}
