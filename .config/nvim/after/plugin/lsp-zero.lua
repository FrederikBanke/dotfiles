local lsp_zero = require('lsp-zero')
local cmp = require("cmp")
local h = require("helpers")

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, h.merge(opts, { desc = "Go to definition" }))
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, h.merge(opts, { desc = "Go to references" }))
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<C-.>",
        function() vim.diagnostic.jump({ count = 1, float = true, severity = { min = vim.diagnostic.severity.INFO } }) end,
        opts)
    vim.keymap.set("n", "<C-,>",
        function() vim.diagnostic.jump({ count = -1, float = true, severity = { min = vim.diagnostic.severity.INFO } }) end,
        opts)
    vim.keymap.set("n", "<C-S-.>",
        function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    vim.keymap.set("n", "<C-S-,>",
        function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, h.merge(opts, {
        desc =
        "Show code actions"
    }))
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, h.merge(opts, { desc = "Rename variable" }))
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, h.merge(opts, { desc = "Format file" }))
end)

-- Enable language servers
vim.lsp.enable({ "lua_ls", "tailwindcss", "biome" })

-- Set global variable 'vim' for lua files.
vim.lsp.config('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using (most
                -- likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths
                    -- here.
                    -- '${3rd}/luv/library'
                    -- '${3rd}/busted/library'
                }
                -- Or pull in all of 'runtimepath'.
                -- NOTE: this is a lot slower and will cause issues when working on
                -- your own configuration.
                -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                -- library = {
                --   vim.api.nvim_get_runtime_file('', true),
                -- }
            }
        })
    end,
    settings = {
        Lua = {}
    }
})

vim.lsp.config("tailwindcss", {
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    { ".+: ([\"'`][^\"'`]*.*?[\"'`])", ".+: [\"'`]([^\"'`]*).*?[\"'`]" }
                },
            },
        },
    },
})

-- Extend cmp (autocompletions) settings.
cmp.setup({
    sources = {
        { name = "nvim_lsp" },
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<tab>"] = cmp.mapping.confirm({ select = true, }),
        ["<C-Space>"] = cmp.mapping.complete(), -- Show complete
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

-- Mason is for installing language servers.
require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            -- Without this, some props where not showing up in autocompletions for React.
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require('lspconfig')[server_name].setup({
                capabilities = capabilities,
            })
        end,
    },
})
