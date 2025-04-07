return {
    "tpope/vim-fugitive",
    {
        "f-person/git-blame.nvim",
        opts = {
            -- configuration comes here
            delay = 1000 -- delay in ms until blame i shown
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signcolumn = true,
            numhl      = true,
            on_attach  = function(bufnr)
                local gitsigns = require("gitsigns")
                vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk,
                    { buffer = bufnr, desc = "Stage hunk" })
                vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk,
                    { buffer = bufnr, desc = "Reset hunk" })
                vim.keymap.set('v', '<leader>hs',
                    function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                    { buffer = bufnr, desc = "Stage selected hunk" })
                vim.keymap.set('v', '<leader>hr',
                    function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                    { buffer = bufnr, desc = "Reset selected hunk" })
                vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer,
                    { buffer = bufnr, desc = "Stage all hunks in buffer" })
                vim.keymap.set('n', '<leader>hu', gitsigns.undo_stage_hunk,
                    { buffer = bufnr, desc = "Unstage all hunks in buffer" })
                vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer,
                    { buffer = bufnr, desc = "Reset all hunks in buffer" })
                vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk,
                    { buffer = bufnr, desc = "Preview hunk" })
                vim.keymap.set('n', '<leader>hb', function() gitsigns.blame_line { full = true } end,
                    { buffer = bufnr, desc = "Show blame for line" })
                vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame,
                    { buffer = bufnr, desc = "Toggle line blame" })
                vim.keymap.set('n', '<leader>hd', gitsigns.diffthis,
                    { buffer = bufnr, desc = "Show diff for hunk" })
                vim.keymap.set('n', '<leader>hD', function() gitsigns.diffthis('~') end,
                    { buffer = bufnr, desc = "Show diff for whole buffer" })
                vim.keymap.set('n', '<leader>td', gitsigns.toggle_deleted,
                    { buffer = bufnr, desc = "Toggle showing deleted lines" })
            end
        }
    },
}
