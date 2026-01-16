local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Azure Pipelines trigger snippet
ls.add_snippets('yaml', {
  s("trigger-lua", {
    t({"trigger:"}),
    t({"", "  branches:"}),
    t({"", "    include:"}),
    t({"", "    - main"}),
    t({"", "  paths:"}),
    t({"", "    include:"}),
    t({"", "    - path/**"}),
    t({"", "  batch: true"}),
    t({"", ""}),
  }),
})

