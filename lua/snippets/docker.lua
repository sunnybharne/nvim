-- Consolidated Docker snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Dockerfile snippets
ls.add_snippets('dockerfile', {
  -- Alpine base with bash, curl, and neovim
  -- FROM alpine:latest
  --
  --
  -- RUN apk add --no-cache \
  --     bash \
  --     curl \
  --     neovim
  --
  -- WORKDIR /app
  --
  -- CMD ["/bin/bash"]
  s("docker-alpine", {
    t({"FROM alpine:latest"}),
    t({"","",""}),
    t({"RUN apk add --no-cache \\"}),
    t({"    bash \\"}),
    t({"    curl \\"}),
    t({"    neovim"}),
    t({"",""}),
    t({"WORKDIR /app"}),
    t({"",""}),
    t({"CMD [\"/bin/bash\"]"}),
    i(0)
  }),
})
