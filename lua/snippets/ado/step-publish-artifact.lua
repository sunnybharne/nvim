local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Azure Pipelines publish artifact snippet
ls.add_snippets('yaml', {
  s("ado-step-publish-artifact", {
    t({"    - task: PublishPipelineArtifact@1"}),
    t({"", "      inputs:"}),
    t({"", "        targetPath: '$(System.DefaultWorkingDirectory)/"}), i(1, "pathtofile"), t({"'"}),
    t({"", "        artifact: '"}), i(2, "artifactName"), t({"'"}),
    t({"", "        publishLocation: 'pipeline' # 'filepath'"}),
    t({"", "      displayName: '"}), i(3, "taskName"), t({"'"}),
    t({"", ""}),
    i(0, ""),
  }),
})

