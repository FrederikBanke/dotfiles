-- for more autocompletions
return {
	{
		"hrsh7th/nvim-cmp",
        enabled = false,
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip", event = "VeryLazy" },
			"onsails/lspkind.nvim", -- pictograms in completion menu
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")

			-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
			require("luasnip.loaders.from_vscode").lazy_load()

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
				snippet = { -- configure how nvim-cmp interacts with snippet engine
					expand = function(args)
						-- vim.snippet.expand(args.body)
						luasnip.lsp_expand(args.body)
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
				-- configure lspkind for vs-code like pictograms in completion menu
				-- formatting = {
				-- 	format = lspkind.cmp_format({
				-- 		maxwidth = 50,
				-- 		ellipsis_char = "...",
				-- 	}),
				-- },
			})
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
        enabled = false,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- enable autocompletion for every lsp server
			local capabilities = cmp_nvim_lsp.default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})
		end,
	},
}
