-- Move lines in visual mode.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remap - to / for easier access. This mimics the US keyboard layout (I use nordic).
vim.keymap.set({ "n", "v" }, "-", "/")
-- Map shift+æ to ; for easier access to commands.
vim.cmd("set langmap=Æ:")

-- Map H and L to switch tabs back and forth.
vim.keymap.set("n", "H", "gT")
vim.keymap.set("n", "L", "gt")
-- Move tabs left and right
vim.keymap.set("n", "<CS-H>", ":tabm -1<CR>")
vim.keymap.set("n", "<CS-L>", ":tabm +1<CR>")

-- Map Ctrl-j to enter. Useful when entering a command.
vim.keymap.set({ "i" }, "<C-j>", "<CR>")
