-- Reload configuration
vim.keymap.set("n", "<Leader>rr", function()
  -- Clear and reload the options module to ensure clean state
  package.loaded["config.options"] = nil
  require("config.options")
  -- Reload the rest of the configuration
  vim.cmd("source ~/.config/nvim/init.lua")
  vim.notify("Configuration reloaded!", vim.log.levels.INFO)
end, { desc = "Reload configuration" })

-- Markdown preview keymaps
vim.keymap.set("n", "<Leader>mp", ":MarkdownPreview<CR>", { desc = "Start markdown preview" })
vim.keymap.set("n", "<Leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Stop markdown preview" })
vim.keymap.set("n", "<Leader>mt", ":MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })

vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true }) -- Indent left and reselect
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true }) -- Indent right and reselect

-- Window navigation is handled by vim-tmux-navigator plugin
-- See lua/plugins/tmux-navigator.lua for configuration

-- Smart quit keybindings for Neo-tree scenarios
vim.keymap.set("n", "<Leader>q", function()
  -- Check if Neo-tree is open
  local neo_tree_open = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if string.find(buf_name, "neo%-tree") then
      neo_tree_open = true
      break
    end
  end
  
  if neo_tree_open then
    -- Close Neo-tree first, then quit the current buffer
    vim.cmd("Neotree close")
    vim.cmd("q")
  else
    -- Just quit the current buffer
    vim.cmd("q")
  end
end, { desc = "Smart quit (handles Neo-tree)" })

vim.keymap.set("n", "<Leader>Q", function()
  -- Force quit everything including Neo-tree
  vim.cmd("Neotree close")
  vim.cmd("q!")
end, { desc = "Force quit everything" })

-- Reserve <Leader>e for NvimTree (set in plugin config)

-- Project management keymaps
vim.keymap.set("n", "<Leader>p", ":Telescope projects<CR>", { desc = "Open project picker" })
vim.keymap.set("n", "<Leader>P", ":ProjectRoot<CR>", { desc = "Change to project root" })
vim.keymap.set("n", "<Leader>f", ":Telescope find_files<CR>", { desc = "Find files in project" })
-- Note: <leader>fg is defined in telescope.lua plugin config
