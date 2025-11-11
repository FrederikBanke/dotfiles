local h = require("config.helpers")
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
					entry.message = h.formatter(entry.message)
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
