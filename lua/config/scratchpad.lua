local M = {}
local api = vim.api
local fn = vim.fn
local notify = vim.notify

-- scratchpad file navigation state
local previous_buffer = nil
local scratchpad_files = {}
local current_index = 1

local function load_scratchpad_files()
    local scratchpad_dir = fn.stdpath("config") .. "/scratchpad/"
    local entries = fn.globpath(scratchpad_dir, "*", false, true)
    local out = {}
    for _, f in ipairs(entries) do
        if fn.filereadable(f) == 1 then
            table.insert(out, f)
        end
    end
    return out
end

function M.open_scratchpad()
    scratchpad_files = load_scratchpad_files()
    if #scratchpad_files == 0 then
        notify("No files found in the scratchpad folder", vim.log.levels.INFO)
        return
    end

    local cur_name = api.nvim_buf_get_name(0)
    -- if current buffer is the current scratchpad file, try to return to previous
    if cur_name == scratchpad_files[current_index] then
        if previous_buffer and api.nvim_buf_is_valid(previous_buffer) then
            api.nvim_set_current_buf(previous_buffer)
            previous_buffer = nil
        else
            notify("No previous buffer to return to", vim.log.levels.INFO)
        end
        return
    end

    previous_buffer = api.nvim_get_current_buf()
    current_index = 1
    local target = scratchpad_files[current_index]
    if not target or target == "" or target == "null" then
        notify("Invalid scratchpad file", vim.log.levels.WARN)
        return
    end
    vim.cmd("edit " .. fn.fnameescape(target))
    vim.bo.bufhidden = "wipe"
end

function M.next_scratchpad()
    if #scratchpad_files == 0 then
        scratchpad_files = load_scratchpad_files()
        if #scratchpad_files == 0 then
            notify("No files to cycle through", vim.log.levels.INFO)
            return
        end
    end

    current_index = (current_index % #scratchpad_files) + 1
    local target = scratchpad_files[current_index]
    if not target or target == "" or target == "null" then
        notify("Invalid scratchpad file", vim.log.levels.WARN)
        return
    end
    vim.cmd("edit " .. fn.fnameescape(target))
    vim.bo.bufhidden = "wipe"
end

-- Snippet-display / floating scratchpad using LuaSnip
local has_luasnip, luasnip = pcall(require, "luasnip")

local function snippet_name(sn)
    if type(sn) ~= "table" then
        return tostring(sn)
    end
    return sn.name or sn.trigger or sn.trig or sn.description or "snippet"
end

-- NEW: load only user-created snippets from ~/.config/nvim/snippets/
local function load_user_snippets_for(ft)
    local snippets_dir = fn.stdpath("config") .. "/snippets/"
    local files = {}
    -- recursive glob for any files under snippets_dir
    local entries = fn.globpath(snippets_dir, "**/*", false, true)
    for _, f in ipairs(entries) do
        if fn.filereadable(f) == 1 then
            table.insert(files, f)
        end
    end

    local triggers = {}
    local function add(t)
        if t and t ~= "" then
            triggers[t] = true
        end
    end

    for _, fpath in ipairs(files) do
        local lower = fpath:lower()
        -- quick filter: prefer files that mention the filetype in their path, but if none match we'll still scan all
        if ft == "" or lower:find("/" .. ft:lower() .. "/") or lower:find("%." .. ft:lower() .. "%.") or lower:find("%-" .. ft:lower() .. "%.") or true then
            local ok, lines = pcall(fn.readfile, fpath)
            if not ok or not lines then goto continue end
            local content = table.concat(lines, "\n")

            -- If JSON, decode and extract "prefix" fields (VSCode-style)
            if lower:match("%.json$") then
                local ok2, tbl = pcall(fn.json_decode, content)
                if ok2 and type(tbl) == "table" then
                    for k, v in pairs(tbl) do
                        if type(v) == "table" then
                            if v.prefix then
                                if type(v.prefix) == "string" then add(v.prefix) end
                                if type(v.prefix) == "table" then for _, p in ipairs(v.prefix) do add(p) end end
                            else
                                -- fallback: top-level key may be the trigger/name
                                add(k)
                            end
                        end
                    end
                end
            end

            -- LuaSnip pattern: s("trigger", ... ) or s 'trigger'
            for trg in content:gmatch("s%s*%(%s*[\"']([%w%p_%-]+)[\"']") do
                add(trg)
            end

            -- Ultisnips pattern: snippet trigger ...
            for trg in content:gmatch("[\n\r]snippet%s+([%S]+)") do
                add(trg)
            end

            -- Generic JSON-like prefix: "prefix": "trg"
            for trg in content:gmatch([["prefix"%s*:%s*["']([^"']+)["']]) do
                add(trg)
            end
        end
        ::continue::
    end

    -- collect and return as array (filter by ft if possible)
    local out = {}
    for t, _ in pairs(triggers) do table.insert(out, t) end
    table.sort(out)
    return out
end

-- replace get_snippets_for to prefer user snippets folder; fallback to luasnip only if none found
local function get_snippets_for(ft)
    local user = load_user_snippets_for(ft)
    if user and #user > 0 then
        return user
    end

    -- fallback to existing luasnip discovery
    local out = {}
    if not ft or ft == "" then return out end

    if has_luasnip then
        if luasnip.snippets and luasnip.snippets[ft] then
            for _, sn in ipairs(luasnip.snippets[ft]) do
                table.insert(out, snippet_name(sn))
            end
        end

        if #out == 0 and type(luasnip.get_snippets) == "function" then
            local ok, res = pcall(luasnip.get_snippets, ft)
            if ok and res then
                for _, sn in ipairs(res) do
                    table.insert(out, snippet_name(sn))
                end
            end
        end

        if #out == 0 and ft:find("%.") then
            local base = ft:match("^[^.]+")
            if base and luasnip.snippets and luasnip.snippets[base] then
                for _, sn in ipairs(luasnip.snippets[base]) do
                    table.insert(out, snippet_name(sn))
                end
            end
        end
    end

    local seen, dedup = {}, {}
    for _, v in ipairs(out) do
        if not seen[v] then
            seen[v] = true
            table.insert(dedup, v)
        end
    end
    table.sort(dedup)
    return dedup
end

local function make_win(lines)
    local bufnr = api.nvim_create_buf(false, true)
    api.nvim_buf_set_option(bufnr, "bufhidden", "wipe")
    api.nvim_buf_set_option(bufnr, "modifiable", true)
    api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
    api.nvim_buf_set_option(bufnr, "modifiable", false)
    api.nvim_buf_set_option(bufnr, "filetype", "scratchpad")

    local width = 0
    for _, l in ipairs(lines) do if #l > width then width = #l end end
    if width < 20 then width = 20 end
    local height = #lines
    if height < 1 then height = 1 end
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2 - 1)

    local win_opts = {
        relative = "editor",
        row = (row < 0) and 0 or row,
        col = (col < 0) and 0 or col,
        width = width,
        height = height,
        style = "minimal",
        border = "rounded",
        zindex = 50,
    }

    local win = api.nvim_open_win(bufnr, true, win_opts)
    api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>bd!<CR>", { nowait = true, noremap = true, silent = true })
    api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", "<cmd>bd!<CR>", { nowait = true, noremap = true, silent = true })
    return bufnr, win
end

function M.show_for_filetype(ft)
    local header = "Snippets for: " .. (ft or "<unknown>")
    local lines = { header, string.rep("-", #header) }

    if not has_luasnip then
        table.insert(lines, "LuaSnip not installed or not loaded.")
    else
        local items = get_snippets_for(ft)
        if #items == 0 then
            table.insert(lines, "No snippets available for this filetype.")
        else
            for i, it in ipairs(items) do
                table.insert(lines, string.format("%d. %s", i, it))
            end
        end
    end

    make_win(lines)
end

function M.show()
    local ft = vim.bo.filetype or ""
    M.show_for_filetype(ft)
end

-- Smart snippets function that shows appropriate snippets based on file type
function M.show_smart_snippets()
    local ft = vim.bo.filetype or ""
    
    -- Check if it's a Terraform file
    if ft == "terraform" or ft == "hcl" then
        local terraform_file = fn.stdpath("config") .. "/scratchpad/terraform-snippets.md"
        if fn.filereadable(terraform_file) == 1 then
            vim.cmd("edit " .. fn.fnameescape(terraform_file))
            vim.bo.bufhidden = "wipe"
        else
            notify("Terraform snippets file not found", vim.log.levels.WARN)
        end
    -- Check if it's a TypeScript/JavaScript file (likely CDKTF)
    elseif ft == "typescript" or ft == "javascript" or ft == "ts" or ft == "js" then
        local cdktf_file = fn.stdpath("config") .. "/scratchpad/cdktf-snippets.md"
        if fn.filereadable(cdktf_file) == 1 then
            vim.cmd("edit " .. fn.fnameescape(cdktf_file))
            vim.bo.bufhidden = "wipe"
        else
            notify("CDKTF snippets file not found", vim.log.levels.WARN)
        end
    -- Check if it's a Bicep file
    elseif ft == "bicep" then
        local bicep_file = fn.stdpath("config") .. "/scratchpad/bicep-snippets.md"
        if fn.filereadable(bicep_file) == 1 then
            vim.cmd("edit " .. fn.fnameescape(bicep_file))
            vim.bo.bufhidden = "wipe"
        else
            -- Fall back to general snippets for this file type
            M.show_for_filetype(ft)
        end
    else
        -- Fall back to general snippets for this file type
        M.show_for_filetype(ft)
    end
end

-- Keymaps
vim.keymap.set("n", "<leader>sp", M.open_scratchpad, { desc = "Open scratchpad", noremap = true, silent = true })
vim.keymap.set("n", "<leader>sn", M.next_scratchpad, { desc = "Next scratchpad file", noremap = true, silent = true })
vim.keymap.set("n", "<space>hh", M.show, { desc = "Show snippets / scratchpad", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ts", M.show_smart_snippets, { desc = "Show Smart Snippets", noremap = true, silent = true })

return M
