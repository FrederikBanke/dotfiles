local lsp_zero = require('lsp-zero')
local cmp = require("cmp")

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, { buffer = bufnr, desc = "Format file" })
end)

-- Set global variable 'vim' for lua files.
require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {}
    },
    on_init = function(client)
        local uv = vim.uv or vim.loop
        local path = client.workspace_folders[1].name

        -- Don't do anything if there is a project local config
        if uv.fs_stat(path .. '/.luarc.json') or uv.fs_stat(path .. '/.luarc.jsonc')
        then
            return
        end

        -- Apply neovim specific settings
        local lua_opts = lsp_zero.nvim_lua_ls()

        client.config.settings.Lua = vim.tbl_deep_extend(
            'force',
            client.config.settings.Lua,
            lua_opts.settings.Lua
        )
    end,
})

-- Extend cmp (autocompletions) settings.
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        ["<tab>"] = cmp.mapping.confirm({select = true}),
    }),
})

-- Mason is for installing language servers.
require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})
