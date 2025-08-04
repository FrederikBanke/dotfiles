local colors = require("colors")

local cal = sbar.add("item", {
	icon = {
		padding_left = 10,
		padding_right = 0,
		font = {
			style = "Bold",
			size = 14.0,
		},
		color = colors.rosepine.base,
	},
	label = {
		width = 60,
		align = "right",
		color = colors.rosepine.base,
		font = {
			style = "Bold",
			size = 14.0,
		},
		padding_right = 10,
	},
	background = {
		color = colors.rosepine.text,
	},
	position = "right",
	update_freq = 15,
})

local function update()
	local date = os.date("%a. %d %b.")
	local time = os.date("%H:%M")
	cal:set({ icon = date, label = time })
end

cal:subscribe("routine", update)
cal:subscribe("forced", update)
