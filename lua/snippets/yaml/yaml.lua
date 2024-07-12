local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('all', {
  s("trigger",
    t({
"name: pipelineName",
"",
"trigger:",
"  branches:",
"    include:",
"    - main",
"    - releases/*",
"    - feature/*",
"    exclude:",
"    - releases/old*",
"    - feature/*-working",
"  paths:",
"    include:",
"    - docs",
"    exclude:",
"    - docs/README.md",
"  tags:",
"    include:",
"    - v2.*",
"    exclude:",
"    - v2.0",
"",
    }))
})

