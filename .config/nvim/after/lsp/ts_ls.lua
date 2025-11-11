local function trim(s)
	return s:match("^%s*(.-)%s*$")
end

--- Diagnostic message formatter.
---
---@param message string
local function formatter(message)
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
		.. trim(formatter(message.sub(message, lst + 2)))
end
return {
	handlers = {
		-- Setup custom diagnostic messages for TypeScript.
		["textDocument/publishDiagnostics"] = function(_, result, ctx)
			if result.diagnostics == nil then
				return
			end

			-- ignore some tsserver diagnostics
			local idx = 1
			while idx <= #result.diagnostics do
				local entry = result.diagnostics[idx]

				if entry.message.find(entry.message, "ype '") ~= nil then
					entry.message = formatter(entry.message)
				end

				-- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
				if entry.code == 80001 then
					-- { message = "File is a CommonJS module; it may be converted to an ES module.", }
					table.remove(result.diagnostics, idx)
				else
					idx = idx + 1
				end
			end

			vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx)
		end,
	},
}
