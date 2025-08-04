local colors = require("colors")
local icons = require("icons")

local function mouse_click(env)
	sbar.exec("aerospace workspace " .. env.NAME)
end

local spaces = {}
local handle = io.popen("aerospace list-workspaces --all")
local result = handle:read("*a")

local aerospaces = {}
for s in result:gmatch("%w+") do
	table.insert(aerospaces, s)
end
handle:close()

-- Sort so special spaces are first
table.sort(aerospaces, function(a, b)
	local a_num = tonumber(a)
	local b_num = tonumber(b)
	if type(a_num) == "number" and type(b_num) == "number" then
		return a < b
	end
	return a > b
end)

for k, v in ipairs(aerospaces) do
	if v == "S" then
		goto continue
	end
	-- We add spaces as items, because we use aerospace and not yabai
	local space = sbar.add("item", v, {
		associated_space = 1, -- In aerospace we have just one space
		icon = {
			string = icons.spaces["space" .. v] or v,
			padding_left = 10,
			padding_right = 10,
			color = colors.rosepine.subtle,
			highlight_color = colors.rosepine.base,
		},
		padding_left = 2,
		padding_right = 2,
		label = {
			padding_right = 20,
			color = colors.grey,
			highlight_color = colors.white,
			font = "sketchybar-app-font:Regular:16.0",
			y_offset = -1,
			drawing = false,
		},
	})

	spaces[v] = space.name
	space:subscribe("mouse.clicked", mouse_click)
	space:subscribe("aerospace_workspace_change", function(env)
		if v == env.FOCUSED_WORKSPACE then
			space:set({ icon = { highlight = true }, background = { color = colors.rosepine.text } })
		else
			space:set({ icon = { highlight = false }, background = { color = colors.transparent } })
		end
	end)
	::continue::
end -- for

-- sbar.add("bracket", spaces, {
-- 	background = { color = colors.rosepine.text },
-- })
