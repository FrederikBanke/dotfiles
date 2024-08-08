local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Search files in project" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Search files in git project" })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Search content of project files" })

-- Find references (usage) of a function. Uses LSP.
vim.keymap.set("n", "<leader>ref", function()
    builtin.lsp_references()
end, { desc = "List references of a function or variable" })
