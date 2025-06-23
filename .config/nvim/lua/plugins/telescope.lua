return {
	"nvim-telescope/telescope.nvim",
	dependecies = { "nvim-lua/plenary.nvim" },
	opts = {
		extensions = {
			file_browser = {
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				hidden = { file_browser = true, folder_browser = true },
			},
		},
	},
}
