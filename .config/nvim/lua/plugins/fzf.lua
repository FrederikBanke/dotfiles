return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			grep = {
				hidden = true,
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>pf", fzf.files, { desc = "Search files in project" })
		keymap.set("n", "<C-p>", fzf.files, { desc = "Search files in git project" })
		keymap.set("n", "<leader>ps", function()
			fzf.live_grep()
		end, { desc = "Search content of project files" })
		vim.keymap.set("n", "<leader>buf", fzf.buffers, { desc = "View open buffers" })
	end,
}
