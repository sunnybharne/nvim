--  Normal Vim Keymaps (Non-Which-Key Mappings)
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })                     -- Indent left and reselect
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })                     -- Indent right and reselect
vim.api.nvim_set_keymap("v", "<S-j>", ":move '>+1<CR>gv-gv", { noremap = true }) -- Move selected line down
vim.api.nvim_set_keymap("v", "<S-k>", ":move '<-1<CR>gv-gv", { noremap = true }) -- Move selected line up

--  Custom Keymaps for Cursor Movement with Control
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true }) -- Move to the left window
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true }) -- Move to the window below
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true }) -- Move to the window above
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true }) -- Move to the right window

