local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Add current file to Harpoon" })
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Open Harpoon menu" })

vim.keymap.set("n", "<C-s>h", function()
	harpoon:list():select(1)
end, { desc = "Harpoon slot 1" })
vim.keymap.set("n", "<C-s>j", function()
	harpoon:list():select(2)
end, { desc = "Harpoon slot 2" })
vim.keymap.set("n", "<C-s>k", function()
	harpoon:list():select(3)
end, { desc = "Harpoon slot 3" })
vim.keymap.set("n", "<C-s>l", function()
	harpoon:list():select(4)
end, { desc = "Harpoon slot 4" })
