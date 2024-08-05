return {
    "tpope/vim-fugitive",
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true,
        lazy = false,
    },
    {
        "f-person/git-blame.nvim",
        opts = {
            -- configuration comes here
            delay = 1000 -- delay in ms until blame i shown
        },
    },
    "airblade/vim-gitgutter",
}
