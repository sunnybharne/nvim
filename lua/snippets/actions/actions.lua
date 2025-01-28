local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
-- local i = ls.insert_node


-- Simple workflow
ls.add_snippets('yaml', {
  s("workflow", {
    t({
      "on:",
      "  push:",
      "    branches:",
      "      - main",
      "jobs:",
      "  build:",
      "    runs-on: ubuntu-latest",
      "    steps:",
      "      - name: Set up Node.js",
      "        uses: actions/checkout@v2"
    })
  })
})
