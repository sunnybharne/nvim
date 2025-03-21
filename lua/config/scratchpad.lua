local scratch_win = nil
local scratch_buf = nil

function ToggleScratchMarkdown()
  if scratch_win and vim.api.nvim_win_is_valid(scratch_win) then
    -- Close window if already open
    vim.api.nvim_win_close(scratch_win, true)
    scratch_win = nil
    return
  end

  local scratch_path = vim.fn.stdpath("config") .. "/scratch.md"

  -- Reuse buffer if already loaded, else load from file
  if not scratch_buf or not vim.api.nvim_buf_is_valid(scratch_buf) then
    vim.cmd("edit " .. scratch_path)
    scratch_buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(scratch_buf, 'filetype', 'markdown')
  end

  -- Create floating window
  local width = math.floor(vim.o.columns * 0.7)
  local height = math.floor(vim.o.lines * 0.6)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local opts = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded"
  }

  scratch_win = vim.api.nvim_open_win(scratch_buf, true, opts)
end

vim.keymap.set("n", "<leader>sp", ToggleScratchMarkdown, { noremap = true, silent = true })
