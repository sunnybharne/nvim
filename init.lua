require("config.options")
require("config.plugin-manager")
require("config.filetypes")
require("config.keymap")
-- Lazily load the scratchpad module when its keys are used to avoid any early-time side effects (e.g. invalid URIs)
local function scratchpad()
    return require("config.scratchpad")
end

vim.keymap.set("n", "<leader>sp", function() scratchpad().open_scratchpad() end, { desc = "Open scratchpad", noremap = true, silent = true })
vim.keymap.set("n", "<leader>sn", function() scratchpad().next_scratchpad() end, { desc = "Next scratchpad file", noremap = true, silent = true })
vim.keymap.set("n", "<space>hh", function() scratchpad().show() end, { desc = "Show snippets / scratchpad", noremap = true, silent = true })
