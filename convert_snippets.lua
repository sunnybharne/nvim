#!/usr/bin/env lua

-- Script to convert LuaSnip snippets to the new format
-- Usage: lua convert_snippets.lua

local function convert_snippet_file(filepath)
    print("Converting: " .. filepath)
    
    local file = io.open(filepath, "r")
    if not file then
        print("Error: Could not open file " .. filepath)
        return
    end
    
    local content = file:read("*all")
    file:close()
    
    -- Pattern to match t({"line1","line2","line3"}) format
    local pattern = 't%(%{"([^"]+)","([^"]+)"(?:,"([^"]+)")*"}%)'
    
    -- More comprehensive pattern to match multiple t() calls in sequence
    local function convert_multiple_t_calls(text)
        -- Find sequences of t({"line",""}) calls and convert them
        local result = text:gsub('t%(%{"([^"]+)",""}%),\n%s*t%(%{"([^"]+)",""}%),\n%s*t%(%{"([^"]+)",""}%)', 
            function(line1, line2, line3)
                return string.format('t({\n      "%s",\n      "%s",\n      "%s"\n    })', line1, line2, line3)
            end)
        
        -- Handle two-line sequences
        result = result:gsub('t%(%{"([^"]+)",""}%),\n%s*t%(%{"([^"]+)",""}%)', 
            function(line1, line2)
                return string.format('t({\n      "%s",\n      "%s"\n    })', line1, line2)
            end)
        
        return result
    end
    
    local converted = convert_multiple_t_calls(content)
    
    -- Write back to file
    local outfile = io.open(filepath, "w")
    if outfile then
        outfile:write(converted)
        outfile:close()
        print("Converted: " .. filepath)
    else
        print("Error: Could not write to file " .. filepath)
    end
end

-- List of snippet files to convert
local snippet_files = {
    "lua/snippets/bicep/azure-resources.lua",
    "lua/snippets/bicep/bicep.lua", 
    "lua/snippets/terraform/terraform.lua",
    "lua/snippets/terraform/azure-resources.lua",
    "lua/snippets/terraform/aws-resources.lua",
    "lua/snippets/terraform/simple-resources.lua",
    "lua/snippets/terraform/variables.lua",
    "lua/snippets/terraform/patterns.lua",
    "lua/snippets/terraform/provider.lua",
    "lua/snippets/terraform/settings.lua",
    "lua/snippets/terraform/mg.lua",
    "lua/snippets/typescript/cdktf.lua",
    "lua/snippets/typescript/cdktf-aws.lua",
    "lua/snippets/typescript/cdktf-basic.lua",
    "lua/snippets/docker/basic.lua",
    "lua/snippets/docker/compose.lua",
    "lua/snippets/docker/ubuntu.lua",
    "lua/snippets/github-actions/basic.lua",
    "lua/snippets/pester/describe.lua",
    "lua/snippets/pester/it.lua",
    "lua/snippets/pester/boilerplate.lua",
    "lua/snippets/pester/beforeall.lua",
    "lua/snippets/pester/afterall.lua",
    "lua/snippets/azure/ado.lua"
}

print("Starting snippet conversion...")

for _, filepath in ipairs(snippet_files) do
    convert_snippet_file(filepath)
end

print("Conversion complete!")
