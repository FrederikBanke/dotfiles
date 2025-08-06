local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	height = 40,
	color = colors.rosepine.base_blur,
	border_color = colors.transparent,
	shadow = false,
	sticky = true,
	padding_right = 10,
	padding_left = 10,
	-- blur_radius = 20,
	topmost = "window",
	display = "main",
})
