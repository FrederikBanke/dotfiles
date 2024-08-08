vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "View directory files (:Ex)" })

-- Move lines in visual mode.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remap - to / for easier access. This mimics the US keyboard layout (I use nordic).
vim.keymap.set({ "n", "v" }, "-", "/")
-- Map shift+æ to ; for easier access to commands.
vim.cmd("set langmap=Æ:")
