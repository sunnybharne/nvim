local term_win_id = nil
local term_buf_id = nil

-- Function to toggle floating terminal
vim.keymap.set("n", "<Space>tt", function()
  if term_win_id and vim.api.nvim_win_is_valid(term_win_id) then
    vim.api.nvim_win_close(term_win_id, true) -- Close terminal if it's open
    term_win_id = nil
    term_buf_id = nil
  else
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local opts = {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
      style = "minimal",
      border = "rounded",
    }

    term_buf_id = vim.api.nvim_create_buf(false, true)
    term_win_id = vim.api.nvim_open_win(term_buf_id, true, opts)

    vim.fn.termopen(vim.o.shell)
    vim.api.nvim_buf_set_option(term_buf_id, "bufhidden", "wipe")
    vim.cmd("startinsert")
  end
end, { noremap = true, silent = true })

-- Make Esc exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

