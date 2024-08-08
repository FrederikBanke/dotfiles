return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            mode = "tabs", -- "tabs" or "buffers"
            diagnostics = "nvim_lsp",
            show_buffer_close_icons = false,
            always_show_bufferline = false,
        }
    },
}
