return {
	"akinsho/flutter-tools.nvim",
	ft = "dart", -- lazy load on .dart filetype.
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function(opts)
		print("Flutter tools config")
		require("flutter-tools").setup()
		-- Run FlutterReload command every time we save a .dart file.
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = "*.dart",
			command = "FlutterReload",
		})
	end,
}
