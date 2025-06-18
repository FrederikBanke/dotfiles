local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "biome", "prettierd", "prettier" },
		javascriptreact = { "biome", "prettierd", "prettier" },
		typescript = { "biome-check", "prettierd", "prettier" },
		typescriptreact = { "biome-check", "prettierd", "prettier" },
		json = { "biome-check" },
		jsonc = { "biome-check" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "never", -- "lsp_format"
		-- Conform will run the first available formatter
		stop_after_first = true,
	},
})
