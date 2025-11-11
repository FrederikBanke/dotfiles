return {
	"rmagatti/auto-session",
	lazy = false,
	-- dependencies = {
	-- 	"nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
	-- },
	config = function()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		local session = require("auto-session")
		session.setup({
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		})
	end,
}
