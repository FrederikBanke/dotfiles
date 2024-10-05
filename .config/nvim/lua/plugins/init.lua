return {
    "folke/neodev.nvim",
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "elkowar/yuck.vim",
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function(_, opts)
            vim.filetype.add {
                extension = { rasi = 'rasi' },
                pattern = {
                    ['.*/waybar/config'] = 'jsonc',
                    ['.*/kitty/*.conf'] = 'bash',
                    ['.*/hypr/.*%.conf'] = 'hyprlang',
                },
            }
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
}
