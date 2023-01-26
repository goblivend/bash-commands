vim.g.mapleader = " "

-- Show file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Cancel the "Q" map that sends you and your family to hell
vim.keymap.set("n", "Q", "<nop>")

-- set "<leader>x" to add execution permission to current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Allows you to keep the cursor at the middle of the screen when cycling through searches 
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Same as previous but for half page moves
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Allows you to move pieces of code using J and K in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

