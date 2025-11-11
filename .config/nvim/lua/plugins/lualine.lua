return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local noice = require("noice")
		local h = require("config.helpers")

		-- configure lualine with modified theme
		lualine.setup({
			sections = {
				lualine_a = { { "mode", fmt = h.trunc(100, 1, nil, true, 50) } },
				lualine_b = {
					{ "branch", fmt = h.trunc(100, 10, nil, false, 50) },
					"diff",
					"filename",
					"diagnostics",
				},
				lualine_c = {},
				lualine_x = {
					{
						noice.api.status.mode.get,
						-- cond = noice.api.statusline.mode.has,
						cond = function()
							local reg = vim.fn.reg_recording()
							return reg ~= ""
						end,
						color = { fg = "#ff9e64" },
					},
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
