local colors = require("colors")
local icons = require("icons")

local wifi = sbar.add("item", {
	icon = {
		string = icons.wifi.disconnected,
		color = colors.rosepine.base,
		padding_left = 10,
		padding_right = 10,
	},
	label = {
		string = "",
		font = { style = "Bold" },
		color = colors.rosepine.base,
		drawing = false,
	},
	position = "right",
	background = {
		color = colors.rosepine.text,
	},
})

wifi:subscribe("wifi_change", function()
	sbar.exec("ifconfig en0 | awk '/status:/{print $2}'", function(result)
		local c = result:sub(1, 1)
		if c == "a" then
			wifi:set({ icon = icons.wifi.connected })
		else
			wifi:set({ icon = icons.wifi.disconnected })
		end
	end)
end)

wifi:subscribe("mouse.clicked", function()
	sbar.exec("ifconfig en0 | awk '/inet /{print $2}'", function(result)
		if wifi:query().label.drawing == "off" then
			wifi:set({
				label = {
					string = result,
					drawing = true,
					padding_left = 5,
					padding_right = 10,
				},
				icon = {
					padding_left = 10,
					padding_right = 0,
				},
			})
		else
			wifi:set({
				label = {
					drawing = false,
					padding_left = 0,
					padding_right = 0,
				},
				icon = {
					padding_left = 10,
					padding_right = 10,
				},
			})
		end
	end)
end)
