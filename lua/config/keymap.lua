-- 🔹 Normal Vim Keymaps (Non-Which-Key Mappings)
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })                     -- Indent left and reselect
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })                     -- Indent right and reselect
vim.api.nvim_set_keymap("v", "<S-j>", ":move '>+1<CR>gv-gv", { noremap = true }) -- Move selected line down
vim.api.nvim_set_keymap("v", "<S-k>", ":move '<-1<CR>gv-gv", { noremap = true }) -- Move selected line up
