local previous_buffer = nil
local scratchpad_files = {}
local current_index = 1

function OpenScratchpad()
    local scratchpad_dir = vim.fn.stdpath("config") .. "/scratchpad/"
    scratchpad_files = vim.fn.glob(scratchpad_dir .. "*", false, true)

    if #scratchpad_files == 0 then
        print("No files found in the scratchpad folder")
        return
    end

    if vim.fn.bufname() == scratchpad_files[current_index] then
        if previous_buffer and vim.fn.bufexists(previous_buffer) == 1 then
            vim.cmd("buffer " .. previous_buffer)
            previous_buffer = nil
        else
            print("No previous buffer to return to")
        end
    else
        previous_buffer = vim.fn.bufnr()
        current_index = 1
        vim.cmd("edit " .. scratchpad_files[current_index])
        vim.bo.bufhidden = "wipe" -- Set buffer to be wiped when hidden
    end
end

function NextScratchpadFile()
    if #scratchpad_files == 0 then
        print("No files to cycle through")
        return
    end

    current_index = (current_index % #scratchpad_files) + 1
    vim.cmd("edit " .. scratchpad_files[current_index])
    vim.bo.bufhidden = "wipe" -- Set buffer to be wiped when hidden
end

vim.api.nvim_set_keymap('n', '<leader>sp', ':lua OpenScratchpad()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sn', ':lua NextScratchpadFile()<CR>', { noremap = true, silent = true })
