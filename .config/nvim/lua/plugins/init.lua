return {
    "folke/neodev.nvim",
    "folke/which-key.nvim",
    { "folke/neoconf.nvim",              cmd = "Neoconf" },
    "elkowar/yuck.vim",
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
}
