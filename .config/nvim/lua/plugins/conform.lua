return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
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
			timeout_ms = 500,
			lsp_format = "never",
			stop_after_first = true,
		},
		format_on_save = {},
	},
}
