local lualine = require("lualine")
local noice = require("noice")

--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number|nil hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- @param max_len number the max length a text can be, regardless of window size
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis, max_len)
    return function(str)
        local win_width = vim.fn.winwidth(0)
        if hide_width and win_width < hide_width then
            return ''
        elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
            return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
        elseif #str > max_len then
            return str:sub(1, max_len) .. (no_ellipsis and '' or '...')
        end
        return str
    end
end

lualine.setup({
    sections = {
        lualine_b = {
            { 'branch', fmt = trunc(100, 10, nil, false, 50) },
            'diff',
            'filename',
            'diagnostics',
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
            'encoding',
            'fileformat',
            'filetype',
        },
    },
})
