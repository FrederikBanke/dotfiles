return {
	settings = {
		-- capabilities = require("cmp_nvim_lsp").default_capabilities(),
		tailwindCSS = {
			classAttributes = {
				"class",
				"className",
				"classNames",
				"class:list",
				"classList",
				"ngClass",
				"twMerge",
			},
			experimental = {
				classRegex = {
					-- Gotten from this list https://github.com/paolotiu/tailwind-intellisense-regex-list
					-- { "([a-zA-Z0-9\\-:]+)" }, -- everywhere
					-- { "@tw\\s\\*/\\s+[\"'`]([^\"'`]*)" }, -- comment tag with @tw
					{ "tv\\(([^)]*)\\)", "{?\\s?[\\w].*:\\s*?[\"'`]([^\"'`]*).*?,?\\s?}?" }, -- tailwind-variants
					{ "(?:twMerge|twJoin)\\(([^;]*)[\\);]", "[`'\"`]([^'\"`;]*)[`'\"`]" }, -- tailwind-merge
					{ "cva\\(([^;]*)[\\);]", "[`'\"`]([^'\"`;]*)[`'\"`]" }, -- class-variance-authority
				},
			},
		},
	},
}
