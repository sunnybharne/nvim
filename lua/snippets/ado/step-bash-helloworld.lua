local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Azure Pipelines step bash helloworld snippet
ls.add_snippets('yaml', {
  s("step-bash-helloworld-lua", {
    t({"    steps: "}),
    t({"", "    - script: "}), i(1, "echo \"Hello World\""),
    t({"", "      displayName: \""}), i(2, "step-bash"), t({"\""}),
    t({"", ""}),
    i(0, ""),
  }),
})

