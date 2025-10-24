-- Test file for clipboard functionality
-- Try copying this line with <Leader>y in visual mode
-- Then try pasting it in another application with Cmd+V

local function test_clipboard()
    print("This is a test line for clipboard functionality")
    print("Copy this text and paste it outside Neovim")
end

return test_clipboard