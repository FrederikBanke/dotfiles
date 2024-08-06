return {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
    -- Run FlutterReload command every time we save a .dart file.
    init = function()
        vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
            pattern = '*.dart',
            command = "FlutterReload"
        })
    end,
}
