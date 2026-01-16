local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Terraform file function snippets
ls.add_snippets('terraform', {
  s("file-lua", {
    i(1, "file"),
    t(" = file(\"${path.module}/"),
    i(2, "policy.json"),
    t("\")"),
    i(0),
  }),
  s("files-lua", {
    t({"  "}),
    i(1, "files"),
    t("      = fileset(path.module, \""),
    i(2, "**/*.json"),
    t({"\")", "  "}),
    i(3, "files_maps"),
    t(" = { for x in local."), i(4, "files"), t(" : \"${basename(dirname(\"${path.cwd}/${x}\"))}-${jsondecode(\"${file(x)}\").name}-${jsondecode(\"${file(x)}\").metadata.version}\" => jsondecode(file(x)) }"),
    i(0),
  }),
  s("current_folder-lua", {
    i(1, "current_folder"),
    t(" = path.cwd"),
    i(0),
  }),
})

