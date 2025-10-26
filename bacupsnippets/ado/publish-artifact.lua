local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn

-- Azure Pipelines publish artifact task snippet
ls.add_snippets('yaml', {
  s("publish-artifact", {
    t({"  - task: PublishBuildArtifacts@1"}),
    t({"", "    displayName: 'Publish Artifacts'"}),
    t({"", "    inputs:"}),
    t({"", "      PathtoPublish: '$(build.artifactstagingdirectory)'"}),
    t({"", "      ArtifactName: 'drop'"}),
    t({"", "      publishLocation: 'Container'"}),
    t({""}),
    i(0, ""), -- Final insert node
  }),
})
