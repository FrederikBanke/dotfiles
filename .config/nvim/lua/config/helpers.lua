local helpers = {}
-- Return a new table with the values merged from `first_table` and `second_table`.
-- The values of `second_table` will overwrite those in `first_table`, if they have the same keys.
function helpers.merge(first_table, second_table)
	local new_table = {}
	for k, v in pairs(first_table) do
		new_table[k] = v
	end
	for k, v in pairs(second_table) do
		new_table[k] = v
	end
	return new_table
end

-- Will return `true`, if window width is less than `min_width`.
--- @param min_width number the minimum width of the window.
function helpers.is_screen_min_width(min_width)
	local win_width = vim.fn.winwidth(0)
	if win_width <= min_width then
		return true
	end
	return false
end

--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number|nil hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- @param max_len number the max length a text can be, regardless of window size
--- return function that can format the component accordingly
function helpers.trunc(trunc_width, trunc_len, hide_width, no_ellipsis, max_len)
	return function(str)
		if hide_width and helpers.is_screen_min_width(hide_width) then
			return ""
		elseif trunc_width and trunc_len and helpers.is_screen_min_width(trunc_width) and #str > trunc_len then
			return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
		elseif #str > max_len then
			return str:sub(1, max_len) .. (no_ellipsis and "" or "...")
		end
		return str
	end
end

local function trim(s)
	return s:match("^%s*(.-)%s*$")
end

--- Diagnostic message formatter.
---
---@param message string
function helpers.formatter(message)
	local fst = message.find(message, "ype '")
	if fst == nil then
		return message
	end
	local lst = message.find(message, "'", fst + 5)
	if lst == nil then
		return message
	end
	local obj = message.sub(message, fst + 4, lst + 1)
	return trim(message.sub(message, 0, fst + 3))
		.. " "
		.. trim(obj)
		.. "\n"
		.. trim(helpers.formatter(message.sub(message, lst + 3)))
end
return helpers
