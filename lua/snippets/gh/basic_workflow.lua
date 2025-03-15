local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function fn(args, parent, user_args)
  return '' .. args[1][1] .. user_args .. ''
end

ls.add_snippets('yaml', {
  s("workflow basic", {
    t("name: "), i(1, "workflow-name"),
    t({"","run-name: run-"}), f(fn, {1}, { user_args = { "" }}),
    t({"","on: "}),
    t({"","  push: "}),
    t({"","    branches: "}),
    t({"","      - main"}),
    t({"","jobs: "}),
    t({"","  build: "}),
    t({"","    runs-on: ubuntu-latest"}),
    t({"","    steps: "}),
    t({"","      - name: Checkout code"}),
    t({"","        uses: actions/checkout@v2"}),
    t({"","  "}), f(fn, {1}, { user_args = { "" }}), t": ",
    t({"","    runs-on: ubuntu-latest"}),
    t({"","    steps: "}),
    t({"","      - name: "}), t"step-", f(fn, {1}, { user_args = { "" }}),
    t({"","        run: echo "}), t"'",  f(fn, {1}, { user_args = { "" }}) , t"'" })
})
