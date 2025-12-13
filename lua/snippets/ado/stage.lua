local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Azure Pipelines stage snippet
ls.add_snippets('yaml', {
  s("ado-stage", {
    t({"stages:"}),
    t({"", "- stage: "}), i(1, "stage_name"),
    t({"", "  displayName: "}), i(2, "stage_name"),
    t({"", "  jobs:"}),
    t({"", "  - job: "}), i(3, "job_name"),
    t({"", "    displayName: "}), i(4, "job_name"),
    t({"", "    steps: "}),
    t({"", "    - script: echo \"Hello World\""}),
    t({"", "      displayName: \"Print Hello World\""}),
    t({"", ""}),
    i(0, ""),
  }),
})

