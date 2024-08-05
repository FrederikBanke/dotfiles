return {
    "folke/neodev.nvim",
    "folke/which-key.nvim",
    { "folke/neoconf.nvim",              cmd = "Neoconf" },
    "elkowar/yuck.vim",
    {
        "f-person/git-blame.nvim",
        opts = {
            -- configuration comes here
            delay = 5000 -- delay in ms until blame i shown
        },
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",     -- optional
        },
        config = true,
        lazy = false,
    },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "tpope/vim-fugitive",
}
