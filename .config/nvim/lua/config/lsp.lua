local h = require("config.helpers")
local keymap = vim.keymap -- for conciseness
local telescope = require("telescope.builtin")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf, silent = true }

		-- Set color of highlight groups.

		vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
			fg = vim.api.nvim_get_hl(0, { name = "DiagnosticError" }).fg,
			bold = true,
			undercurl = true,
		})
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
			fg = vim.api.nvim_get_hl(0, { name = "DiagnosticUnnecessary" }).fg,
			undercurl = true,
		})

		-- set keybinds

		keymap.set(
			"n",
			"gr",
			telescope.lsp_references,
			h.merge(opts, { desc = "List references of a function or variable" })
		)

		keymap.set("n", "gD", vim.lsp.buf.declaration, h.merge(opts, { desc = "Go to declaration" })) -- go to declaration

		keymap.set("n", "gd", vim.lsp.buf.definition, h.merge(opts, { desc = "Show LSP definition" })) -- show lsp definition

		opts.desc = "Show LSP implementations"
		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

		keymap.set({ "n", "v" }, "<leader>ca", function()
			-- vim.lsp.buf.code_action()
			require("tiny-code-action").code_action({})
		end, h.merge(opts, { desc = "See available code actions" })) -- see available code actions, in visual mode will apply to selection

		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, h.merge(opts, { desc = "Rename variable" })) -- smart rename

		keymap.set(
			"n",
			"<leader>D",
			"<cmd>Telescope diagnostics bufnr=0<CR>",
			h.merge(opts, { desc = "Show buffer diagnostics" })
		) -- show  diagnostics for file

		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

		keymap.set("n", "<C-,>", function()
			vim.diagnostic.jump({
				count = -1,
				float = true,
				severity = { min = vim.diagnostic.severity.WARN },
			})
		end, h.merge(opts, { desc = "Go to previous diagnostic" })) -- jump to previous diagnostic in buffer

		keymap.set("n", "<C-.>", function()
			vim.diagnostic.jump({
				count = 1,
				float = true,
				severity = { min = vim.diagnostic.severity.WARN },
			})
		end, h.merge(opts, { desc = "Go to next diagnostic" })) -- jump to next diagnostic in buffer

		vim.keymap.set("n", "<C-:>", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, h.merge(opts, { desc = "Go to next diagnostic (all severities)" }))
		vim.keymap.set("n", "<C-;>", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, h.merge(opts, { desc = "Go to previous diagnostic (all severities)" }))

		keymap.set("n", "K", vim.lsp.buf.hover, h.merge(opts, { desc = "Show documentation for what is under cursor" })) -- show documentation for what is under cursor
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)

		keymap.set("n", "<leader>rs", ":LspRestart<CR>", h.merge(opts, { desc = "Restart LSP" })) -- mapping to restart lsp if necessary
	end,
})

-- vim.lsp.inlay_hint.enable(true)

local severity = vim.diagnostic.severity

vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
})
