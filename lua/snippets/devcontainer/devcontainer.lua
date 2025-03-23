local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Snippet for defining a Dev Container configuration block
ls.add_snippets('json', {
  s("dev-container-block", {
    t({
      "{",
      "  \"name\": \"Dev Container\",",
      "  \"build\": {",
      "    \"dockerfile\": \"./Dockerfile\"",
      "  },",
      "  \"settings\": {},",
      "  \"extensions\": [],",
      "  \"postCreateCommand\": \"\"",
      "}"
    })
  })
})
