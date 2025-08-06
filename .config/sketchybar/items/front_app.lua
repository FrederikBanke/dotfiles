local colors = require("colors")

local front_app = sbar.add("item", {
	icon = {
		drawing = false,
	},
	label = {
		color = colors.rosepine.text,
		font = {
			style = "Bold",
			size = 14.0,
		},
		padding_left = 10,
		padding_right = 10,
	},
	background = {
		color = colors.rosepine.surface,
	},
	blur_radius = 20,
})

front_app:subscribe("front_app_switched", function(env)
	front_app:set({
		label = {
			string = env.INFO,
		},
	})

	-- Or equivalently:
	-- sbar.set(env.NAME, {
	--   label = {
	--     string = env.INFO
	--   }
	-- })
end)
