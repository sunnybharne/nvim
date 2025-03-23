-- Load the LuaSnip module
local ls = require("luasnip")

-- Add snippets for Dockerfile
ls.add_snippets("dockerfile", {
    -- Define a snippet named "ubuntu_base"
    ls.snippet("ubuntu_base", {
        -- Add the snippet content as text nodes
        ls.text_node({
            "# Use a minimal Alpine base image",
            "FROM ubuntu:latest",
            "",
            "# Install required dependencies",
            "RUN apt-get update && apt-get install -y",
            "",
            "# Expose the default Jekyll port",
            "EXPOSE 4000",
        }),
    }),
})
