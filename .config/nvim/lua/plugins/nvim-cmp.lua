-- for more autocompletions
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "L3MON4D3/LuaSnip", event = "VeryLazy" },
		"onsails/lspkind.nvim", -- pictograms in completion menu
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		-- Extend cmp (autocompletions) settings.
		cmp.setup({
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				-- { name = "vsnip" }, -- For vsnip users.
				{ name = "luasnip" }, -- For luasnip users.
				-- { name = 'ultisnips' }, -- For ultisnips users.
				-- { name = 'snippy' }, -- For snippy users.
				{ name = "buffer" },
			}),
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<tab>"] = cmp.mapping.confirm({ select = true }),
				-- Make sure the OS and terminal doesn't conflict with this bind.
				-- On MacOS, the OS has a keybind for <C-Space> to switch keyboard input source. Disable or change it.
				["<C-Space>"] = cmp.mapping.complete(), -- Show complete
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
