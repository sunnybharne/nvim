local M = {}

M.setup = function()
  -- Define your colors here
  vim.g.mytheme_background = "#1e1e1e"
  vim.g.mytheme_foreground = "#d4d4d4"
  vim.g.mytheme_comment = "#7f7f7f"
  vim.g.mytheme_string = "#b5e6a6"

  -- Set highlight groups
  vim.api.nvim_set_hl(0, "Normal", {bg = vim.g.mytheme_background, fg = vim.g.mytheme_foreground})
  vim.api.nvim_set_hl(0, "Comment", {fg = vim.g.mytheme_comment})
  vim.api.nvim_set_hl(0, "String", {fg = vim.g.mytheme_string})
end

return M
