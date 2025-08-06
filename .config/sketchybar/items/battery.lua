local icons = require("icons")
local colors = require("colors")

local battery = sbar.add("item", {
	position = "right",
	icon = {
		font = {
			style = "Bold",
			size = 19.0,
		},
		padding_left = 10,
	},
	label = {
		drawing = true,
		font = { style = "Bold" },
		color = colors.rosepine.text,
		padding_left = 5,
		padding_right = 10,
	},
	update_freq = 120,
	background = {
		color = colors.rosepine.surface,
	},
	blur_radius = 20,
})

local function battery_update()
	sbar.exec("pmset -g batt", function(batt_info)
		local icon = "!"
		local color = colors.rosepine.text

		local found, _, charge = batt_info:find("(%d+)%%")
		if found then
			charge = tonumber(charge)
		end

		if found and charge > 80 then
			icon = icons.battery._100
		elseif found and charge > 60 then
			icon = icons.battery._75
		elseif found and charge > 40 then
			icon = icons.battery._50
		elseif found and charge > 20 then
			icon = icons.battery._25
			color = colors.rosepine.gold
		else
			icon = icons.battery._0
			color = colors.red
		end
		if string.find(batt_info, "AC Power") then
			icon = icons.battery.charging
		end

		battery:set({ icon = { string = icon, color = color }, label = charge .. "%" })
	end)
end

battery:subscribe({ "routine", "power_source_change", "system_woke" }, battery_update)
