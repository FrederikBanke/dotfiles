return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- ensure these language parsers are installed
			ensure_installed = {
				"bash",
				"c",
				"css",
				"dockerfile",
				"gitignore",
				"html",
				"hyprlang",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"regex",
				"svelte",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			sync_install = false,
			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		-- use bash parser for zsh files
		vim.treesitter.language.register("bash", "zsh")
		vim.filetype.add({
			extension = { rasi = "rasi" },
			pattern = {
				[".*/waybar/config"] = "jsonc",
				[".*/kitty/*.conf"] = "bash",
				[".*/hypr/.*%.conf"] = "hyprlang",
			},
		})
	end,
}
