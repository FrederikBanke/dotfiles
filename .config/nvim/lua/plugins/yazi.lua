---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	version = "*", -- use the latest stable version
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>pv",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "View directory files (:Ex)",
		},
	},
	---@type YaziConfig | {}
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		keymaps = {
			show_help = "<C-h>",
		},
		integrations = {
			--- What should be done when the user wants to grep in a directory
			grep_in_directory = function(directory)
				-- the default implementation uses telescope if available, otherwise nothing
				local fzf = require("fzf-lua")
				fzf.files({ cwd = directory })
			end,
		},
	},
}
