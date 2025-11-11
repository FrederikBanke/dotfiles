return {
	"nvim-telescope/telescope.nvim",
	-- event = "VeryLazy",
	dependecies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
				},
			},
			extensions = {
				file_browser = {
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					hidden = { file_browser = true, folder_browser = true },
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})

		-- load telescope extensions
		telescope.load_extension("file_browser")
		-- telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		local builtin = require("telescope.builtin")

		keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Search files in project" })
		keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search files in git project" })
		keymap.set("n", "<leader>ps", function()
			builtin.live_grep({
				file_ignore_patterns = { "node_modules", ".git", ".venv" },
				additional_args = function(_)
					return { "--hidden" }
				end,
			})
		end, { desc = "Search content of project files" })
	end,
}
