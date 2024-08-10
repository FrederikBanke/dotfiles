return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { "markdown" },
    opts = {
        file_types = { "markdown" },
        heading = {
          width = "block",
          min_width = 45,
        },
        code = {
            width = 'block',
            min_width = 45,
            left_pad = 2,
            right_pad = 2,
        },
    },
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },  -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
}
