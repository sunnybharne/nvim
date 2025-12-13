local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Azure Pipelines download artifact snippet
ls.add_snippets('yaml', {
  s("ado-step-download-artifact", {
    t({"    - task: DownloadPipelineArtifact@2"}),
    t({"", "      inputs:"}),
    t({"", "        buildType: 'current'"}),
    t({"", "        artifactName: '"}), i(1, "artifactName"), t({"'"}),
    t({"", "        targetPath: '$(Pipeline.Workspace)' # path"}),
    t({"", ""}),
    i(0, ""),
  }),
})

