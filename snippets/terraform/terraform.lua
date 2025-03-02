local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
-- local i = ls.insert_node

-- Docker provider
ls.add_snippets('tf', {
  s("provider docker", {
    t("on: "),
    t({"","  push: "}),
    t({"","    branches: "}),
    t({"","      - main"}),
    t({"","    branches-ignore: "}),
    t({"","      - feature/experimental/**"}),
    t({"","    paths: "}),
    t({"","      - 'src/**'"}),
    t({"","      - '!src/experimental/**'"}),
    t({"","    paths-ignore: "}),
    t({"","      - 'src/experimental/**'"}),
    t({"","  pull_request: "}),
    t({"","    branches: "}),
    t({"","      - main"}),
    t({"","  label: "}),
    t({"","    types: "}),
    t({"","      - created"}),
    t({"","      - deleted"}),
    t({"","      - updated"}),
    t({"","  issue_comment: "}),
    t({"","    types: "}),
    t({"","      - created"})
  })
})


